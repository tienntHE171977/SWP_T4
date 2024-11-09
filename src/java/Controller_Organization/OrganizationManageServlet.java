package Controller_Organization;

import DAO_C.OrganizationDAO;
import Model_C.Organization;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/organization-manage")
public class OrganizationManageServlet extends HttpServlet {

    private OrganizationDAO organizationDAO;

    public void init() {
        organizationDAO = new OrganizationDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int pageSize = 10; // Số lượng tổ chức hiển thị trên mỗi trang
        int currentPage = Integer.parseInt(request.getParameter("page") != null ? request.getParameter("page") : "1");

        // Lấy danh sách tổ chức đã hoạt động và không hoạt động
        List<Organization> activeInactiveOrganizations = organizationDAO.selectActiveInactiveOrganizations();
        List<Organization> pendingOrganizations = organizationDAO.selectPendingOrganizations();

        // Phân trang cho activeInactiveOrganizations
        int totalActiveInactive = activeInactiveOrganizations.size();
        int totalPagesActiveInactive = (int) Math.ceil((double) totalActiveInactive / pageSize);
        List<Organization> paginatedActiveInactiveOrganizations = activeInactiveOrganizations.stream()
                .skip((currentPage - 1) * pageSize)
                .limit(pageSize)
                .collect(Collectors.toList());

        // Phân trang cho pendingOrganizations
        int totalPending = pendingOrganizations.size();
        int totalPagesPending = (int) Math.ceil((double) totalPending / pageSize);
        List<Organization> paginatedPendingOrganizations = pendingOrganizations.stream()
                .skip((currentPage - 1) * pageSize)
                .limit(pageSize)
                .collect(Collectors.toList());

        request.setAttribute("pendingOrganizations", paginatedPendingOrganizations);
        request.setAttribute("activeInactiveOrganizations", paginatedActiveInactiveOrganizations);
        request.setAttribute("currentPageActiveInactive", currentPage);
        request.setAttribute("totalPagesActiveInactive", totalPagesActiveInactive);
        request.setAttribute("currentPagePending", currentPage);
        request.setAttribute("totalPagesPending", totalPagesPending);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/organization-manage.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            int organizationId = Integer.parseInt(request.getParameter("organizationId"));

            Organization organization = organizationDAO.selectOrganization(organizationId);

            if (organization != null) {
                switch (action) {
                    case "approve":
                        organization.setOrganizationStatus("active");
                        break;
                    case "toggleStatus":
                        organization.setOrganizationStatus(
                                "active".equals(organization.getOrganizationStatus()) ? "inactive" : "active"
                        );
                        break;
                }

                organizationDAO.updateOrganization(organization);
            }

            response.sendRedirect(request.getContextPath() + "/organization-manage");

        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
}
