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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Staff;
import model.User;

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
                User account = Google_Login.getUserInfo(accessToken);

                if (account != null) {
                    HttpSession session = request.getSession();
                    AccountDAO accountDao = new AccountDAO();
                    StaffDAO sd = new StaffDAO();

                    // Kiểm tra xem người dùng có tồn tại trong cơ sở dữ liệu không
                    User existingUser = accountDao.getUserByEmail(account.getEmail());

                    if (existingUser != null) {
                        Staff s = sd.getStaffByUserId(existingUser.getUserId());
                        s.setUser(existingUser);

                        session.setAttribute("acc", existingUser);
                        session.setAttribute("staff", s);
                        session.setMaxInactiveInterval(30 * 60);

                        // Kiểm tra vai trò của người dùng
                        String role = existingUser.getRole();
                        if ("admin".equals(role)) {
                            response.sendRedirect("admin.jsp");
                        } else if ("staff".equals(role)) {
                            response.sendRedirect("staff");
                        } else {
                            // Vai trò không xác định, chuyển hướng đến trang chính
                            response.sendRedirect("index.jsp");
                        }
                    } else {
                        // Người dùng không tồn tại, chuyển hướng đến trang đăng ký
                        session.setAttribute("tempUser", account);
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
