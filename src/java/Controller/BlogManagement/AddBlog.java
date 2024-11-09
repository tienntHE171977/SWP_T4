/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.BlogManagement;

import model.News;
import model.NewsCategories;
import NewsDAO.NewsDAObyAdmin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.List;
import model.Staff;
import model.User;

/**
 *
 * @author admin
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
@WebServlet(name = "AddBlog", urlPatterns = {"/AddBlog"})
public class AddBlog extends HttpServlet {

    private static final String UPLOAD_DIR = "images";

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

        // tao thu muc luu anh
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        // lay anh tu form
        Part filePart = request.getPart("avatar");
        String fileName = null;
        String avatarUrl = null;
        if (filePart != null && filePart.getSize() > 0) {
            fileName = System.currentTimeMillis() + "_"
                    + Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String filePath = uploadFilePath + File.separator + fileName;
            filePart.write(filePath);
            avatarUrl = UPLOAD_DIR + "/" + fileName;
        }

        HttpSession session = request.getSession();

//        int id = Integer.parseInt(request.getParameter("id"));
        Staff currentStaff = (Staff) session.getAttribute("staff");
        if (currentStaff == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        NewsDAObyAdmin dao = new NewsDAObyAdmin();
        List<NewsCategories> listC = dao.getAllCategory();
        dao.insertNews(newsTitle, categoryID, newsContent, newMessage, currentStaff.getStaff_id(), avatarUrl);
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
        NewsDAObyAdmin dao = new NewsDAObyAdmin();
        List<NewsCategories> listC = dao.getAllCategory();
        request.setAttribute("listCC", listC);
        request.getRequestDispatcher("Dashboard/AddBlog.jsp").forward(request, response);
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
