/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerQuang;

import ModelQuang.Organization;
import ModelQuang.Project;
import ModelQuang.User;
import ModelQuang.Volunteer;
import ModelQuang.VolunteerCV;
import dalQuang.DAO;
import dalQuang.OrganizationDAO;
import dalQuang.ProjectDAO;
import dalQuang.VolunteerDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author admin
 */
public class volunteerapproval extends HttpServlet {

    DAO d = new DAO();
    VolunteerDAO vld = new VolunteerDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet volunteerapproval</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet volunteerapproval at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.setAttribute("acc", d.selectUserById(5));
        User uss = (User) session.getAttribute("acc");
//        Staff staff = stD.getStaffByUserId(user.getUserId());
//        OrganizationDAO od = new OrganizationDAO();
        List<Volunteer> allvolun = vld.getAllVolunteers();
        List<VolunteerCV> allcv = new ArrayList<>();
        for (User user : d.getAll()) {
            if (vld.VolunteerCVByUserid(user.getUserId()) != null && user.getRole().equals("donor")) {
                allcv.add(vld.VolunteerCVByUserid(user.getUserId()));
            }
        }
        

        request.setAttribute("pendingCV", allcv);
        request.setAttribute("activeInactiveVolunteers", allvolun);

        request.setAttribute("uss", uss);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Volunteer_Manger.jsp");
        dispatcher.forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String actionvl = request.getParameter("actionvl");
            String volunid = request.getParameter("volunid");
            String actioncv = request.getParameter("actioncv");
            String cvid = request.getParameter("cvid");
            if (volunid == null) {
                User u = d.selectUserById(Integer.parseInt(cvid));
                if (actioncv.equals("approve")) {
                    u.setRole("volunteer");
                    d.update(u);
                    Volunteer vnew = new Volunteer(0, u, "approved", new Date());
                    vld.insertVolunteer(vnew);
                    
                }else if (actioncv.equals("reject")) {
                    vld.deleteVolunteerCV(vld.VolunteerCVByUserid(u.getUserId()).getCvId());
                }
            }else if (cvid == null) {
                User u = d.selectUserById(Integer.parseInt(volunid));
                u.setRole("donor");
                d.update(u);
                vld.deleteVolunteer(vld.VolunteerByUserId(u.getUserId()).getVolunteerId());
                vld.deleteVolunteerCV(vld.VolunteerCVByUserid(Integer.parseInt(volunid)).getCvId());
            }

            response.sendRedirect("volunteerapproval");

        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
