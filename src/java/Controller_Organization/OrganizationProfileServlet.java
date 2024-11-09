package Controller_Organization;

import DAO_C.OrganizationDAO;
import DAO_C.ProjectDAO;
import Model_C.Organization;
import Model_C.Project;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet(name = "OrganizationProfileServlet", urlPatterns = {"/organization-profile"})
public class OrganizationProfileServlet extends HttpServlet {
    private OrganizationDAO organizationDAO;
    private ProjectDAO projectDAO;

    public void init() {
        organizationDAO = new OrganizationDAO();
        projectDAO = new ProjectDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get created_by ID from request parameter
            /*HttpSession session = request.getSession();
            User user = (User)request.getAttribute("acc");
            int createdById = user.getUserId();
            if(user == null){
                response.sendRedirect("login");
            }*/
            
            int createdBy = Integer.parseInt(request.getParameter("created_by"));
            
            // Get organization details by created_by
            Organization organization = organizationDAO.getOrganizationByCreatedBy(createdBy);

            if (organization != null) {
                // Get all projects for this organization
                List<Project> projects = projectDAO.getProjectByOrgId(organization.getOrganizationId());

                // Set attributes for JSP
                request.setAttribute("organization", organization);
                request.setAttribute("projects", projects);

                // Calculate project statistics
                int totalProjects = projects.size();
                int pendingProjects = 0;
                int approvedProjects = 0;
                int rejectedProjects = 0;

                for (Project project : projects) {
                    switch (project.getStatus().toLowerCase()) {
                        case "pending":
                            pendingProjects++;
                            break;
                        case "approved":
                            approvedProjects++;
                            break;
                        case "rejected":
                            rejectedProjects++;
                            break;
                    }
                }

                request.setAttribute("totalProjects", totalProjects);
                request.setAttribute("pendingProjects", pendingProjects);
                request.setAttribute("approvedProjects", approvedProjects);
                request.setAttribute("rejectedProjects", rejectedProjects);

                // Forward to JSP page
                RequestDispatcher dispatcher = request.getRequestDispatcher("organization-profile.jsp");
                dispatcher.forward(request, response);
            } else {
                // Handle organization not found
                response.sendRedirect("error-page.jsp"); // You should create this page
            }

        } catch (NumberFormatException e) {
            // Handle invalid ID parameter
            response.sendRedirect("error-page.jsp"); // You should create this page
        }
    }
}
