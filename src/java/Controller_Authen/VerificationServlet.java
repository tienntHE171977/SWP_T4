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
import model.Users;

/**
 *
 * @author FPT
 */
@WebServlet(name = "VerificationServlet", urlPatterns = {"/verify"})
public class VerificationServlet extends HttpServlet {

    private AccountDAO accountDAO;
    private VerificationTokenDAO verificationTokenDAO;
    private EmailService emailService;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void init() {
        accountDAO = new AccountDAO();
        verificationTokenDAO = new VerificationTokenDAO();
        emailService = new EmailService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VerificationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerificationServlet at " + request.getContextPath() + "</h1>");
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
        
        String token = request.getParameter("token");
        String email = (String) request.getAttribute("email");
        if (token != null) {
            verifyToken(token, request, response);
        } else if (email != null) {
            // Đặt email vào request attribute để sử dụng trong JSP
            request.setAttribute("email", email);
            request.getRequestDispatcher("/verify.jsp").forward(request, response);
        } else {
            // Hiển thị trang xác thực mặc định
            request.getRequestDispatcher("/verify.jsp").forward(request, response);
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
        
        String email = request.getParameter("email");
        Users user = accountDAO.checkAccountByemail(email);

        if (user != null && !accountDAO.isUserVerified(user.getUserId())) {
            String token = verificationTokenDAO.generateAndSaveVerificationToken(user.getUserId());
            String verificationLink = "http://localhost:8080/swp391/verify?token=" + token;
            emailService.sendVerificationEmail(email, verificationLink);

            request.setAttribute("message", "Verification email sent. Please check your inbox.");
        } else {
            request.setAttribute("error", "User not found or already verified.");
        }

        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }

    private void verifyToken(String token, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer userId = verificationTokenDAO.getUserIdByToken(token);
        if (userId != null) {
            verificationTokenDAO.activateUserAccount(userId);
            request.setAttribute("message", "Your account has been verified successfully.");
        } else {
            request.setAttribute("error", "Invalid or expired verification token.");
        }
        request.getRequestDispatcher("/result.jsp").forward(request, response);
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
