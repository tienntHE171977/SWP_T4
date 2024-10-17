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
import java.sql.*;
import java.util.Random;
import java.util.regex.Pattern;
import model.PasswordResetTokens;
import model.Users;

/**
 *
 * @author FPT
 */
@WebServlet(name="ResetPasswordController", urlPatterns={"/resetPassword"})
public class ResetPasswordController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet ResetPasswordController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResetPasswordController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("/resetPassword.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
            // Xử lý gửi OTP
            sendOTP(request, response);
        } else {
            // Xử lý reset password
            resetPassword(request, response);
        }
    }

    private void sendOTP(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String email = request.getParameter("email");
        
        // Kiểm tra email tồn tại
        AccountDAO accountDAO = new AccountDAO();
        Users user = accountDAO.checkAccountByemail(email);

        if (user != null) {
            String otp = generateOTP();
            Timestamp expiryDate = new Timestamp(System.currentTimeMillis() + 300000); // 5phut

            PasswordResetTokensDAO tokenDAO = new PasswordResetTokensDAO();
            boolean tokenSaved = tokenDAO.saveToken(user.getUserId(), otp, expiryDate);

            if (tokenSaved) {
                EmailSender.sendEmailToUser(user, otp);
                response.getWriter().write("OTP sent successfully");
            } else {
                response.getWriter().write("Error occurred while sending OTP");
            }
        } else {
            response.getWriter().write("Email not found");
        }
    }

   private void resetPassword(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String email = request.getParameter("email");
        String otp = request.getParameter("otp");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("newPassword_confirm");

        if (!isValidEmail(email)) {
            request.setAttribute("error", "Invalid email format");
            request.getRequestDispatcher("/resetPassword.jsp").forward(request, response);
            return;
        }
        PasswordResetTokensDAO tokenDAO = new PasswordResetTokensDAO();
        if (!isValidOTP(email, otp, tokenDAO)) {
            request.setAttribute("error", "Invalid OTP format");
            request.getRequestDispatcher("/resetPassword.jsp").forward(request, response);
            return;
        }

        if (!isValidPassword(newPassword)) {
            request.setAttribute("error", "Invalid password format. Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number.");
            request.getRequestDispatcher("/resetPassword.jsp").forward(request, response);
            return;
        }
        

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "New password and confirm password do not match");
            request.getRequestDispatcher("/resetPassword.jsp").forward(request, response);
            return;
        }

        
        AccountDAO accountDAO = new AccountDAO();

        if (tokenDAO.isValidOTP(email, otp)) {
            boolean updated = accountDAO.updatePasswordByEmail(email, newPassword);
            if (updated) {
                
                tokenDAO.deleteToken(otp);
                request.setAttribute("success", "Password reset successful. You can now login with your new password.");
            } else {
                request.setAttribute("error", "Failed to update password. Please try again.");
            }
        } else {
            request.setAttribute("error", "Invalid or expired OTP. Please try again.");
        }

        request.getRequestDispatcher("/resetPassword.jsp").forward(request, response);
    }

    private String generateOTP() {
        Random random = new Random();
        return String.format("%06d", random.nextInt(999999));
    }
    private boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
        Pattern pattern = Pattern.compile(emailRegex);
        if (email == null) return false;
        return pattern.matcher(email).matches();
    }

    

    private boolean isValidPassword(String password) {
        // Ít nhất 8 ký tự, ít nhất một chữ hoa, một chữ thường và một số
        String passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*()_+{}\\[\\]:;<>,.?~\\\\/-])(?=\\S+$).{8,}$";
        return password != null && password.matches(passwordRegex);
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
