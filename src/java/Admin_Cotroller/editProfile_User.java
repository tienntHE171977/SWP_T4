/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin_Cotroller;

import DAL_Authen.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import model.User;

@WebServlet(name = "editProfile_User", urlPatterns = {"/editProfileUser"})
public class editProfile_User extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "D:\\SWP391\\Swp_2\\Swp\\web\\images";

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
        String userIdStr = request.getParameter("a");
        System.out.println("Received userIdStr: " + userIdStr);
    AccountDAO a = new AccountDAO();
    request.setAttribute("a", userIdStr);

//    if (userIdStr == null || userIdStr.trim().isEmpty()) {
//    //request.setAttribute("error", "ID người dùng không hợp lệ1.");
//    request.getRequestDispatcher("manageUser.jsp").forward(request, response);
//    //return;
//}
    try {
        int userId = Integer.parseInt(userIdStr);

        // Xử lý khác biệt cho doGet và doPost
        if ("GET".equalsIgnoreCase(request.getMethod())) {
            User user = a.getUserById(userId);
            System.out.println("User; " + user);
            if (user == null) {
                request.setAttribute("error", "Người dùng không tồn tại2.");
            } else {
                request.setAttribute("user", user);
            }
            request.getRequestDispatcher("manageUser.jsp").forward(request, response);
        } else if ("POST".equalsIgnoreCase(request.getMethod())) {
            // Lấy các thông tin khác từ form
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String role = request.getParameter("role");
            String gender = request.getParameter("gender");

            // Kiểm tra và tạo thư mục nếu chưa tồn tại
            File uploadDir = new File(UPLOAD_DIRECTORY);
            if (!uploadDir.exists()) {
                uploadDir.mkdir(); // Tạo thư mục nếu chưa tồn tại
            }
            User user = new User();
            Part filePart = request.getPart("avatar");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String filePath = UPLOAD_DIRECTORY + File.separator + fileName;
                filePart.write(filePath);
                user.setImage("images/" + fileName);
            }

//            user.setUserId(userId);
            user.setPhone(phone);
            user.setAdrees(address);
            user.setRole(role);
            user.setGender(gender);

            boolean updateSuccess = a.userProfile(user);
            boolean updateImage = a.updateUserProfileImage(user);
            if (updateSuccess && updateImage) {
                request.setAttribute("me", "Cập nhật thành công");
            } else {
                if (!updateSuccess) {
                    request.setAttribute("me", "Cập nhật thất bại");
                } else if (!updateImage) {
                    request.setAttribute("me", "Cập nhật ảnh thất bại");
                }
            }
            request.getRequestDispatcher("manageUser.jsp").forward(request, response);
        }
    } catch (NumberFormatException e) {
        request.setAttribute("error", "ID người dùng không hợp lệ3.");
        request.getRequestDispatcher("manageUser.jsp").forward(request, response);
    }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
