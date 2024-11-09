package Controller_Event;

import DAO_C.ProjectEventDAO;
import Model_C.ProjectEvent;
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
        int pageSize = 10; // Số lượng sự kiện trên mỗi trang
        int pageNumber = 1; // Số trang hiện tại

        String pageStr = request.getParameter("page");
        if (pageStr != null && !pageStr.isEmpty()) {
            pageNumber = Integer.parseInt(pageStr);
        }

        List<ProjectEvent> events = eventDAO.selectAllEventsPaged(pageNumber, pageSize);
        int totalEvents = eventDAO.getTotalEvents();
        int totalPages = (int) Math.ceil((double) totalEvents / pageSize);

        request.setAttribute("events", events);
        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("totalPages", totalPages);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/event-manage.jsp");
        dispatcher.forward(request, response);
    }
}
