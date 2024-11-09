/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_Authen;

import DAL_Authen.AccountDAO;
import DAL_Authen.PasswordResetTokensDAO;
import Sendmail.EmailSender;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Random;
import java.util.regex.Pattern;
import model.PasswordResetTokens;
import model.User;

/**
 *
 * @author FPT
 */
@WebServlet(name = "ResetPasswordRequiredController", urlPatterns = {"/"})
public class ResetPasswordRequiredController extends HttpServlet {

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
            out.println("<title>Servlet ResetPasswordRequiredController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResetPasswordRequiredController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("resetPasswordRequired.jsp").forward(request, response);
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
        if ("sendOTP".equals(action)) {
            handleSendOTP(request, response);
        } else {
            handleResetPassword(request, response);
        }

    }

    private void handleSendOTP(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");
        String email = request.getParameter("email");

        if (user == null || !email.equals(user.getEmail())) {
            response.getWriter().write("Invalid user or email");
            return;
        }

        String otp = generateOTP();
        Timestamp expiryDate = new Timestamp(System.currentTimeMillis() + 900000); // 15 minutes

        PasswordResetTokensDAO tokenDAO = new PasswordResetTokensDAO();
        try {
            boolean tokenSaved = tokenDAO.saveToken(user.getUserId(), otp, expiryDate);

            if (tokenSaved) {
                EmailSender.sendEmailToUser(user, otp);
                response.getWriter().write("OTP sent successfully");
            } else {
                response.getWriter().write("Error occurred while sending OTP");
            }
        } catch (Exception e) {
            response.getWriter().write("An error occurred: " + e.getMessage());
        }
    }

    private void handleResetPassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");
        if (user == null || !"staff".equals(user.getRole()) || !user.isPassword_reset_required()) {
            response.sendRedirect("login");
            return;
        }

        String email = request.getParameter("email");
        String otp = request.getParameter("otp");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("newPassword_confirm");

        if (!isValidEmail(email) || !email.equals(user.getEmail())) {
            request.setAttribute("error", "Invalid email or email does not match your account");
            request.getRequestDispatcher("resetPasswordRequired.jsp").forward(request, response);
            return;
        }

        PasswordResetTokensDAO tokenDAO = new PasswordResetTokensDAO();
        if (!isValidOTP(email, otp, tokenDAO)) {
            request.setAttribute("error", "Invalid or expired OTP");
            request.getRequestDispatcher("resetPasswordRequired.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword) || !isValidPassword(newPassword)) {
            request.setAttribute("error", "Invalid password or passwords do not match");
            request.getRequestDispatcher("resetPasswordRequired.jsp").forward(request, response);
            return;
        }

        AccountDAO accountDAO = new AccountDAO();
        try {
            boolean updated = accountDAO.updatePasswordByEmail(email, newPassword);
            if (updated) {
                accountDAO.updatePasswordResetRequired(user.getUserId(), false);
                user.setPassword_reset_required(false);
                session.setAttribute("acc", user);

                tokenDAO.deleteToken(otp);

                request.setAttribute("success", "Password reset successful. You can now login with your new password.");
            } else {
                request.setAttribute("error", "Failed to update password");
                request.getRequestDispatcher("resetPasswordRequired.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while processing your request");
            request.getRequestDispatcher("resetPasswordRequired.jsp").forward(request, response);
        }
    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
        Pattern pattern = Pattern.compile(emailRegex);
        if (email == null) {
            return false;
        }
        return pattern.matcher(email).matches();
    }

    private boolean isValidOTP(String otp) {
        return otp != null && otp.matches("\\d{6}");
    }

    private boolean isValidPassword(String password) {
        // Ít nhất 8 ký tự, ít nhất một chữ hoa, một chữ thường và một số
        String passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*()_+{}\\[\\]:;<>,.?~\\\\/-])(?=\\S+$).{8,}$";
        return password != null && password.matches(passwordRegex);
    }

    private String generateOTP() {
        Random random = new Random();
        return String.format("%06d", random.nextInt(999999));
    }

    private boolean isValidOTP(String email, String otp, PasswordResetTokensDAO tokenDAO) {
    PasswordResetTokens token = tokenDAO.getTokenByEmail(email);
    if (token == null) {
        return false;
    }
    
    if (!otp.equals(token.getToken())) {
        return false;
    }
    
    Timestamp now = new Timestamp(System.currentTimeMillis());
    if (now.after(token.getExpiryDate())) {
        return false;
    }
    
    return true;
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
