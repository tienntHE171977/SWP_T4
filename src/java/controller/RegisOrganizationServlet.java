/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import Model.Organization;
import Model.User;
import dal.OrganizationDAO;
import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
;
import java.util.List;

import jakarta.servlet.http.Part;
import java.nio.file.StandardCopyOption;
import java.text.DateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.List;
import jakarta.servlet.http.Part;
import java.nio.file.StandardCopyOption;
import java.text.DateFormat;
import java.util.List;
import jakarta.servlet.http.Part;
import java.nio.file.StandardCopyOption;
import java.text.DateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.List;
import jakarta.servlet.http.Part;
import java.nio.file.StandardCopyOption;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.http.Part;
import java.nio.file.StandardCopyOption;
import java.text.DateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.List;
import jakarta.servlet.http.Part;
import java.nio.file.StandardCopyOption;
import java.text.DateFormat;
import java.util.List;
import jakarta.servlet.http.Part;
import java.nio.file.StandardCopyOption;
import java.text.DateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.List;
import jakarta.servlet.http.Part;
import java.nio.file.StandardCopyOption;
import java.text.DateFormat;

/**
 *
 * @author admin
 */


@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class RegisOrganizationServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "images"; // Folder lưu trữ ảnh trên server

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
            out.println("<title>Servlet RegisOrganizationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisOrganizationServlet at " + request.getContextPath() + "</h1>");
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
//        List<Notification> list = d.getAllNotic();
//      int userid = (int) request.getAttribute("Userid");
        OrganizationDAO orgDAO = new OrganizationDAO();
        List<Organization> listO = new ArrayList<>();
        HttpSession session = request.getSession();
        session.setAttribute("acc", d.selectUserById(1));
        User user = (User) session.getAttribute("acc");
        try {
            if (user != null) {
                for (Organization allOrganization : orgDAO.getAllOrganizations()) {
                    if (!allOrganization.getOrganizationStatus().equals("pending")) {
                        listO.add(allOrganization);
                    }
                }

                request.setAttribute("user", user);
                request.setAttribute("organiztions", listO);
//        request.setAttribute("notic", list);
                request.getRequestDispatcher("Organization_Regis.jsp").forward(request, response);
            }else {
                throw new Exception();
            }

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
        OrganizationDAO orgDAO = new OrganizationDAO();
        HttpSession session = request.getSession();
//        session.setAttribute("acc", d.selectUserById(1));
        User user = (User) session.getAttribute("acc");
        String name = request.getParameter("orgName").trim();
        // Lấy giá trị created_at từ form
        String establishmentTimeStr = request.getParameter("created_at").trim();
        String website = request.getParameter("website").trim();
        String description = request.getParameter("description").trim();
        String des = description.replace("'", "").replace("\"", "");
        // Lấy thông tin của người đại diện
        String Phone = request.getParameter("representative_phone").trim();
        String Email = request.getParameter("representative_email").trim();

        // Xử lý giá trị created_at: Nếu không có giá trị, dùng ngày hiện tại
        Date establishmentTime;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date created_at = new Date();
        Date crat = new Date();
        String ct = dateFormat.format(created_at);
        try {
            crat = dateFormat.parse(ct);
        } catch (ParseException ex) {
            Logger.getLogger(RegisOrganizationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (establishmentTimeStr == null || establishmentTimeStr.isEmpty()) {
            establishmentTime = new Date(); // Ngày hiện tại
        } else {
            // Chuyển đổi chuỗi created_at thành Date
            try {

                establishmentTime = dateFormat.parse(establishmentTimeStr);
            } catch (ParseException e) {
                // Nếu có lỗi khi chuyển đổi, dùng ngày hiện tại
                establishmentTime = new Date();
            }
        }

        // Kiểm tra nếu có lỗi, gửi thông báo lỗi về trang nhập dữ liệu
        //         Xử lý file upload (hình ảnh)
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

//             Tạo Organization object và lưu vào cơ sở dữ liệu, trong đó lưu URL của ảnh và created_at
        Organization org = new Organization(0, name, website, des, imageUrl, Phone, Email, user, 1, crat, establishmentTime, "pending");
//        OrganizationDAO orgDAO = new OrganizationDAO();
        try {
            orgDAO.insert(org);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        // Chuyển hướng đến trang thành công
        request.setAttribute("user", user);
        request.getRequestDispatcher("Organization_Register_Success.jsp").forward(request, response);

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
