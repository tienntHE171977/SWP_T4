package Controller_Organization;

import DAO_C.OrganizationDAO;
import Model_C.Organization;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.MultipartConfig;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import jakarta.servlet.http.Part;

@WebServlet(name = "OrganizationEditServlet", urlPatterns = {"/organization-edit"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 15 // 15 MB
)
public class OrganizationEditServlet extends HttpServlet {

    private OrganizationDAO organizationDAO;

    @Override
    public void init() {
        organizationDAO = new OrganizationDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int organizationId = Integer.parseInt(request.getParameter("id"));
            Organization organization = organizationDAO.selectOrganization(organizationId);

            if (organization != null) {
                request.setAttribute("organization", organization);
                request.getRequestDispatcher("organization-edit.jsp").forward(request, response);
            } else {
                response.sendRedirect("error.jsp"); // Create an error page
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int organizationId = Integer.parseInt(request.getParameter("organizationId"));
            Organization existingOrg = organizationDAO.selectOrganization(organizationId);
            
            int createdBy = existingOrg.getCreatedBy();

            if (existingOrg != null) {
                // Update organization details
                existingOrg.setName(request.getParameter("name"));
                existingOrg.setWebsite(request.getParameter("website"));
                existingOrg.setDescription(request.getParameter("description"));
                existingOrg.setPhone(request.getParameter("phone"));
                existingOrg.setEmail(request.getParameter("email"));

                // Handle image upload
                String imageUrl = request.getParameter("image");
                if (imageUrl != null && !imageUrl.trim().isEmpty()) {
                    existingOrg.setImage(imageUrl.trim());
                }

                // Parse and set establishment date

                // Update organization in database
                organizationDAO.updateOrganization(existingOrg);

                // Redirect to organization detail page
                response.sendRedirect("organization-profile?created_by=" + createdBy);
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    private String getSubmittedFileName(Part part) {
        String header = part.getHeader("content-disposition");
        for (String headerPart : header.split(";")) {
            if (headerPart.trim().startsWith("filename")) {
                return headerPart.substring(headerPart.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "unknown";
    }
}
