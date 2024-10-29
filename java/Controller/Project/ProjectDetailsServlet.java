package Servlet.Project;

import DAO.ProjectDAO;
import DAO.CampaignDAO;
import DAO.ProjectEventDAO;
import DAO.ProjectReviewDAO;
import Model.Project;
import Model.Campaign;
import Model.ProjectEvent;
import Model.ProjectReview;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/project-details")
public class ProjectDetailsServlet extends HttpServlet {

    private ProjectDAO projectDAO;
    private CampaignDAO campaignDAO;
    private ProjectEventDAO projectEventDAO;
    private ProjectReviewDAO projectReviewDAO;

    public void init() {
        projectDAO = new ProjectDAO();
        campaignDAO = new CampaignDAO();
        projectEventDAO = new ProjectEventDAO();
        projectReviewDAO = new ProjectReviewDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectIdStr = request.getParameter("id");

        if (projectIdStr != null && !projectIdStr.isEmpty()) {
            try {
                int projectId = Integer.parseInt(projectIdStr);

                // Fetch project details
                Project project = projectDAO.selectProject(projectId);

                if (project != null) {
                    // Fetch associated campaigns
                    List<Campaign> campaigns = campaignDAO.getCampaignsByProjectId(projectId);

                    // Fetch associated project events
                    List<ProjectEvent> projectEvents = projectEventDAO.getEventsByProjectId(projectId);

                    // Fetch associated project reviews
                    List<ProjectReview> projectReviews = projectReviewDAO.getReviewsByProjectId(projectId);

                    // Set attributes for JSP
                    request.setAttribute("project", project);
                    request.setAttribute("campaigns", campaigns);
                    request.setAttribute("projectEvents", projectEvents);
                    request.setAttribute("projectReviews", projectReviews);

                    // Forward to JSP
                    request.getRequestDispatcher("/project-details.jsp").forward(request, response);
                } else {
                    // Project not found
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Project not found");
                }
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid project ID");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Project ID is required");
        }
    }
}