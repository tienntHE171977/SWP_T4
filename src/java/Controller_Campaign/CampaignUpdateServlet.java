package Controller_Campaign;

import DAO_C.CampaignDAO;
import Model_C.Campaign;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/campaign-update")
public class CampaignUpdateServlet extends HttpServlet {
    private CampaignDAO campaignDAO;

    public void init() {
        campaignDAO = new CampaignDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Campaign existingCampaign = campaignDAO.getCampaignById(id);
        request.setAttribute("campaign", existingCampaign);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/campaign-update.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int campaignId = Integer.parseInt(request.getParameter("campaignId"));
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            int locationId = Integer.parseInt(request.getParameter("locationId"));
            String description = request.getParameter("description");
            String job = request.getParameter("job");
            boolean isActive = request.getParameter("isActive") != null;

            Campaign campaign = new Campaign();
            campaign.setCampaignId(campaignId);
            campaign.setProjectId(projectId);
            campaign.setLocationId(locationId);
            campaign.setDescription(description);
            campaign.setJob(job);
            campaign.setActive(isActive);

            campaignDAO.updateCampaign(campaign);
            response.sendRedirect(request.getContextPath() + "/project-campaign-manage?projectId=" + projectId);
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
}