/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;


import model.NewsCategories;
import NewsDAO.NewsDAOforUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.News;
import model.NewsComment;

/**
 *
 * @author admin
 */
@WebServlet(name = "SingleBlog", urlPatterns = {"/SingleBlog"})
public class SingleBlog extends HttpServlet {

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
        String postID = request.getParameter("postID");
        NewsDAOforUser dao = new NewsDAOforUser();
        
        News p = dao.getNewsByID(postID);
        
        List<NewsCategories> listC = dao.getAllCategory();
        
        List<News> last = dao.getLast();
        
        List<NewsComment> listNC = dao.getCommentbyNewID(postID);
        News prevPost = dao.getPreviousPost(postID);
        News nextPost = dao.getNextPost(postID);
        
        int total = dao.getTotalComment(postID);
       
        request.setAttribute("detail", p);
        request.setAttribute("listCC", listC);
        request.setAttribute("listPP", last);
        request.setAttribute("comments", listNC);
        request.setAttribute("prevPost", prevPost);
        request.setAttribute("nextPost", nextPost);
        request.setAttribute("total", total);
        request.getRequestDispatcher("News/single-blog.jsp").forward(request, response);
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
