package Servlet.Event;

import DAO.ProjectEventDAO;
import Model.ProjectEvent;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/event-update")
public class EventUpdateServlet extends HttpServlet {
    private ProjectEventDAO eventDAO;

    public void init() {
        eventDAO = new ProjectEventDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int eventId = Integer.parseInt(request.getParameter("id"));
        ProjectEvent existingEvent = eventDAO.getProjectEventById(eventId);
        request.setAttribute("event", existingEvent);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/event-update.jsp");
        dispatcher.forward(request, response);
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

            ProjectEvent event = new ProjectEvent(eventId, projectId, itemName, quantityNeeded, quantityProvided, unit);
            eventDAO.updateProjectEvent(event);
            response.sendRedirect(request.getContextPath() + "/event-manage");
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
}