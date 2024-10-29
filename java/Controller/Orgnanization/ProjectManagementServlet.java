package Servlet.Organization;

import DAO.ProjectDAO;
import Model.Project;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/project-management")
public class ProjectManagementServlet extends HttpServlet {
    private ProjectDAO projectDAO;

    public void init() {
        projectDAO = new ProjectDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String orgIdStr = request.getParameter("orgId");
            if (orgIdStr == null || orgIdStr.trim().isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Organization ID is required");
                return;
            }

            int organizationId = Integer.parseInt(orgIdStr);
            List<Project> projects = projectDAO.getProjectByOrgId(organizationId);
            
            request.setAttribute("projects", projects);
            request.setAttribute("organizationId", organizationId);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/project-management.jsp");
            dispatcher.forward(request, response);
            
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid organization ID format");
        } catch (Exception e) {
            System.out.println("Error in doGet: " + e.getMessage());
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            Project project = projectDAO.selectProject(projectId);
            
            if (project != null) {
                project.setTitle(request.getParameter("title"));
                project.setDescription(request.getParameter("description"));
                
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date startDate = dateFormat.parse(request.getParameter("startDate"));
                Date endDate = dateFormat.parse(request.getParameter("endDate"));
                
                project.setStartDate(startDate);
                project.setEndDate(endDate);
                project.setRoleProject(request.getParameter("roleProject"));
                
                projectDAO.updateProject(project);
            }
            
            response.sendRedirect(request.getContextPath() + "/project-management?orgId=" + project.getCreatedByOrg());
            
        } catch (SQLException | ParseException ex) {
            System.out.println("Error in doPost: " + ex.getMessage());
            ex.printStackTrace();
            throw new ServletException(ex);
        }
    }
}