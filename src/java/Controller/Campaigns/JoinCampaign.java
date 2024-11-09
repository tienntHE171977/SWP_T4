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
import model.User;

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
    response.setContentType("application/json;charset=UTF-8"); // Thiết lập kiểu nội dung cho phản hồi JSON

    String campaignId = request.getParameter("campaignId");
    HttpSession session = request.getSession();

    User user = (User) session.getAttribute("acc");
        int userId = user.getUserId();
        if (user == null) {
            response.sendRedirect("login");  // Chỉ dùng cho phát triển
        }

    boolean joined = false;
    StringBuilder jsonResponse = new StringBuilder(); // Sử dụng StringBuilder để xây dựng chuỗi JSON

    if (user != null && campaignId != null) {
        CampaignDAOforUsers dao = new CampaignDAOforUsers();
        if (!dao.doesUserHaveVolunteerId(userId)) {
            // Người dùng không có volunteer_id
            jsonResponse.append("{\"success\": false, \"message\": \"Người dùng chưa đăng ký Volunteer.\"}"); // Chuỗi JSON thông báo lỗi
            response.getWriter().write(jsonResponse.toString()); // Trả về phản hồi JSON
            return; // Dừng xử lý
        }

        // Kiểm tra người dùng đã tham gia chiến dịch chưa
        if (dao.isUserInCampaign(userId, Integer.parseInt(campaignId))) {
            // Nếu đã tham gia, xóa họ khỏi chiến dịch
            dao.removeUserFromCampaign(userId, Integer.parseInt(campaignId));
        } else {
            // Nếu chưa tham gia, thêm họ vào chiến dịch
            dao.addUserToCampaign(userId, Integer.parseInt(campaignId));
            joined = true; // Đánh dấu là đã tham gia
        }
    } else {
        // Trả về lỗi nếu không có userId hoặc campaignId
        jsonResponse.append("{\"success\": false, \"message\": \"Thiếu thông tin người dùng hoặc chiến dịch.\"}"); // Thông báo lỗi nếu thiếu thông tin
        response.getWriter().write(jsonResponse.toString());
        return;
    }

    // Trả về phản hồi JSON
    jsonResponse.setLength(0); // Xóa nội dung cũ
    jsonResponse.append("{\"joined\": ").append(joined).append("}"); // Chỉ định thông tin đã tham gia
    response.getWriter().write(jsonResponse.toString());
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
