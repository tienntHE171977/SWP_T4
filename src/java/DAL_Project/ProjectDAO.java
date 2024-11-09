/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL_Project;

import DBContext.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Project;
import model.User;
import java.sql.*;
/**
 *
 * @author FPT
 */
public class ProjectDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Project> getAllProject() {
        List<Project> list = new ArrayList<>();
        String query = "SELECT * FROM Projects";

        try { ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int projectId = rs.getInt("project_id");
                String title = rs.getString("title");
                String image = rs.getString("image");
                String description = rs.getString("description");
                Date startDate = rs.getDate("start_date");
                int staffId = rs.getInt("staff_id");
                Date endDate = rs.getDate("end_date");
                String document = rs.getString("document");
                String roleProject = rs.getString("role_project");
                String status = rs.getString("status");
                int createdByOrg = rs.getInt("created_by_org");
                Date createdAt = rs.getDate("created_at");

                Project project = new Project(projectId, title, image, description, startDate, staffId, endDate, document, roleProject, status, createdByOrg, createdAt);
                list.add(project);
            }
        } catch (SQLException exception) {
            System.out.println("Error while fetching projects: " + exception.getMessage());
        }

        return list;
    }
    public int getTotalProjects() {
        String query = "SELECT COUNT(*) FROM Projects";
        try { ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException exception) {
            System.out.println("Error while fetching total projects: " + exception.getMessage());
        }
        return 0;
    }

    public int getTotalEvents() {
        String query = "SELECT COUNT(*) FROM Projects WHERE role_project = 'event'";
        try { ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException exception) {
            System.out.println("Error while fetching total events: " + exception.getMessage());
        }
        return 0;
    }

    public int getTotalCampaigns() {
        String query = "SELECT COUNT(*) FROM Projects WHERE role_project = 'campaign'";
        try { ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException exception) {
            System.out.println("Error while fetching total campaigns: " + exception.getMessage());
        }
        return 0;
    }
     public static void main(String[] args) {
        // Thiết lập kết nối cơ sở dữ liệu
        
            ProjectDAO projectDAO = new ProjectDAO();

            // Kiểm tra phương thức getAllProject
            List<Project> projects = projectDAO.getAllProject();
            System.out.println("Total Projects: " + projects.size());
            for (Project project : projects) {
                System.out.println(project);
            }

            // Kiểm tra phương thức getTotalProjects
            int totalProjects = projectDAO.getTotalProjects();
            System.out.println("Total number of projects: " + totalProjects);

            // Kiểm tra phương thức getTotalEvents
            int totalEvents = projectDAO.getTotalEvents();
            System.out.println("Total number of events: " + totalEvents);

            // Kiểm tra phương thức getTotalCampaigns
            int totalCampaigns = projectDAO.getTotalCampaigns();
            System.out.println("Total number of campaigns: " + totalCampaigns);

        
    }
}
