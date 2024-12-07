/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerQuang;

import ModelQuang.User;
import ModelQuang.Organization;
import ModelQuang.Project;
import ModelQuang.ProjectCategory;
import ModelQuang.Staff;
import ModelQuang.Volunteer;
import dalQuang.DAO;
import dalQuang.OrganizationDAO;
import dalQuang.ProjectCategoryDAO;
import dalQuang.ProjectDAO;
import dalQuang.StaffDAO;
import dalQuang.VolunteerDAO;
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
import javax.print.attribute.standard.PDLOverrideSupported;

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
        ProjectDAO pd = new ProjectDAO();
        session.setAttribute("acc", d.selectUserById(5));
        User uss = (User) session.getAttribute("acc");
//        Staff staff = stD.getStaffByUserId(user.getUserId());
//        OrganizationDAO od = new OrganizationDAO();
        List<Project> active = new ArrayList<>();
        List<Project> inactive = new ArrayList<>();
        for (Project project : pd.getAllProjects()) {
            if (!project.getStatus().equalsIgnoreCase("pending") && (project.getEndDate().getTime() >= new Date().getTime())) {
                active.add(project);
            }else if (!project.getStatus().equalsIgnoreCase("pending") && (project.getEndDate().getTime() < new Date().getTime())) {
                inactive.add(project);
            }
        }

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
        request.setAttribute("projectactive", active);
        request.setAttribute("inactive", inactive);
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
        ProjectCategoryDAO category = new ProjectCategoryDAO();
        ProjectDAO prd = new ProjectDAO();
        StaffDAO stD = new StaffDAO();
//   
        String prjappId = request.getParameter("orgid");
        String status = request.getParameter("sta");
        String projectid = request.getParameter("prjid");
        String statusp = request.getParameter("statusp");
        HttpSession session = request.getSession();
//        session.setAttribute("acc", d.selectUserById(5));
        User uss = (User) session.getAttribute("acc");
        Staff staff = stD.getStaffByUserId(uss.getUserId());

        try {
            if (projectid == null) {
                     category.deleteAllProjectCate(Integer.parseInt(prjappId));
                     prd.deletePrj(Integer.parseInt(prjappId));

            } else if (prjappId == null) {
                if (statusp.equals("approved")) {
                    Project p1 = prd.getProjectById(Integer.parseInt(projectid));
                    p1.setStatus(statusp);
                    p1.setStaffId(staff.getStaffId());
                    p1.setCreatedAt(new Date());
                    prd.update(p1);
                } else {
                    category.deleteAllProjectCate(Integer.parseInt(projectid));
                    prd.deletePrj(Integer.parseInt(projectid));
                }

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
