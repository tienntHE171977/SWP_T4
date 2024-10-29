package Servlet.Event;

import DAO.ProjectEventDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/event-delete")
public class EventDeleteServlet extends HttpServlet {
    private ProjectEventDAO eventDAO;

    public void init() {
        eventDAO = new ProjectEventDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int eventId = Integer.parseInt(request.getParameter("id"));
            String projectId = request.getParameter("projectId");
            
            eventDAO.deleteProjectEvent(eventId);
            response.sendRedirect(request.getContextPath() + "/project-event-manage?projectId=" + projectId);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}