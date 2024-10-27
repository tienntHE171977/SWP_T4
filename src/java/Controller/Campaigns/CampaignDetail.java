/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Campaigns;

import CampaignsDAO.CampaignDAOforAdminUser;
import Model.CampaignComment;
import Model.CampaignMembers;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "CampaignDetail", urlPatterns = {"/CampaignDetail"})
public class CampaignDetail extends HttpServlet {

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
        String actionType = request.getParameter("actionType") != null ? request.getParameter("actionType") : "view";
        CampaignDAOforAdminUser dao = new CampaignDAOforAdminUser();

        // Xử lý yêu cầu xem chiến dịch và các thành viên
        Model.Campaign detail = dao.getCampaignByID(campaignId);
        switch (actionType) {
            case "view":
                if (detail != null) {
                    List<Model.CampaignMembers> listM = dao.getAllCampaignMembers(campaignId);
                    request.setAttribute("detail", detail);
                    request.setAttribute("listM", listM);
                    // Lấy các bình luận theo ID chiến dịch
                    List<CampaignComment> listCC = dao.getCommentbyCampaignID(campaignId);
                    request.setAttribute("listCC", listCC);
                    // lấy từng thành viên
                    // Chuyển hướng tới trang xem chiến dịch
                    request.getRequestDispatcher("Campaign/campaign_detail.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Chiến dịch không tồn tại.");
                    request.getRequestDispatcher("ErrorPage.jsp").forward(request, response);
                }
                break;

            case "edit":
                request.setAttribute("detail", detail);
                request.getRequestDispatcher("Campaign/campaign_updated.jsp").forward(request, response);
                break;

            default:
                response.sendRedirect("CampaignManage");
                break;
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
