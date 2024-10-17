/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_Authen;

import DAL_Authen.AccountDAO;
import DAL_Authen.VerificationTokenDAO;
import Sendmail.EmailService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.UUID;
import model.Users;

/**
 *
 * @author FPT
 */
@WebServlet(name = "Register", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

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
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("registration.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String rePassword = request.getParameter("re_pass");
        String fullname = request.getParameter("fullname");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String agreeTerm = request.getParameter("agree-term");
        AccountDAO account = new AccountDAO();
        String messError = validateUserInput(username, email, password, rePassword, fullname, address, phone, account);
        if (messError != null) {
            request.setAttribute("messError", messError);
            request.getRequestDispatcher("registration.jsp").forward(request, response);
            return;
        }
        if (agreeTerm == null) {
            request.setAttribute("messError", "You must agree to the Terms of Service before registering.");
            request.getRequestDispatcher("registration.jsp").forward(request, response);
            return;
        }
        Users user = new Users(username, email, password, true, phone, fullname, address, gender, phone, email, true);
        boolean isUserCreated = account.createNewUser(user);

        if (isUserCreated) {
            request.setAttribute("email", email);
            request.getRequestDispatcher("verify").forward(request, response);
        } else {
            response.sendRedirect("404.jsp?messege= loi dang ky");
        }
    }

    private String validateUserInput(String username, String email, String password, String rePassword,
            String fullname, String address, String phone, AccountDAO account) {
        if (username == null || username.isBlank() || password == null || password.isBlank()
                || rePassword == null || rePassword.isBlank() || fullname == null || fullname.isBlank()
                || address == null || address.isBlank()
                || phone == null || phone.isBlank()) {

            return "Nhập đầy đủ thông tin.";
        }
        if (account.checkAccountByUsername(username) != null) {

            return "Tài khoản đã tồn tại";
        }
        if (account.checkAccountByEmail(email) != false) {

            return "Tài khoản đã tồn tại";

        } else if (!email.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$")) {

            return "Phải nhập đúng định dạng gmail";
        }
        if (!password.matches("^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*()_+{}\\[\\]:;<>,.?~\\\\/-])(?=\\S+$).{8,}$")) {

            return "Phải nhập ít nhất 8 ký tự bao gồm in hoa, số và ký tự đặc biệt.";
        }
        if (!rePassword.equals(password)) {

            return "Không khớp mật khẩu.";
        }
//        if(account.))
        if (!phone.matches("^0(3[2-9]|5[2-9]|7[0|6-9]|8[1-9]|9[0-9])\\d{7}$")) {

            return "Không hợp lệ số điện thoại.";
        }
        return null;
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
