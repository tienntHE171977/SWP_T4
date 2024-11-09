package Controller_Event;

import DAO_C.ProjectEventDAO;
import Model_C.ProjectEvent;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/event-donate")
public class EventDonateServlet extends HttpServlet {

    private ProjectEventDAO projectEventDAO;

    public void init() {
        projectEventDAO = new ProjectEventDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String itemName = request.getParameter("itemName");
        int quantityToDonate = Integer.parseInt(request.getParameter("quantity"));
        int projectId = Integer.parseInt(request.getParameter("projectId")); // Lấy projectId từ request

        // Tìm sự kiện theo itemName và projectId
        ProjectEvent event = projectEventDAO.getProjectEventByItemName(itemName, projectId);

        if (event != null) {
            int newQuantityProvided = event.getQuantityProvided() + quantityToDonate;

            if (newQuantityProvided > event.getQuantityNeeded()) {
                // Nếu số lượng cung cấp vượt quá yêu cầu
                request.setAttribute("errorMessage", "Số lượng cung cấp vượt quá yêu cầu!");
                response.sendRedirect(request.getContextPath() + "/project-details?id=" + event.getProjectId());
            } else {
                // Cập nhật số lượng đã cung cấp
                event.setQuantityProvided(newQuantityProvided);
                try {
                    projectEventDAO.updateProjectEvent(event);
                } catch (SQLException ex) {
                    Logger.getLogger(EventDonateServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

                // Chuyển hướng về trang chi tiết dự án
                response.sendRedirect(request.getContextPath() + "/project-details?id=" + event.getProjectId());
            }
        } else {
            // Nếu không tìm thấy sự kiện
            request.setAttribute("errorMessage", "Sự kiện không tồn tại!");
            request.getRequestDispatcher("/project-details?id="+projectId).forward(request, response);
        }
    }

}
