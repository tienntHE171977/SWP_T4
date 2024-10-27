package Servlet.Event;

import DAO.ProjectEventDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

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
            eventDAO.deleteProjectEvent(eventId);
            response.sendRedirect(request.getContextPath() + "/event-manage");
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
}
