/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Campaigns;

import CampaignsDAO.CampaignDAOforUsers;
import Model.CampaignComment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author admin
 */
@WebServlet(name = "Campaign_1", urlPatterns = {"/Campaign_1"})
public class Campaign extends HttpServlet {

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
        String CID = request.getParameter("CID");
        CampaignDAOforUsers dao = new CampaignDAOforUsers();
        // Lấy project ID từ campaign ID nếu CID có trong request
        String projectIDFromCID = (CID != null) ? dao.getProjectIDByCampaignID(CID) : null;

        // Lấy project ID từ request
        String projectIDFromRequest = request.getParameter("PID");

        // Ưu tiên PID từ request nếu có, nếu không thì dùng PID từ CID
        String PID = (projectIDFromRequest != null && !projectIDFromRequest.isEmpty()) ? projectIDFromRequest : projectIDFromCID;
        if (PID == null || PID.isEmpty()) {
            PID = "6"; // Giá trị mặc định
        }
        // Lấy ID từ session
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");
        if (userId == null) {
            userId = 1;
        }

        List<Model.Campaign> campaigns = dao.getAllCampaignsforPid(PID);
        Map<Integer, Boolean> userJoinedCampaigns = new HashMap<>();

        // Kiểm tra xem người dùng có tham gia các chiến dịch không
        if (userId != null) {
            for (Model.Campaign campaign : campaigns) {
                boolean isJoined = dao.isUserInCampaign(userId, campaign.getCampaignID());
                userJoinedCampaigns.put(campaign.getCampaignID(), isJoined);
            }
        }

        request.setAttribute("campaigns", campaigns);
        request.setAttribute("userJoinedCampaigns", userJoinedCampaigns);
        request.getRequestDispatcher("project-campaigns.jsp").forward(request, response);

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
        processRequest(request, response);
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
        processRequest(request, response);
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
