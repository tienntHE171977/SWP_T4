package Controller.BlogManagement;

import Model.NewsCategories;
import NewsDAO.NewsDAObyAdmin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
@WebServlet(name = "AddBlog", urlPatterns = {"/AddBlog"})
public class AddBlog extends HttpServlet {

    private static final String UPLOAD_DIR = "images";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Lấy các giá trị từ form
        String newsTitle = request.getParameter("newsTitle");
        String newsContent = request.getParameter("newsContent");
        String newMessage = request.getParameter("newsMessage");
        String categoryID = request.getParameter("category");

        // Tạo thư mục lưu trữ ảnh
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Lấy ảnh từ form
        Part filePart = request.getPart("avatar");
        String fileName = null;
        String avatarUrl = null;

        if (filePart != null && filePart.getSize() > 0) {
            fileName = System.currentTimeMillis() + "_" + Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String filePath = uploadFilePath + File.separator + fileName;
            filePart.write(filePath); // Lưu ảnh vào thư mục
            avatarUrl = UPLOAD_DIR + "/" + fileName; // Đường dẫn ảnh lưu trong DB
        }

        // Lấy user ID từ session
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("user_id");
        if (userId == null) {
            userId = "1"; // Giá trị mặc định chỉ dùng cho phát triển
        }

        // Lưu thông tin bài viết và hình ảnh vào cơ sở dữ liệu
        NewsDAObyAdmin dao = new NewsDAObyAdmin();
        dao.insertNews(newsTitle, categoryID, newsContent, newMessage, userId, avatarUrl);

        // Lấy danh sách các danh mục để hiển thị lại trên trang AddBlog.jsp
        List<NewsCategories> listC = dao.getAllCategory();
        request.setAttribute("listCC", listC);
        request.getRequestDispatcher("Dashboard/AddBlog.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        NewsDAObyAdmin dao = new NewsDAObyAdmin();
        List<NewsCategories> listC = dao.getAllCategory();
        request.setAttribute("listCC", listC);
        request.getRequestDispatcher("Dashboard/AddBlog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet to add new blog post with image upload";
    }
}
