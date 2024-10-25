/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.BlogManagement;

import Model.News;
import Model.NewsCategories;
import NewsDAO.NewsDAObyAdmin;
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
@WebServlet(name = "AddBlog", urlPatterns = {"/AddBlog"})
public class AddBlog extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");

        String newsTitle = request.getParameter("newsTitle");
        String newsContent = request.getParameter("newsContent");
        String newMessage = request.getParameter("newsMessage");
        String categoryID = request.getParameter("category");
        String newImageURL = request.getParameter("newImageURL"); // Lấy URL hình ảnh mới

        // ID người dùng (lấy từ session hoặc hardcode tạm thời)
        String userId = "1"; // Hardcode userId, có thể thay bằng giá trị từ session
        NewsDAObyAdmin dao = new NewsDAObyAdmin();
        List<NewsCategories> listC = dao.getAllCategory();
        dao.insertNews(newsTitle, categoryID, newsContent, newMessage, userId, newImageURL);
        request.setAttribute("listCC", listC);
        request.getRequestDispatcher("Dashboard/AddBlog.jsp").forward(request, response);

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
