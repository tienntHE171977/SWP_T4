/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Project;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author pc
 */
public class ProjectDAO extends DBContext {

    public List<Project> getProject() {
        List<Project> projects = new ArrayList<>();
        String sql = "SELECT [project_id], [title], [description], [start_date], [end_date], [document], [status], [created_by_org], [created_at] "
                + "FROM [Volunteerisms].[dbo].[Projects]";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery(); // gọi phương thức executeQuery() mà không có tham số
            while (rs.next()) {
                int projectId = rs.getInt("project_id");
                String title = rs.getString("title");
                String description = rs.getString("description");
                Date startDate = rs.getDate("start_date");
                Date endDate = rs.getDate("end_date");
                String document = rs.getString("document");
                String status = rs.getString("status");
                String createdByOrg = rs.getString("created_by_org");
                Date createdAt = rs.getDate("created_at");
                Project project = new Project(projectId, title, description, startDate, endDate, document, status, createdByOrg, createdAt);
                projects.add(project);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return projects;
    }

    public static void main(String[] args) {
        ProjectDAO project = new ProjectDAO();
        List<Project> projects = project.getProject();
        for (Project pt : projects) {
            System.out.println(pt.getProjectId());
            System.out.println(pt.getTitle());
            System.out.println(pt.getDescription());
            System.out.println(pt.getStartDate());
            System.out.println(pt.getEndDate());

            System.out.println(pt.getDocument());
            System.out.println(pt.getStatus());
            System.out.println(pt.getCreatedByOrg());
            System.out.println(pt.getCreatedAt());
        }
    }
}
