/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller_Contact;

import DAL_Staff.ContactDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Contact;

/**
 *
 * @author FPT
 */
@WebServlet(name="Controller_Contact", urlPatterns={"/contact"})
public class Controller_Contact extends HttpServlet {
   
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("/contact.jsp").forward(request, response);
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
        // Xử lý gửi form liên hệ
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // Kiểm tra dữ liệu đầu vào (bạn có thể thêm các kiểm tra khác)
        if (name == null || name.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            subject == null || subject.trim().isEmpty() ||
            message == null || message.trim().isEmpty()) {
            request.setAttribute("error", "All fields are required");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }

        // Tạo đối tượng Contact
        Contact contact = new Contact();
        contact.setName(name);
        contact.setEmail(email);
        contact.setSubject(subject);
        contact.setMessage(message);
        contact.setStatus("new"); // Trạng thái mặc định

        // Lưu contact vào database
        try {
            ContactDAO contactDAO = new ContactDAO();
            contactDAO.addContact(contact);
            request.setAttribute("success", "Your message has been sent successfully!");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while sending your message. Please try again.");
            e.printStackTrace();
        }

        // Chuyển hướng lại trang contact với thông báo
        request.getRequestDispatcher("contact.jsp").forward(request, response);
    
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
