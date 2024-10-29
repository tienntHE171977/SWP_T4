package dal;

import Model.Organization;
import Model.Project;
import Model.ProjectCategory;
import Model.VCategory;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjectDAO extends DBContext {

    OrganizationDAO od = new OrganizationDAO();

    public List<Project> getAllProjects() {
        List<Project> projectList = new ArrayList<>();
        String sql = "SELECT * FROM Projects";

        try (Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                Project project = new Project();
                project.setProjectId(resultSet.getInt("project_id"));
                project.setTitle(resultSet.getString("title"));
                project.setImage(resultSet.getString("image"));
                project.setDescription(resultSet.getString("description"));
                project.setStartDate(resultSet.getDate("start_date"));
                project.setEndDate(resultSet.getDate("end_date"));
                project.setDocument(resultSet.getString("document"));
                project.setRoleProject(resultSet.getString("role_project"));
                project.setStatus(resultSet.getString("status"));
                project.setCreatedByOrg(od.getOById(resultSet.getInt("created_by_org")));
                project.setCreatedAt(resultSet.getDate("created_at"));
                project.setStaffId(resultSet.getInt("staff_id"));

                projectList.add(project);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projectList;
    }
    public List<Project> getAllProjectsWait() {
        List<Project> projectList = new ArrayList<>();
        String sql = "SELECT * FROM Projects where status like 'pending'";

        try (Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                Project project = new Project();
                project.setProjectId(resultSet.getInt("project_id"));
                project.setTitle(resultSet.getString("title"));
                project.setImage(resultSet.getString("image"));
                project.setDescription(resultSet.getString("description"));
                project.setStartDate(resultSet.getDate("start_date"));
                project.setEndDate(resultSet.getDate("end_date"));
                project.setDocument(resultSet.getString("document"));
                project.setRoleProject(resultSet.getString("role_project"));
                project.setStatus(resultSet.getString("status"));
                project.setCreatedByOrg(od.getOById(resultSet.getInt("created_by_org")));
                project.setCreatedAt(resultSet.getDate("created_at"));
                project.setStaffId(resultSet.getInt("staff_id"));

                projectList.add(project);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projectList;
    }

    public Project getProjectById(int id) {
        String sql = "select * from Projects where project_id = ?";
        // Establish a connection
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            // Execute the query
            ResultSet rs = st.executeQuery();

            // Process the result set and retrieve user data
            if (rs.next()) {
                Project p = new Project();
                p.setProjectId(rs.getInt("project_id"));
                p.setTitle(rs.getString("title"));
                p.setImage(rs.getString("image"));
                p.setDescription(rs.getString("description"));
                p.setStartDate(rs.getDate("start_date"));
                p.setStaffId(rs.getInt("staff_id"));
                p.setEndDate(rs.getDate("end_date"));
                p.setDocument(rs.getString("document"));
                p.setRoleProject(rs.getString("role_project"));
                p.setStatus(rs.getString("status"));
                p.setCreatedByOrg(od.getOById(rs.getInt("created_by_org")));
                p.setCreatedAt(rs.getDate("created_at"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    

    // Method to search projects by title
    public List<Project> searchProjects(String title) {
        List<Project> projectList = new ArrayList<>();
        String sql = "SELECT * FROM Projects WHERE title LIKE ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            // Use "%" wildcard for case-insensitive search
            preparedStatement.setString(1, '%' + title + '%');
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Project project = new Project();
                project.setProjectId(resultSet.getInt("project_id"));
                project.setTitle(resultSet.getString("title"));
                project.setImage(resultSet.getString("image"));
                project.setDescription(resultSet.getString("description"));
                project.setStartDate(resultSet.getDate("start_date"));
                project.setEndDate(resultSet.getDate("end_date"));
                project.setDocument(resultSet.getString("document"));
                project.setRoleProject(resultSet.getString("role_project"));
                project.setStatus(resultSet.getString("status"));
                project.setCreatedByOrg(od.getOById(resultSet.getInt("created_by_org")));
                project.setCreatedAt(resultSet.getDate("created_at"));
                project.setStaffId(resultSet.getInt("staff_id"));

                projectList.add(project);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projectList;
    }
    
    public void update(Project project) {
        String sql = "UPDATE Projects SET title = ?, image = ?, description = ?, start_date = ?, staff_id = ?, end_date = ?, document = ?, role_project = ?, status = ?, created_by_org = ?, created_at = ? WHERE project_id = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, project.getTitle());
            pstmt.setString(2, project.getImage());
            pstmt.setString(3, project.getDescription());
            pstmt.setDate(4, new java.sql.Date(project.getStartDate().getTime()));
            pstmt.setInt(5, project.getStaffId());
            pstmt.setDate(6, new java.sql.Date(project.getEndDate().getTime()));
            pstmt.setString(7, project.getDocument()); // Giả sử User có phương thức getUserId()
            pstmt.setString(8, project.getRoleProject());
            pstmt.setString(9, project.getStatus());
            pstmt.setInt(10, project.getCreatedByOrg().getOrganizationId());
            pstmt.setDate(11, new java.sql.Date(project.getCreatedAt().getTime()));
            pstmt.setInt(12, project.getProjectId());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Hoặc log lỗi
        }
    }


    public static void main(String[] args) {
        ProjectDAO pd = new ProjectDAO();
         List<Project> pwait = new ArrayList<>();
        List<Project> allpr = pd.getAllProjects();
        for (Project project : allpr) {
            if (project.getStatus().equals("pending")) {
                pwait.add(project);
            }
        }
        for (Project project : pwait) {
            System.out.println(project.getTitle());
        }
        Project p = pd.getProjectById(23);
        if (p == null ) {
            System.out.println("he");
        }
        p.setStatus("pending");
        pd.update(p);
        
    }
}
