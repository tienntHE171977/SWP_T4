/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_Authen;

import DAL_Authen.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;

/**
 *
 * @author FPT
 */
public class Google_loginController extends HttpServlet {

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
            out.println("<title>Servlet Google_loginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Google_loginController at " + request.getContextPath() + "</h1>");
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
        String code = request.getParameter("code");

        if (code != null && !code.isEmpty()) {
            try {
                // Lấy access token sử dụng mã xác thực
                String accessToken = Google_Login.getToken(code);

                // Lấy thông tin người dùng từ Google
                Users account = Google_Login.getUserInfo(accessToken);

                if (account != null) {
                    // Kiểm tra nếu người dùng đã tồn tại trong hệ thống
                    AccountDAO accountDal = new AccountDAO();
                    boolean accountExists = accountDal.checkAccountByEmail(account.getEmail());

                    if (accountExists) {
                        // Đăng nhập người dùng (thiết lập session)
                        request.getSession().setAttribute("user", account);
                         // Chuyển hướng đến trang chính
                         response.sendRedirect("index.jsp");
                    } else {
                        
                        request.getSession().setAttribute("tempUser", account);
                        response.sendRedirect("registration.jsp");
                    }
                    
                } else {
                    // Nếu không lấy được thông tin người dùng, chuyển hướng đến trang lỗi
                    response.sendRedirect("404.jsp?message=khong the láy dc thong tin.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("404.jsp?message=loi dn.");
            }
        } else {
            // Nếu mã xác thực không tồn tại, chuyển hướng đến trang lỗi
            response.sendRedirect("login.jsp");
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
        processRequest(request, response);
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
