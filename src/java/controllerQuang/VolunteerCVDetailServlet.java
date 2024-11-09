/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerQuang;

import model.User;
import ModelQuang.VolunteerCV;
import dalQuang.DAO;
import dalQuang.VolunteerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class VolunteerCVDetailServlet extends HttpServlet {

    VolunteerDAO volunteerdao = new VolunteerDAO();
    DAO userdao = new DAO();

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
            out.println("<title>Servlet VolunteerCVDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VolunteerCVDetailServlet at " + request.getContextPath() + "</h1>");
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
        try {
            // Get organization ID from request parameter
            String useridraw = request.getParameter("id");
            int userid = Integer.parseInt(useridraw);
            // Get organization details
            User user = userdao.selectUserById(userid);

            if (user != null) {
                // Get all projects for this organization
                VolunteerCV cv = volunteerdao.VolunteerCVByUserid(userid);

                // Set attributes for JSP
                request.setAttribute("user", user);
                request.setAttribute("cv", cv);

                // Forward to JSP page
                request.getRequestDispatcher("CVManageDetail.jsp").forward(request, response);

            } else {
                // Handle organization not found
                response.sendRedirect("error-page.jsp"); // You should create this page
            }

        } catch (NumberFormatException e) {
            // Handle invalid ID parameter
            response.sendRedirect("error-page.jsp"); // You should create this page
        }
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
        processRequest(request, response);
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
