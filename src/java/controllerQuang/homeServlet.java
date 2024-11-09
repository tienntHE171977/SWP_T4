/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerQuang;

//import Model.Campaign;
import DAL_Authen.AccountDAO;
import ModelQuang.News;
import ModelQuang.Notification;
import ModelQuang.Organization;
import ModelQuang.Project;
import ModelQuang.ProjectCategory;

import ModelQuang.VCategory;
import ModelQuang.Volunteer;
import dalQuang.DAO;
import dalQuang.NewsDAO;
import dalQuang.OrganizationDAO;
import dalQuang.ProjectCategoryDAO;
import dalQuang.ProjectDAO;
import dalQuang.VCategoryDAO;
import dalQuang.VolunteerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.lang.reflect.Array;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.User;

/**
 *
 * @author admin
 */
public class homeServlet extends HttpServlet {

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
            out.println("<title>Servlet homeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet homeServlet at " + request.getContextPath() + "</h1>");
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
        DAO d = new DAO();
        AccountDAO accDao = new AccountDAO();
        ProjectDAO projectDAO = new ProjectDAO();
        VCategoryDAO VCD = new VCategoryDAO();
        VolunteerDAO VolunteerDAO = new VolunteerDAO();
        NewsDAO newsDAO = new NewsDAO();

        OrganizationDAO organizationDAO = new OrganizationDAO();
        List<Organization> countorg = new ArrayList<>();
        for (Organization allOrganization : organizationDAO.getAllOrganizations()) {
            if (!allOrganization.getOrganizationStatus().equals("pending")) {
                countorg.add(allOrganization);
            }
        }

//        List<News> newss = news.subList(0, 2);
        HttpSession session = request.getSession();
//        session.setAttribute("acc", d.selectUserById(7));
        User user = (User) session.getAttribute("acc");

//        User user = d.selectUserById(1);
        List<User> volunteers = new ArrayList<>();

        for (User volunteer : accDao.getAllAccount()) {
            if (volunteer.getRole().equals("volunteer")) {
                volunteers.add(volunteer);
            }
        }
            
        
        Collections.shuffle(volunteers);
        List<News> news = newsDAO.getAllNews();
        news.sort(Comparator.comparing(News::getCreatedAt).reversed());
//        List<News> n = news;
        List<User> volunteer = new ArrayList<>();
        if (volunteers.size() > 3) {
            volunteer = volunteers.subList(0, 3);
        }

        ProjectCategoryDAO PCD = new ProjectCategoryDAO();
        String searchTitle = request.getParameter("searchTitle");
        String category_id = request.getParameter("category");

        int idc = 0;

        try {

            if (category_id != null) {
                idc = Integer.parseInt(category_id.trim());
            }
            List<VCategory> categories = VCD.getAllVCategories();

            List<Project> byIdCate = new ArrayList<>();
            List<Project> searchResults = new ArrayList<>();
            List<Project> Results = new ArrayList<>();
            List<ProjectCategory> ProjectCategor = new ArrayList<>();

            // Nếu ô tìm kiếm trống, trả về tất cả các dự án
            if (idc == 0) {
                if (searchTitle == null || searchTitle.trim().isEmpty()) {
                    Results = projectDAO.getAllProjects();
                } else if (searchTitle != null || !searchTitle.trim().isEmpty()) {
                    Results = projectDAO.searchProjects(searchTitle);

                }
            } else if (idc != 0) {
                ProjectCategor = PCD.getProjectsByCategoryId(idc);

//            System.out.println(idc);
                for (ProjectCategory p : ProjectCategor) {
//                System.out.println(p.getProjectId());
                    Project po = projectDAO.getProjectById(p.getCategoryId());
                    byIdCate.add(po);
                }

//            System.out.println(byIdCate.size());
                if (searchTitle == null || searchTitle.trim().isEmpty()) {
                    searchResults = projectDAO.getAllProjects();
//                System.out.println(byIdCate.size());
                } else if (searchTitle != null || !searchTitle.trim().isEmpty()) {
                    searchResults = projectDAO.searchProjects(searchTitle);
//                System.out.println(byIdCate.size());

                }
//            System.out.println(byIdCate.size());
                for (Project s : searchResults) {
//                System.out.println(byIdCate.size());
                    for (ProjectCategory p : ProjectCategor) {
//                    System.out.println(byIdCate.size());
                        if (s.getProjectId() == p.getProjectId()) {
                            Results.add(s);
                        }
                    }
                }

            }

            List<Project> project = new ArrayList<>();
            for (Project allProject : Results) {
                if (allProject.getStatus().equals("approved")) {
                    project.add(allProject);
                }
            }
            List<Project> countproject = new ArrayList<>();
            for (Project allProject : projectDAO.getAllProjects()) {
                if (allProject.getStatus().equals("approved")) {
                    countproject.add(allProject);
                }
            }
            List<User> countuser = new ArrayList<>();
            for (User user1 : accDao.getAllAccount()) {
                if (user1.getRole().equals("donor") || user1.getRole().equals("volunteer")) {
                    countuser.add(user1);
                }
            }
            // Lưu danh sách vào request để sử dụng trong JSP
            // Lưu danh sách vào request để sử dụng trong JSP
//            int userid = (int) request.getAttribute("Userid");
//        List<Notification> list = d.getAllNotic();
            List<Project> events = new ArrayList<>();
            List<Project> campaigns = new ArrayList<>();
            for (Project r : project) {
                if (r.getRoleProject().equals("campaign")) {
                    campaigns.add(r);
                } else if (r.getRoleProject().equals("event")) {
                    events.add(r);
                }
            }
            events.sort(Comparator.comparing(Project::getCreatedAt).reversed());
            campaigns.sort(Comparator.comparing(Project::getCreatedAt).reversed());
//            List<Volunteer> volunteers = d.getAllVolunteers();

            request.setAttribute("volunteer", volunteer);
            request.setAttribute("countuser", d.getAll());
            request.setAttribute("orgcount", countorg.size());
            request.setAttribute("countvolun", volunteers.size());
            request.setAttribute("countuser", countuser.size());
            request.setAttribute("news", news);
            request.setAttribute("countproject", countproject.size());
            request.setAttribute("campaigns", campaigns);
            request.setAttribute("events", events);
            request.setAttribute("valuesearch", searchTitle);
//                request.setAttribute("userrole", user.getRole());
            

            request.setAttribute("idc", idc);
            request.setAttribute("categories", categories);

        } catch (Exception e) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        if (user != null) {
            if (organizationDAO.getOByUserId(user.getUserId()) != null) {
                request.setAttribute("userOr", organizationDAO.getOByUserId(user.getUserId()));
            }
            request.setAttribute("user", user);
            if (VolunteerDAO.VolunteerCVByUserid(user.getUserId()) != null) {
                request.setAttribute("yourcv",VolunteerDAO.VolunteerCVByUserid(user.getUserId()) );
            }

        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
