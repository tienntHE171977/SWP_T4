/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_Staff;

import DAL_Project.OrganizationDAO;
import DAL_Project.ProjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.Year;
import java.util.List;
import java.util.Map;

/**
 *
 * @author FPT
 */
@WebServlet(name = "SatffController", urlPatterns = {"/staff"})
public class StaffController extends HttpServlet {

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProjectDAO projectDAO = new ProjectDAO();
        OrganizationDAO organizationDAO = new OrganizationDAO();
        int totalProjects = projectDAO.getTotalProjects();
        int totalEvents = projectDAO.getTotalEvents();
        int totalCampaigns = projectDAO.getTotalCampaigns();
        int totalOrganization = organizationDAO.getTotalOrganization();

        // Lấy năm từ tham số yêu cầu, mặc định là năm hiện tại nếu không có
        String yearParam = request.getParameter("year");
        int currentYear = 2024;
        int year = (yearParam != null) ? Integer.parseInt(yearParam) : currentYear;

        Map<String, Integer> organizationsPerMonth = organizationDAO.getOrganizationsCreatedPerMonth(year);

        request.setAttribute("organizationsPerMonth", organizationsPerMonth);
        request.setAttribute("selectedYear", year);
        request.setAttribute("years", List.of(currentYear, currentYear - 1, currentYear - 2, currentYear - 3)); // Bốn năm gần nhất

        request.setAttribute("totalOrganization", totalOrganization);
        request.setAttribute("totalProjects", totalProjects);
        request.setAttribute("totalEvents", totalEvents);
        request.setAttribute("totalCampaigns", totalCampaigns);
        request.getRequestDispatcher("staff.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("staff.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
