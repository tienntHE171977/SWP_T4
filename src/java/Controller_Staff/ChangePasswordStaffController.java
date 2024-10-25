/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_Staff;

import DAL_Authen.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Staff;
import model.Users;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author FPT
 */
@WebServlet(name = "ChangePasswordStaffController", urlPatterns = {"/changepasswordstaff"})
public class ChangePasswordStaffController extends HttpServlet {

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
            out.println("<title>Servlet ChangePasswordStaffController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordStaffController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("changePasswordStaff.jsp").forward(request, response);
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
        HttpSession session = request.getSession(false);

        Users currentUser = (Users) session.getAttribute("acc");
        if (currentUser == null) {
            String mee = "Không lấy được session";
            request.setAttribute("me", mee);
            response.sendRedirect("login.jsp");
            return;
        }
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.matches("^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*()_+{}\\[\\]:;<>,.?~\\\\/-])(?=\\S+$).{8,}$")) {
            request.setAttribute("errorMessage", "Mật khẩu mới phải có ít nhất 8 ký tự, bao gồm ký tự viết hoa, chữ số, ký tự thường và ký tự đặc biệt.");
            request.getRequestDispatcher("changePasswordStaff.jsp").forward(request, response);
            return;
        }
        // Kiểm tra mật khẩu mới và xác nhận mật khẩu có khớp nhau không
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Mật khẩu mới và xác nhận mật khẩu không khớp.");
            request.getRequestDispatcher("changePasswordStaff.jsp").forward(request, response);
            return;
        }
        // Kiểm tra mật khẩu hiện tại
        AccountDAO accountDAO = new AccountDAO();
        if (!BCrypt.checkpw(currentPassword, currentUser.getPassword())) {
            request.setAttribute("errorMessage", "Mật khẩu hiện tại không đúng.");
            request.getRequestDispatcher("changePasswordStaff.jsp").forward(request, response);
            return;
        }
        // Cập nhật mật khẩu mới
        boolean isUpdated = accountDAO.updatePasswordByEmail(currentUser.getEmail(), newPassword);
        if (isUpdated) {
            request.setAttribute("successMessage", "Thay đổi mật khẩu thành công.");
        } else {
            request.setAttribute("errorMessage", "Có lỗi xảy ra. Vui lòng thử lại.");
        }

        request.getRequestDispatcher("changePasswordStaff.jsp").forward(request, response);
    }

    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
