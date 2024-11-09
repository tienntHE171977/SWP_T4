package Controller_Organization;

import DAO_C.OrganizationDAO;
import DAO_C.ProjectDAO;
import Model_C.Organization;
import Model_C.Project;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/project-management")
public class ProjectManagementServlet extends HttpServlet {

    private ProjectDAO projectDAO;
    private OrganizationDAO organizationDAO;

    public void init() {
        projectDAO = new ProjectDAO();
        organizationDAO = new OrganizationDAO(); // Khởi tạo OrganizationDAO
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String orgIdStr = request.getParameter("orgId");
            if (orgIdStr == null || orgIdStr.trim().isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Organization ID is required");
                return;
            }

            int organizationId = Integer.parseInt(orgIdStr);

            // Phân trang
            int pageSize = 10; // Số lượng dự án trên mỗi trang
            int currentPage = 1; // Trang hiện tại

            String pageParam = request.getParameter("page");
            if (pageParam != null && !pageParam.isEmpty()) {
                currentPage = Integer.parseInt(pageParam);
            }

            List<Project> allProjects = projectDAO.getProjectByOrgId(organizationId);

            // Tính toán chỉ số bắt đầu và kết thúc
            int totalProjects = allProjects.size();
            int totalPages = (int) Math.ceil((double) totalProjects / pageSize);

            // Lấy danh sách dự án cho trang hiện tại
            List<Project> paginatedProjects = allProjects.stream()
                    .skip((currentPage - 1) * pageSize)
                    .limit(pageSize)
                    .toList();

            // Lấy thông tin tổ chức để lấy created_by
            Organization organization = organizationDAO.selectOrganization(organizationId);
            int createdById = organization.getCreatedBy(); // Lấy created_by

            request.setAttribute("projects", paginatedProjects);
            request.setAttribute("organizationId", organizationId);
            request.setAttribute("createdBy", createdById);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("totalPages", totalPages);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/project-management.jsp");
            dispatcher.forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid organization ID format");
        } catch (Exception e) {
            System.out.println("Error in doGet: " + e.getMessage());
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            Project project = projectDAO.selectProject(projectId);

            if (project != null) {
                project.setTitle(request.getParameter("title"));
                project.setDescription(request.getParameter("description"));

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date startDate = dateFormat.parse(request.getParameter("startDate"));
                Date endDate = dateFormat.parse(request.getParameter("endDate"));

                project.setStartDate(startDate);
                project.setEndDate(endDate);
                project.setRoleProject(request.getParameter("roleProject"));

                projectDAO.updateProject(project);
            }

            response.sendRedirect(request.getContextPath() + "/project-management?orgId=" + project.getCreatedByOrg());

        } catch (SQLException | ParseException ex) {
            System.out.println("Error in doPost: " + ex.getMessage());
            ex.printStackTrace();
            throw new ServletException(ex);
        }
    }
}
