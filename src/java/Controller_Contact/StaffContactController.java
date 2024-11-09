/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_Contact;

import DAL_Staff.ContactDAO;
import DAL_Staff.NotificationDAO;
import static Sendmail.EmailSender.sendReplyEmail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Contact;
import model.Notification;
import model.Staff;
import model.User;

/**
 *
 * @author FPT
 */
@WebServlet(name = "StaffContactController", urlPatterns = {"/staffcontact"})
public class StaffContactController extends HttpServlet {

    private ContactDAO contactDAO;

    @Override
    public void init() {
        contactDAO = new ContactDAO();
    }

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
            out.println("<title>Servlet StaffContactController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffContactController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                listContacts(request, response);
                break;
            case "view":
                viewContact(request, response);
                break;
            case "assign":
                assignContact(request, response);
                break;
            case "delete":
                deleteContact(request, response);
                break;
            default:
                listContacts(request, response);
        };

    }

    private void listContacts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        int pageSize = 10;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        
        String status = request.getParameter("status");
        String searchName = request.getParameter("searchName");

        List<Contact> contacts;
        if (searchName != null && !searchName.isEmpty()) {
            contacts = contactDAO.searchContactsByName(searchName);
        } else {
            contacts = contactDAO.getAllContacts(page, pageSize, status);
        }
        int totalContacts = contactDAO.getTotalContacts(status);

        int totalPages = (int) Math.ceil((double) totalContacts / pageSize);

        request.setAttribute("contacts", contacts);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("status", status);
        request.getRequestDispatcher("/contactList.jsp").forward(request, response);
    }

    private void viewContact(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int contactId = Integer.parseInt(request.getParameter("id"));
        Contact contact = contactDAO.getContactById(contactId);
        request.setAttribute("contact", contact);
        request.getRequestDispatcher("/staff-contact-view.jsp").forward(request, response);
    }

    private void assignContact(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        Staff currentStaff = (Staff) session.getAttribute("staff");

        if (currentStaff != null && currentStaff.getUser() != null) {
            System.out.println("Attempting to assign contact " + id + " to staff " + currentStaff.getStaff_id());
            boolean success = contactDAO.assignContactToStaff(id, currentStaff.getStaff_id());
            if (success) {
                System.out.println("Contact assigned successfully");
                response.sendRedirect("staffcontact?action=list&message=assigned");
            } else {
                response.sendRedirect("staffcontact?action=list&message=error");
            }
        } else {

            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int contactId = Integer.parseInt(request.getParameter("id"));
        int currentStaffId = getCurrentStaffId(request);
        HttpSession session = request.getSession();
        String message = "";
        try {
            switch (action) {
                case "updateStatus":
                    String newStatus = request.getParameter("status");
                    contactDAO.updateContactStatus(contactId, newStatus, currentStaffId);
                    message = "Status updated successfully.";
                    break;

                case "sendReply":
                    String toEmail = request.getParameter("toEmail");
                    String replyMessage = request.getParameter("replyMessage");
                    String subject = request.getParameter("subject");
                    sendReplyEmail(toEmail, subject, replyMessage);
                    contactDAO.updateContactStatus(contactId, "resolved", currentStaffId);
                    message = "Reply sent and status updated to resolved.";
                    break;
                case "assignToMe":

                    contactDAO.assignContactToStaff(contactId, contactId);

                    break;
                case "delete":

                    boolean success = contactDAO.deleteContact(contactId);
                    if (success) {
                        message = "Delete contact suscessfully";
                    } else {
                        message = "Delete contact not suscessfully";
                    }

                    break;
                default:
                    listContacts(request, response);
            }

            // If we reach here, it means the operation was successful
            session.setAttribute("message", message);
            session.setAttribute("messageType", "success");

        } catch (Exception e) {
            // Log the exception
            e.printStackTrace();

            // Set error message
            session.setAttribute("message", "An error occurred: " + e.getMessage());
            session.setAttribute("messageType", "error");
        }

        // Redirect
        response.sendRedirect("staffcontact?action=list&id=" + contactId);
    }

    private void updateContactStatus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int contactId = Integer.parseInt(request.getParameter("id"));
        String newStatus = request.getParameter("status");
        HttpSession session = request.getSession();
        Staff currentStaff = (Staff) session.getAttribute("staff");

        contactDAO.updateContactStatus(contactId, newStatus, currentStaff.getStaff_id());

        response.sendRedirect("staffcontact?action=view&id=" + contactId);
    }

    private int getCurrentStaffId(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Staff staffId = (Staff) session.getAttribute("staff");
        if (staffId == null) {
            // Xử lý trường hợp chưa đăng nhập
            throw new IllegalStateException("Staff not logged in");
        }
        return staffId.getStaff_id();
    }

    private void deleteContact(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

    }

}
