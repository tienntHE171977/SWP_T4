package Controller_Project;

import CampaignsDAO.CampaignDAOforUsers;
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
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.User;

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
        String projectID = request.getParameter("id");
        String CID = request.getParameter("CID");
        CampaignDAOforUsers dao = new CampaignDAOforUsers();
        // Lấy project ID từ campaign ID nếu CID có trong request
        String projectIDFromCID = (CID != null) ? dao.getProjectIDByCampaignID(CID) : null;

        // Lấy project ID từ request
        // Ưu tiên PID từ request nếu có, nếu không thì dùng PID từ CID
        String PID = (projectID != null && !projectID.isEmpty()) ? projectID : projectIDFromCID;
        if (PID == null || PID.isEmpty()) {
            PID = "34"; // Giá trị mặc định
        }
        int projectId = 0;
        if(projectID == null){
            projectId = Integer.parseInt(PID);
        } else if(projectID != null){
            projectId = Integer.parseInt(projectID);
        }

        // Fetch project details
        Project project = projectDAO.selectProject(projectId);

        // Fetch associated campaigns
        // Lấy ID từ session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");
        int userId = user.getUserId();
        if (user == null) {
            response.sendRedirect("login");  // Chỉ dùng cho phát triển
        }

        List<model.Campaign> campaigns = dao.getAllCampaignsforPid(PID);
        Map<Integer, Boolean> userJoinedCampaigns = new HashMap<>();

        // Kiểm tra xem người dùng có tham gia các chiến dịch không
        if (user != null) {
            for (model.Campaign campaign : campaigns) {
                boolean isJoined = dao.isUserInCampaign(userId, campaign.getCampaignID());
                userJoinedCampaigns.put(campaign.getCampaignID(), isJoined);
            }
        }

        request.setAttribute("campaigns", campaigns);
        request.setAttribute("userJoinedCampaigns", userJoinedCampaigns);

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

    }
}
