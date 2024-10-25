/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.BlogManagement;

import Model.News;
import NewsDAO.NewsDAObyAdmin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author admin
 */
@WebServlet(name = "EditBlog", urlPatterns = {"/EditBlog"})
public class EditBlog extends HttpServlet {

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
        String postID = request.getParameter("newsID");
        String newsTitle = request.getParameter("newsTitle");
        String newsContent = request.getParameter("newsContent");
        String newMessage = request.getParameter("newsMessage");
        String categoryID = request.getParameter("category");
        String newImageURL = request.getParameter("newImageURL"); // Lấy URL hình ảnh mới

        NewsDAObyAdmin dao = new NewsDAObyAdmin();
        News currentNews = dao.getNewsByID(postID); 

        // Kiểm tra nếu người dùng không nhập URL hình ảnh mới, giữ nguyên URL ảnh cũ
        String imagePath = (newImageURL == null || newImageURL.isEmpty()) ? currentNews.getImage() : newImageURL;
        dao.editNews(newsTitle, newsContent, newMessage, imagePath, categoryID, postID);

        response.sendRedirect("BlogList");
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
