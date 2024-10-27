/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Campaigns;

import CampaignsDAO.CampaignDAOforUsers;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author admin
 */
@WebServlet(name = "JoinCampaign", urlPatterns = {"/JoinCampaign"})
public class JoinCampaign extends HttpServlet {

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

        String campaignId = request.getParameter("campaignId");
        HttpSession session = request.getSession();

        Integer userId = (Integer) session.getAttribute("user_id");
        if (userId == null) {
            userId = 1; // Sử dụng giá trị mặc định cho phát triển
        }

        boolean joined = false;

        if (userId != null && campaignId != null) {
            CampaignDAOforUsers dao = new CampaignDAOforUsers();

            if (dao.isUserInCampaign(userId, Integer.parseInt(campaignId))) {
                // Người dùng đã tham gia => Xóa họ khỏi chiến dịch
                dao.removeUserFromCampaign(userId, Integer.parseInt(campaignId));
            } else {
                // Người dùng chưa tham gia => Thêm họ vào chiến dịch
                dao.addUserToCampaign(userId, Integer.parseInt(campaignId));
                joined = true;
            }
        }

        // Chuyển hướng hoặc tải lại trang để hiển thị cập nhật
        response.sendRedirect("Campaign");
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
