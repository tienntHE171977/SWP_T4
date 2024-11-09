package Controller_Organization;

import DAO_C.ProjectEventDAO;
import DAO_C.ProjectDAO;
import Model_C.ProjectEvent;
import Model_C.Project;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/project-event-manage")
public class ProjectEventManageServlet extends HttpServlet {
    private ProjectEventDAO eventDAO;
    private ProjectDAO projectDAO;

    public void init() {
        eventDAO = new ProjectEventDAO();
        projectDAO = new ProjectDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String projectIdStr = request.getParameter("projectId");
        
        if (projectIdStr == null || projectIdStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Project ID is required");
            return;
        }
        
        try {
            int projectId = Integer.parseInt(projectIdStr);
            
            // Get the project to access its organization ID
            Project project = projectDAO.selectProject(projectId);
            if (project == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Project not found");
                return;
            }
            
            List<ProjectEvent> events = eventDAO.getEventsByProjectId(projectId);
            request.setAttribute("events", events);
            request.setAttribute("projectId", projectId);
            request.setAttribute("organizationId", project.getCreatedByOrg());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/project-event-manage.jsp");
            dispatcher.forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/project-management");
        }
    }
}