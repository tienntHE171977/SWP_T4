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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String comment = request.getParameter("comment");
        String campaignId = request.getParameter("CID"); // Đảm bảo tên tham số khớp

        HttpSession session = request.getSession();
        // Giả định userId là 1 (thay đổi theo cách bạn lấy userId thực tế)
        Integer userId = (Integer) session.getAttribute("user_id"); // Cần xác thực có userId trong session
        if (userId == null) {
            userId = 1; // Thay đổi này để phục vụ mục đích phát triển
        }

        if (comment != null && !comment.trim().isEmpty() && userId != null && campaignId != null) {
            try {
                int campaignIdInt = Integer.parseInt(campaignId); // Chuyển đổi campaignId sang int

                CampaignDAOforUsers dao = new CampaignDAOforUsers();
                dao.insertCommentCampaign(campaignIdInt, userId, comment);

                // Điều hướng lại đến trang Campaign (hoặc trang bạn muốn hiển thị bình luận)
                response.sendRedirect("Campaign"); // Chuyển hướng đến trang có campaignId
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Invalid campaign ID.");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response); // Chuyển hướng đến trang lỗi
            }
        } else {
            request.setAttribute("errorMessage", "Comment cannot be empty.");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response); // Chuyển hướng đến trang lỗi
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
