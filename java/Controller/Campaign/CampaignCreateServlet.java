package Servlet.Campaign;

import DAO.CampaignDAO;
import Model.Campaign;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

@WebServlet("/campaign-create")
public class CampaignCreateServlet extends HttpServlet {
    private CampaignDAO campaignDAO;

    public void init() {
        campaignDAO = new CampaignDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Bỏ phần lấy nextCampaignId
        String projectId = request.getParameter("projectId");
        request.setAttribute("projectId", projectId);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/campaign-create.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Bỏ phần lấy campaignId
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            int locationId = Integer.parseInt(request.getParameter("locationId"));
            String description = request.getParameter("description");
            String job = request.getParameter("job");
            boolean isActive = request.getParameter("isActive") != null;

            Campaign campaign = new Campaign();
            // Không set campaignId nữa
            campaign.setProjectId(projectId);
            campaign.setLocationId(locationId);
            campaign.setDescription(description);
            campaign.setJob(job);
            campaign.setActive(isActive);
            campaign.setCreatedAt(new Date());

            campaignDAO.createCampaign(campaign);

            response.sendRedirect(request.getContextPath() + "/project-campaign-manage?projectId=" + projectId);
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
}