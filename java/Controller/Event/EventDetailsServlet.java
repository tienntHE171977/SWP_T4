package Servlet.Event;

import DAO.ProjectEventDAO;
import Model.ProjectEvent;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/event-details")
public class EventDetailsServlet extends HttpServlet {
    
    private ProjectEventDAO projectEventDAO;
    
    public void init() {
        projectEventDAO = new ProjectEventDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String eventIdStr = request.getParameter("id");
        
        if (eventIdStr != null && !eventIdStr.isEmpty()) {
            try {
                int eventId = Integer.parseInt(eventIdStr);
                ProjectEvent event = projectEventDAO.getProjectEventById(eventId);
                
                if (event != null) {
                    // Calculate progress percentage
                    double progressPercentage = 0;
                    if (event.getQuantityNeeded() > 0) {
                        progressPercentage = ((double) event.getQuantityProvided() / event.getQuantityNeeded()) * 100;
                    }
                    
                    request.setAttribute("event", event);
                    request.setAttribute("progressPercentage", Math.round(progressPercentage));
                    
                    request.getRequestDispatcher("/event-details.jsp").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Event not found");
                }
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid event ID");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Event ID is required");
        }
    }
}