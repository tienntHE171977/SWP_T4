/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO_H.ProjectDAO;
import model.Project_1;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author pc
 */
public class ProjectDetail extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProjectDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProjectDetail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
    try {
            int projectId = Integer.parseInt(request.getParameter("id")); // Get ID from request parameter
            ProjectDAO projectDAO = new ProjectDAO();
            Project_1 project = projectDAO.getProjectDetail(projectId);

            if (project != null) {
                request.setAttribute("project", project); // Store project info in request
                request.getRequestDispatcher("ProductDetail.jsp").forward(request, response); // Forward to detail page
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND); // Send 404 error if project not found
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid project ID"); // Handle invalid ID
        }
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
//        int projectId = Integer.parseInt(request.getParameter("id")); // Lấy ID từ tham số request
//        ProjectDAO projectDAO = new ProjectDAO();
//        Project_1 project = projectDAO.getProjectDetail(projectId);
//
//        if (project != null) {
//            request.setAttribute("project", project); // Lưu thông tin dự án vào request
//            request.getRequestDispatcher("ProductDetail.jsp").forward(request, response); // Chuyển tiếp đến trang detail
//        } else {
//            response.sendError(HttpServletResponse.SC_NOT_FOUND); // Gửi mã lỗi 404 nếu không tìm thấy dự án
//        }
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
