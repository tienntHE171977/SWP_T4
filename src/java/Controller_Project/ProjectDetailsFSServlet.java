package Controller_Project;

import DAO_C.ProjectDAO;
import DAO_C.CampaignDAO;
import DAO_C.ProjectEventDAO;
import DAO_C.ProjectReviewDAO;
import Model_C.Project;
import Model_C.Campaign;
import Model_C.ProjectEvent;
import Model_C.ProjectReview;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/project-details-fs")
public class ProjectDetailsFSServlet extends HttpServlet {

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
                    request.getRequestDispatcher("/project-details-fs.jsp").forward(request, response);
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
