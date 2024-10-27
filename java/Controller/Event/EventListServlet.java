package Servlet.Event;

import DAO.ProjectEventDAO;
import Model.ProjectEvent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/event-list")
public class EventListServlet extends HttpServlet {
    private ProjectEventDAO eventDAO;

    public void init() {
        eventDAO = new ProjectEventDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get project ID from request parameter if filtering by project
        String projectIdStr = request.getParameter("projectId");
        List<ProjectEvent> events;
        
        if (projectIdStr != null && !projectIdStr.isEmpty()) {
            int projectId = Integer.parseInt(projectIdStr);
            events = eventDAO.getEventsByProjectId(projectId);
        } else {
            // If no project ID specified, you might want to show all events
            // You'll need to add a method in ProjectEventDAO to get all events
            events = eventDAO.selectAllEvents(); // Modify this according to your needs
        }
        
        request.setAttribute("events", events);
        request.getRequestDispatcher("/event-list.jsp").forward(request, response);
    }
}