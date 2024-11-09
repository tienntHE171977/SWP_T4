package Controller_Event;

import DAO_C.ProjectEventDAO;
import Model_C.ProjectEvent;
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
        String projectIdStr = request.getParameter("projectId");
        String pageStr = request.getParameter("page");
        int pageSize = 10; // Số lượng sự kiện trên mỗi trang
        int pageNumber = (pageStr != null && !pageStr.isEmpty()) ? Integer.parseInt(pageStr) : 1;

        List<ProjectEvent> events;
        if (projectIdStr != null && !projectIdStr.isEmpty()) {
            int projectId = Integer.parseInt(projectIdStr);
            events = eventDAO.getEventsByProjectId(projectId);
        } else {
            // Lấy danh sách sự kiện với phân trang
            events = eventDAO.selectAllEventsPaged(pageNumber, pageSize);
        }

        int totalEvents = eventDAO.getTotalEvents();
        int totalPages = (int) Math.ceil((double) totalEvents / pageSize);

        request.setAttribute("events", events);
        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("/event-list.jsp").forward(request, response);
    }
}
