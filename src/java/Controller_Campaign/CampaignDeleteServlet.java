package Controller_Campaign;

import DAO_C.CampaignDAO;
import Model_C.Campaign;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/campaign-delete")
public class CampaignDeleteServlet extends HttpServlet {
    private CampaignDAO campaignDAO;

    public void init() {
        campaignDAO = new CampaignDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int campaignId = Integer.parseInt(request.getParameter("id"));
            
            // Get project ID before deleting the campaign
            Campaign campaign = campaignDAO.getCampaignById(campaignId);
            int projectId = campaign.getProjectId();
            
            // Delete the campaign
            campaignDAO.deleteCampaign(campaignId);
            
            // Redirect back to campaign list with project ID
            response.sendRedirect(request.getContextPath() + "/project-campaign-manage?projectId=" + projectId);
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
}