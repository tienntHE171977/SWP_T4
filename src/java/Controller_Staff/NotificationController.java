/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller_Staff;

import DAL_Staff.NotificationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Notification;
import model.User;

/**
 *
 * @author FPT
 */
@WebServlet(name="NotificationController", urlPatterns={"/notification"})
public class NotificationController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NotificationController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NotificationController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       HttpSession session = request.getSession(false);
        NotificationDAO notification = new NotificationDAO();
        if (session != null) {
            User user = (User) session.getAttribute("acc");
            
            if (user != null) {
                // Lấy userId từ đối tượng user
                int userId = user.getUserId();

                // Lấy danh sách thông báo từ DAO
                List<Notification> notifications = notification.selectNotificationsByUserId(userId);

                // Đặt danh sách thông báo vào request attribute
                request.setAttribute("notifications", notifications);

                // Chuyển tiếp đến JSP
                    request.getRequestDispatcher("Notification.jsp").forward(request, response);
                
            } else {
                // Nếu không có người dùng trong session, chuyển hướng đến trang đăng nhập
                response.sendRedirect("login.jsp");
            }
        } else {
            // Nếu session không tồn tại, chuyển hướng đến trang đăng nhập
            response.sendRedirect("login.jsp");
        }
    
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
