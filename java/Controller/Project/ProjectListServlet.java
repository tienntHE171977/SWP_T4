package Servlet.Project;

import DAO.ProjectDAO;
import Model.Project;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/project-list")
public class ProjectListServlet extends HttpServlet {
    private ProjectDAO projectDAO;

    public void init() {
        projectDAO = new ProjectDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Project> projects = projectDAO.selectAllProjects();
        request.setAttribute("projects", projects);
        request.getRequestDispatcher("/project-list.jsp").forward(request, response);
    }
}