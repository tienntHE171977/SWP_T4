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
@WebServlet(name = "SearchBlogs", urlPatterns = {"/SearchBlogs"})
public class SearchBlogs extends HttpServlet {

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
        String txtSearch = request.getParameter("txt");
        String cateID = request.getParameter("cateID");
        String indexPage = request.getParameter("index");
        if (txtSearch == null || txtSearch.trim().isEmpty()) {
            txtSearch = "";
        }

        int cID = -1;
        if (cateID != null && !cateID.isEmpty()) {
            cID = Integer.parseInt(cateID);
        }

        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        NewsDAObyAdmin dao = new NewsDAObyAdmin();
        int count = dao.getTotalNews(txtSearch, cID);
        int endPage = count / 5;
        if (count % 5 != 0) {
            endPage++;
        }
        List<News> list = dao.searchNews(txtSearch, cID, index);
        List<NewsCategories> listC = dao.getAllCategory();
        request.setAttribute("listP", list);
        request.setAttribute("listCC", listC);
        request.setAttribute("txtS", txtSearch);
        request.setAttribute("totalPage", count);
        request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
        request.setAttribute("categoryID", cID);
        request.getRequestDispatcher("Dashboard/BlogManagement.jsp").forward(request, response);
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
