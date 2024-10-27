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
import java.util.List;

@WebServlet("/event-manage")
public class EventManageServlet extends HttpServlet {
    private ProjectEventDAO eventDAO;

    public void init() {
        eventDAO = new ProjectEventDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<ProjectEvent> events = eventDAO.selectAllEvents();
        request.setAttribute("events", events);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/event-manage.jsp");
        dispatcher.forward(request, response);
    }
}