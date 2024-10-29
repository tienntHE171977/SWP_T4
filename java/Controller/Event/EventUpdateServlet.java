package Servlet.Event;

import DAO.ProjectEventDAO;
import Model.ProjectEvent;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/event-update")
public class EventUpdateServlet extends HttpServlet {
    private ProjectEventDAO eventDAO;

    public void init() {
        eventDAO = new ProjectEventDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int eventId = Integer.parseInt(request.getParameter("id"));
            ProjectEvent event = eventDAO.getProjectEventById(eventId);
            if (event != null) {
                request.setAttribute("event", event);
                request.getRequestDispatcher("/event-update.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/project-event-manage?projectId=" + 
                    request.getParameter("projectId"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int eventId = Integer.parseInt(request.getParameter("eventId"));
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            String itemName = request.getParameter("itemName");
            int quantityNeeded = Integer.parseInt(request.getParameter("quantityNeeded"));
            int quantityProvided = Integer.parseInt(request.getParameter("quantityProvided"));
            String unit = request.getParameter("unit");

            ProjectEvent event = new ProjectEvent();
            event.setEventId(eventId);
            event.setProjectId(projectId);
            event.setItemName(itemName);
            event.setQuantityNeeded(quantityNeeded);
            event.setQuantityProvided(quantityProvided);
            event.setUnit(unit);

            eventDAO.updateProjectEvent(event);
            response.sendRedirect(request.getContextPath() + "/project-event-manage?projectId=" + projectId);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}