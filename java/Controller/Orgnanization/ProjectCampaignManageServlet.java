package Servlet.Organization;

import DAO.CampaignDAO;
import DAO.ProjectDAO;
import Model.Campaign;
import Model.Project;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet("/project-campaign-manage")
public class ProjectCampaignManageServlet extends HttpServlet {
    private CampaignDAO campaignDAO;
    private ProjectDAO projectDAO;

    public void init() {
        campaignDAO = new CampaignDAO();
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
            
            List<Campaign> campaigns = campaignDAO.getCampaignsByProjectId(projectId);
            request.setAttribute("campaigns", campaigns);
            request.setAttribute("projectId", projectId);
            request.setAttribute("organizationId", project.getCreatedByOrg());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/project-campaign-manage.jsp");
            dispatcher.forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/project-management");
        }
    }
}