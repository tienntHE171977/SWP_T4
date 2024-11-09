/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_Staff;

import DAL_Project.OrganizationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.time.Year;
import java.util.List;
import java.util.Map;
import javax.swing.JFileChooser;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author FPT
 */
@WebServlet(name = "ExportExcelController", urlPatterns = {"/exportexcel"})
public class ExportExcelController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ExportExcelController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExportExcelController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String yearParam = request.getParameter("year");
    int currentYear = 2024;
    int year = (yearParam != null) ? Integer.parseInt(yearParam) : currentYear;
    String service = request.getParameter("Service");
    OrganizationDAO o = new OrganizationDAO();

    if ("export".equals(service)) {
        Map<String, Integer> organizationsPerMonth = o.getOrganizationsCreatedPerMonth(year);
        boolean isExport = exportToExcel(response, organizationsPerMonth);
        if (!isExport) {
            request.setAttribute("mess", "Export failed");
            request.getRequestDispatcher("staff.jsp").forward(request, response);
        }
        return; // Exit the method to prevent forwarding after export
    }

    request.getRequestDispatcher("staff.jsp").forward(request, response);
    }
    private static String getStringCellValue(Cell cell) {
        return cell != null ? cell.getStringCellValue() : "";
    }

    private static int getNumericCellValue(Cell cell) {
        return cell != null ? (int) cell.getNumericCellValue() : 0;
    }

    public boolean exportToExcel(HttpServletResponse response, Map<String, Integer> organizationsPerMonth) {
    Workbook workbook = new XSSFWorkbook();
    Sheet sheet = workbook.createSheet("Organizations Data");

    // Create header row
    Row headerRow = sheet.createRow(0);
    headerRow.createCell(0).setCellValue("Month");
    headerRow.createCell(1).setCellValue("Total Organizations");

    // Fill data
    int rowNum = 1;
    for (Map.Entry<String, Integer> entry : organizationsPerMonth.entrySet()) {
        Row row = sheet.createRow(rowNum++);
        row.createCell(0).setCellValue(entry.getKey());
        row.createCell(1).setCellValue(entry.getValue());
    }

    try (ServletOutputStream out = response.getOutputStream()) {
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=organizations_data.xlsx");
        workbook.write(out);
        workbook.close();
        return true;
    } catch (IOException e) {
        e.printStackTrace();
        return false;
    }
}


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
