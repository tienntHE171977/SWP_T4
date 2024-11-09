/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller_User;

import DAL_Authen.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import model.User;

/**
 *
 * @author FPT
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
@WebServlet(name="EditUser_Controller", urlPatterns={"/editUser"})
public class EditUser_Controller extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "D:\\SWP391\\Swp_2\\Swp\\web\\images";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("userProfile.jsp").forward(request, response);
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
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("acc");

        if (user != null) {
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");

            // Kiểm tra và tạo thư mục nếu chưa tồn tại
            File uploadDir = new File(UPLOAD_DIRECTORY);
            if (!uploadDir.exists()) {
                uploadDir.mkdir(); // Tạo thư mục nếu chưa tồn tại
            }

            // Lấy file ảnh từ form
            Part filePart = request.getPart("avatar");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

                // Đường dẫn đầy đủ để lưu file
                String filePath = UPLOAD_DIRECTORY + File.separator + fileName;

                // Lưu file vào thư mục uploads
                filePart.write(filePath);

                // Cập nhật đường dẫn ảnh trong database (chỉ lưu đường dẫn tương đối)
                user.setImage("images/" + fileName);
            } else {
                // Không có ảnh mới được tải lên, giữ nguyên ảnh cũ
                
            }

            // Cập nhật thông tin người dùng
            user.setPhone(phone);
            user.setAdrees(address);
            user.setGender(gender);

            AccountDAO accountDAO = new AccountDAO();
            boolean updateSuccess = accountDAO.userProfile(user);
            boolean updateImage = accountDAO.updateUserProfileImage(user);

            if (updateSuccess && updateImage) {
                
                session.setAttribute("acc", user);
                request.setAttribute("me", "Cập nhật thành công");
            } else {
                if(!updateSuccess){
                    request.setAttribute("me", "Cập nhật thất bại");
                }else if(!updateImage){
                    request.setAttribute("me", "Cập nhật ảnh thất bại");
                }
            }
            request.getRequestDispatcher("userProfile.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
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
