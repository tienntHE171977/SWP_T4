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

@WebServlet("/event-create")
public class EventCreateServlet extends HttpServlet {
    private ProjectEventDAO eventDAO;

    public void init() {
        eventDAO = new ProjectEventDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/event-create.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            String itemName = request.getParameter("itemName");
            int quantityNeeded = Integer.parseInt(request.getParameter("quantityNeeded"));
            int quantityProvided = Integer.parseInt(request.getParameter("quantityProvided"));
            String unit = request.getParameter("unit");

            ProjectEvent newEvent = new ProjectEvent();
            newEvent.setProjectId(projectId);
            newEvent.setItemName(itemName);
            newEvent.setQuantityNeeded(quantityNeeded);
            newEvent.setQuantityProvided(quantityProvided);
            newEvent.setUnit(unit);

            eventDAO.createProjectEvent(newEvent);
            response.sendRedirect(request.getContextPath() + "/event-manage");
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
}