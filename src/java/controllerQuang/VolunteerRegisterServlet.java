/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerQuang;

import ModelQuang.CampaignParticipant;
import ModelQuang.User;
import ModelQuang.Volunteer;
import ModelQuang.VolunteerCV;
import dalQuang.DAO;
import dalQuang.VolunteerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class VolunteerRegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String UPLOAD_DIR = "images"; // Folder lưu trữ ảnh trên server

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VolunteerRegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VolunteerRegisterServlet at " + request.getContextPath() + "</h1>");
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
        DAO d = new DAO();
        VolunteerDAO vl = new VolunteerDAO();
//        List<Notification> list = d.getAllNotic();
//      int userid = (int) request.getAttribute("Userid");
        HttpSession session = request.getSession();
        session.setAttribute("acc", d.selectUserById(21));
        User user = (User) session.getAttribute("acc");

        try {
            if (user == null) {
                throw new Exception();
            }
            if (vl.VolunteerCVByUserid(user.getUserId()) != null && user.getRole().equals("donor")) {
                request.setAttribute("volunteerCVinfo", vl.VolunteerCVByUserid(user.getUserId()));
            }
            if (!user.getRole().equals("donor")) {
                throw new Exception();
            }
            request.setAttribute("user", user);
//            request.setAttribute("ex", cp);
            request.getRequestDispatcher("Volunteer_register.jsp").forward(request, response);
//            Volunteer vvv = vlD.VolunteerByUserId(user.getUserId());
//            List<CampaignParticipant> cp = vlD.getCPByVolunteerId(vvv.getVolunteerId());

        } catch (Exception e) {
            response.sendRedirect("404.jsp");
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
        DAO d = new DAO();
        VolunteerDAO vlD = new VolunteerDAO();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date created_at = new Date();
        Date crat = new Date();
        HttpSession session = request.getSession();
//        session.setAttribute("acc", d.selectUserById(1));
        User user = (User) session.getAttribute("acc");

        String ct = dateFormat.format(created_at);
        try {
            crat = dateFormat.parse(ct);
        } catch (ParseException ex) {
            Logger.getLogger(RegisOrganizationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

//        VolunteerDAO vld = new VolunteerDAO();
        String descrip = request.getParameter("description").trim().replace("'", "").replace("\"", "");;
        String exper = request.getParameter("ex").trim();
        String skills = request.getParameter("ski");
        String edu = request.getParameter("ed");

        Part filePart = request.getPart("image"); // Lấy file từ form
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString().replaceAll(" ", "_"); // Lấy tên file và thay dấu cách bằng gạch dưới

// Lưu file vào thư mục /uploads thay vì build
        String uploadPath = "D:\\FALL24\\SWP\\SWP_team4\\SWP_team4\\web\\images"; // Đường dẫn đến thư mục images

// Tạo thư mục nếu chưa tồn tại
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            boolean dirCreated = uploadDir.mkdir();
            if (!dirCreated) {
                throw new IOException("Không thể tạo thư mục để lưu file tại: " + uploadPath);
            }
        }

// Lưu file vào đường dẫn đã chỉ định
        String filePath = uploadPath + File.separator + fileName;
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, new File(filePath).toPath(), StandardCopyOption.REPLACE_EXISTING); // Ghi đè nếu file đã tồn tại
            System.out.println("File đã được lưu thành công tại: " + filePath);

        } catch (IOException e) {
            e.printStackTrace();
            throw new ServletException("Lỗi khi lưu file: " + filePath + ". Chi tiết: " + e.getMessage());
        }

// Tạo URL của ảnh (giả sử bạn muốn truy cập qua /images/)
        String imageUrl = request.getContextPath() + "/" + UPLOAD_DIR + "/" + fileName;
        System.out.println("URL của ảnh là: " + imageUrl);

        VolunteerCV vc = new VolunteerCV(0, user, descrip, skills, created_at, imageUrl, exper, edu);
        try {
            vlD.insertVolunteerCV(vc);
            response.sendRedirect("home");
        } catch (Exception e) {
        }
        // Chuyển hướng đến trang thành công
        
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
