/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin_Cotroller;

import DAL_Authen.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import model.User;

/**
 *
 * @author FPT
 */
@WebServlet(name = "userList_Controller", urlPatterns = {"/userList"})
public class userList_Controller extends HttpServlet {

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
            out.println("<title>Servlet userList_Controller</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet userList_Controller at " + request.getContextPath() + "</h1>");
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
        AccountDAO a = new AccountDAO();
        String role = request.getParameter("role");
        String gender = request.getParameter("gender");
        int page = 1;
        int pageSize = 5;
        String searchName = request.getParameter("searchName");
        int staffCount = a.countUsersByRole("staff");
        int donorCount = a.countUsersByRole("donor");
        int volunteerCount = a.countUsersByRole("volunteer");
        try {
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            List<User> users;
            int totalUsers;

            if (role != null && !role.isEmpty()) {
                users = a.getUsersByRole(role, page, pageSize);
                totalUsers = a.getTotalUsersByRole(role);
            } else if (gender != null && !gender.isEmpty()) {
                users = a.getUsersByGender(gender, page, pageSize);
                totalUsers = a.getTotalUsersByGender(gender);
            } else if (searchName != null && !searchName.trim().isEmpty()) {
                users = a.searchUsersByName(searchName, page, pageSize);
                totalUsers = a.getTotalUsersByName(searchName);
            } else {
                users = a.getUsersByPage(page, pageSize);
                totalUsers = a.getTotalUsers();
            }

            Map<String, Integer> userCountByRole = a.getUserStatisticsByRole();
            request.setAttribute("userCountByRole", userCountByRole);
            int totalPages = (int) Math.ceil((double) totalUsers / pageSize);
            int allUser = a.getTotalUsers();
            request.setAttribute("allUser", allUser);
            request.setAttribute("users", users);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("searchName", searchName);
            request.setAttribute("staffCount", staffCount);
            request.setAttribute("donorCount", donorCount);
            request.setAttribute("role", role);
            request.setAttribute("volunteerCount", volunteerCount);
            request.getRequestDispatcher("listUser.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            e.printStackTrace();
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
        String action = request.getParameter("action");
        String role = request.getParameter("role");
        if ("ban".equals(action)) {
            try {
                int userId = Integer.parseInt(request.getParameter("userId"));
                AccountDAO accountDAO = new AccountDAO();
                boolean isBanned = accountDAO.banUser(userId);
                if (isBanned) {
                    request.setAttribute("message", "Chặn thành công");
                } else {
                    request.setAttribute("error", "Lỗi chặn.");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Không có ID.");
            }
        }
        AccountDAO a = new AccountDAO();
        int page = 1;
        int pageSize = 5;
        String searchName = request.getParameter("searchName");
        int staffCount = a.countUsersByRole("staff");
        int donorCount = a.countUsersByRole("donor");
        int volunteerCount = a.countUsersByRole("volunteer");
        try {
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            List<User> users;
            int totalUsers;

            if (searchName != null && !searchName.trim().isEmpty()) {
                users = a.searchUsersByName(searchName, page, pageSize);
                totalUsers = a.getTotalUsersByName(searchName);
            } else {
                users = a.getUsersByPage(page, pageSize);
                totalUsers = a.getTotalUsers();
            }
            Map<String, Integer> userCountByRole = a.getUserStatisticsByRole();
            request.setAttribute("userCountByRole", userCountByRole);
            int totalPages = (int) Math.ceil((double) totalUsers / pageSize);
            int allUser = a.getTotalUsers();
            request.setAttribute("allUser", allUser);
            request.setAttribute("users", users);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("searchName", searchName);
            request.setAttribute("staffCount", staffCount);
            request.setAttribute("donorCount", donorCount);
            request.setAttribute("volunteerCount", volunteerCount);
            request.getRequestDispatcher("listUser.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
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
