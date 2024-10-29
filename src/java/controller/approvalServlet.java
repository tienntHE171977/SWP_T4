/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import Model.User;
import Model.Organization;
import Model.Project;
import Model.Staff;
import dal.DAO;
import dal.OrganizationDAO;
import dal.ProjectDAO;
import dal.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class approvalServlet extends HttpServlet {

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
            out.println("<title>Servlet approvalServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet approvalServlet at " + request.getContextPath() + "</h1>");
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
        DAO d = new DAO();
//         StaffDAO stD = new StaffDAO();
        HttpSession session = request.getSession();
        session.setAttribute("acc", d.selectUserById(1));
        User uss = (User) session.getAttribute("acc");
//        Staff staff = stD.getStaffByUserId(user.getUserId());
        OrganizationDAO od = new OrganizationDAO();
        List<Organization> organizations = od.getWaitApprovelOrganizations();
        ProjectDAO pd = new ProjectDAO();
        List<Project> pwait = pd.getAllProjectsWait();
//        String queryo = request.getParameter("query");
//        List<Organization> orgsearch = new ArrayList<>();
//        if (queryo == null) {
//            orgsearch=organizations;
//        }else {
//            for (Organization organization : organizations) {
//                if (organization.getName().contains(queryo)) {
//                    orgsearch.add(organization);
//                }
//            }
//        }
        request.setAttribute("uss", uss);
        request.setAttribute("pwait", pwait);
        request.setAttribute("organiztions", organizations);
//        request.setAttribute("notic", list);
        if (uss != null) {
            request.getRequestDispatcher("staff_approval.jsp").forward(request, response);
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
        OrganizationDAO od = new OrganizationDAO();
        ProjectDAO prd = new ProjectDAO();
//        List<Organization> organizations = od.getWaitApprovelOrganizations();
//        List<Project> project = prd.getAllProjectsWait();
        String organizationId = request.getParameter("orgid");
        String status = request.getParameter("sta");
        String projectid = request.getParameter("prjid");
        String statusp = request.getParameter("statusp");
//        System.out.println("Organization ID: " + organizationId);
//        System.out.println("Status: " + status);
//        System.out.println("Project ID: " + projectid);
//        System.out.println("Statusp: " + statusp);
        try {
            if (projectid== null) {
                Organization o1 = od.getOById(Integer.parseInt(organizationId));
                o1.setOrganizationStatus(status);
                o1.setStaffId(2);
                od.update(o1);
            
            } else if (organizationId== null) {
                Project p1 = prd.getProjectById(Integer.parseInt(projectid));
                p1.setStatus(statusp);
                p1.setStaffId(2);
                prd.update(p1);
            }
        } catch (Exception e) {
        }
            
            
        

//        String statusp = request.getParameter("");
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
