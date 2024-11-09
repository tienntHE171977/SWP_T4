/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO_H;


import DBContext.DBContext;
import model.Project_1;
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

    private static final String INSERT_PROJECT_SQL = "INSERT INTO Projects (project_id,title, image, description, start_date, end_date, document, role_project, staff_id, created_by_org,status) VALUES (?, ?, ?, ?,?, ?, ?, ?, ?,?);";

    public List<Project_1> getProject(int pageNumber, int pageSize) {
        List<Project_1> projects = new ArrayList<>();
        String sql = "SELECT [project_id], [title], [description], [start_date], [end_date], [document], [status], [created_by_org], [created_at] "
                + "FROM [Projects] "
                + "ORDER BY [project_id] " // đảm bảo kết quả được sắp xếp để phân trang ổn định
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            // Tính toán giá trị offset (bắt đầu từ bản ghi nào)
            int offset = (pageNumber - 1) * pageSize;

            // Thiết lập giá trị cho OFFSET và FETCH
            pstmt.setInt(1, offset);
            pstmt.setInt(2, pageSize);

            ResultSet rs = pstmt.executeQuery();
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

                Project_1 project = new Project_1(projectId, title, description, startDate, endDate, document, status, createdByOrg, createdAt);
                projects.add(project);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return projects;

    }

    public int getTotalPages(int pageSize) {
        int totalRecords = 0;
        String sql = "SELECT COUNT(*) as total FROM [Projects]";

        try (PreparedStatement pstmt = connection.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                totalRecords = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }

        // Tính toán tổng số trang
        return (int) Math.ceil((double) totalRecords / pageSize);
    }

    public void insertProject(Project_1 project) throws SQLException {
        try ( PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PROJECT_SQL, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, project.getTitle());
            preparedStatement.setString(2, project.getImage());
            preparedStatement.setString(3, project.getDescription());
            preparedStatement.setDate(4, new java.sql.Date(project.getStartDate().getTime()));
            preparedStatement.setDate(5, new java.sql.Date(project.getEndDate().getTime()));
            preparedStatement.setString(6, project.getDocument());
            preparedStatement.setString(7, project.getRole());
            preparedStatement.setInt(8, project.getStaff_id());
            preparedStatement.setString(9, project.getCreatedByOrg());
            preparedStatement.setString(10, "pending");

            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        project.setProjectId(generatedKeys.getInt(1));
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println();

        }
    }
    public Project_1 getProjectDetail(int project_id) {
        
        String sql = "select * from Projects where project_id =?";
        Project_1  project = null;
            try( 
                 PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, project_id);
            ResultSet resultSet = preparedStatement.executeQuery();

            // Kiểm tra nếu có kết quả trả về
            if (resultSet.next()) {
                // Lấy thông tin từ ResultSet và tạo đối tượng Project_1
              project = new Project_1();
                project.setProjectId(resultSet.getInt("project_id"));
                project.setTitle(resultSet.getString("title"));
                project.setImage(resultSet.getString("image"));
                project.setDescription(resultSet.getString("description"));
                project.setStartDate(resultSet.getDate("start_date"));
                project.setEndDate(resultSet.getDate("end_date"));
                project.setDocument(resultSet.getString("document"));
                project.setStatus(resultSet.getString("status"));
                project.setRole(resultSet.getString("role_project")); // Cái này cần được sửa thành `role_project`
                project.setCreatedByOrg(resultSet.getString("created_by_org"));
                project.setCreatedAt(resultSet.getDate("created_at"));
            }
    
        } catch (SQLException e){
            e.printStackTrace();
        }
    
        return project;
    }
    public List<Project_1> getApproved( ) {
        String sql = "SELECT [project_id], [title], [image], [description], [start_date], "
               + "[staff_id], [end_date], [document], [role_project], [created_by_org], [created_at] "
               + "FROM [dbo].[Projects] "
               + "WHERE [status] = 'approved'";
    
    List<Project_1> projects = new ArrayList<>();
    
    try (
         PreparedStatement preparedStatement = connection.prepareStatement(sql);
         ResultSet resultSet = preparedStatement.executeQuery()) {

        while (resultSet.next()) {
            Project_1 project = new Project_1();
            project.setProjectId(resultSet.getInt("project_id"));
            project.setTitle(resultSet.getString("title"));
            project.setImage(resultSet.getString("image"));
            project.setDescription(resultSet.getString("description"));
            project.setStartDate(resultSet.getDate("start_date"));
            project.setStaff_id(resultSet.getInt("staff_id"));
            project.setEndDate(resultSet.getDate("end_date"));
            project.setDocument(resultSet.getString("document"));
            project.setRole(resultSet.getString("role_project"));
            project.setCreatedByOrg(resultSet.getString("created_by_org"));
            project.setCreatedAt(resultSet.getTimestamp("created_at"));
            
            projects.add(project);
        }

    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println("Error retrieving approved projects.");
    }
    
        return projects;
    }

    public static void main(String[] args) {
         ProjectDAO projectDAO = new ProjectDAO(); // Tạo đối tượng ProjectDAO
    int projectIdToTest = 6; // ID dự án cần kiểm tra (thay đổi tùy theo dự án có trong cơ sở dữ liệu)

  
        Project_1 project = projectDAO.getProjectDetail(projectIdToTest); // Gọi hàm lấy chi tiết dự án

        if (project != null) {
            // In thông tin dự án ra màn hình
            System.out.println("Project ID: " + project.getProjectId());
            System.out.println("Title: " + project.getTitle());
            System.out.println("Description: " + project.getDescription());
            System.out.println("Start Date: " + project.getStartDate());
            System.out.println("End Date: " + project.getEndDate());
            System.out.println("Document: " + project.getDocument());
            System.out.println("Status: " + project.getStatus());
            System.out.println("Role: " + project.getRole());
            System.out.println("Created By Org: " + project.getCreatedByOrg());
            System.out.println("Created At: " + project.getCreatedAt());
        } else {
            System.out.println("No project found with ID: " + projectIdToTest);
        }

    }
}

