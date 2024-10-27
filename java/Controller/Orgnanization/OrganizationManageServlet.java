package Servlet.Organization;

import DAO.OrganizationDAO;
import Model.Organization;
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
        List<Organization> allOrganizations = organizationDAO.selectAllOrganizations();
        
        // Separate organizations by status
        List<Organization> pendingOrganizations = allOrganizations.stream()
            .filter(org -> "pending".equals(org.getOrganizationStatus()))
            .collect(Collectors.toList());
            
        List<Organization> activeInactiveOrganizations = allOrganizations.stream()
            .filter(org -> !"pending".equals(org.getOrganizationStatus()))
            .collect(Collectors.toList());
        
        request.setAttribute("pendingOrganizations", pendingOrganizations);
        request.setAttribute("activeInactiveOrganizations", activeInactiveOrganizations);
        
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