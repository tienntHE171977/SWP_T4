/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_Authen;

import DAL_Authen.AccountDAO;
import DAL_Staff.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.nio.file.Files;
import model.Staff;
import model.Users;

/**
 *
 * @author FPT
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        String username = "";
        String password = "";

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("username".equals(cookie.getName())) {
                    username = cookie.getValue();
                }
                if ("password".equals(cookie.getName())) {
                    password = cookie.getValue();
                }
            }
        }

        request.setAttribute("username", username);
        request.setAttribute("password", password);
        request.getRequestDispatcher("login.jsp").forward(request, response);

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

        String emailorUsername = request.getParameter("emailorusername");
        String pass = request.getParameter("password");

        if (emailorUsername == null || emailorUsername.isBlank() || pass == null || pass.isBlank()) {
            String mess = "Email or Username cannot be empty";
            request.setAttribute("err0", mess);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        AccountDAO login = new AccountDAO();
        Users user = null;

        if (isValidEmail(emailorUsername)) {
            user = login.getAccountByemail(emailorUsername, pass);
        } else {
            user = login.getAccountByUsername(emailorUsername, pass);
        }

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("acc", user);

            session.setMaxInactiveInterval(30 * 60);

            // Kiểm tra password_reset_required
            if (user.isPassword_reset_required() && "staff".equals(user.getRole())) {
                response.sendRedirect("resetPasswordRequired.jsp");
                return;
            }

            // Xử lý "Remember me"
            String remember = request.getParameter("remember-me");
            if ("on".equals(remember)) {
                // Tạo cookie cho username và password
                Cookie usernameCookie = new Cookie("username", emailorUsername);
                Cookie passwordCookie = new Cookie("password", pass);

                // Đặt thời gian tồn tại cho cookie ( 1 ngày)
                usernameCookie.setMaxAge(24 * 60 * 60);
                passwordCookie.setMaxAge(24 * 60 * 60);

                // Thêm cookie vào response
                response.addCookie(usernameCookie);
                response.addCookie(passwordCookie);
            }

            // Chuyển hướng dựa trên vai trò
            String role = user.getRole();
            if ("admin".equals(role)) {
                response.sendRedirect("admin.jsp");
            } else if ("staff".equals(role)) {
                StaffDAO staffDAO = new StaffDAO();
                Staff staff = staffDAO.getStaffByUserId(user.getUserId());
                if (staff != null) {
                    staff.setUser(user);  // Đặt user vào staff
                    session.setAttribute("staff", staff);
                }
                response.sendRedirect("staff.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            String mess = isValidEmail(emailorUsername) ? "Email or Password is incorrect" : "Username or Password is incorrect";
            request.setAttribute("err", mess);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$";

        return email != null && email.matches(emailRegex);
    }
}
