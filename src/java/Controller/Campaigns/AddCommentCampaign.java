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
@WebServlet(name = "AddCommentCampaign", urlPatterns = {"/AddCommentCampaign"})
public class AddCommentCampaign extends HttpServlet {

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
        response.setContentType("application/json;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");

    String comment = request.getParameter("comment");
    String campaignId = request.getParameter("CID");
    HttpSession session = request.getSession();
    Integer userId = (Integer) session.getAttribute("user_id");
    if (userId == null) {
        userId = 1;  // Chỉ dùng cho phát triển
    }

    boolean success = false;
    String errorMessage = ""; 

    // Log các giá trị tham số để xác nhận xem dữ liệu có được nhận đúng không
    System.out.println("Comment: " + comment);
    System.out.println("Campaign ID: " + campaignId);
    System.out.println("User ID: " + userId);

    if (comment != null && !comment.trim().isEmpty() && campaignId != null) {
        try {
            int campaignIdInt = Integer.parseInt(campaignId);
            CampaignDAOforUsers dao = new CampaignDAOforUsers();
            dao.insertCommentCampaign(campaignIdInt, userId, comment);
            System.out.println("Comment added successfully to database.");
            success = true;
        } catch (NumberFormatException e) {
            errorMessage = "Invalid campaign ID format";
            System.err.println(errorMessage);
        } catch (Exception e) {
            errorMessage = "Database error: " + e.getMessage();
            e.printStackTrace();
        }
    } else {
        errorMessage = "Missing comment or campaign ID";
        System.err.println(errorMessage);
    }

    try (PrintWriter out = response.getWriter()) {
        out.print("{\"success\":" + success + ", \"message\": \"" + (success ? "Comment added" : errorMessage) + "\"}");
        out.flush();
    }
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
