package DAO_C;

import DBContext.DBContext;
import Model_C.Project;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjectDAO extends DBContext{
    PreparedStatement ps = null;
    ResultSet rs = null;
    private static final String INSERT_PROJECT_SQL = "INSERT INTO Projects (title, image, description, start_date, end_date, document, role_project, status, staff_id, created_by_org) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_PROJECT_BY_ID = "SELECT * FROM Projects WHERE project_id = ?";
    private static final String SELECT_ALL_PROJECTS = "SELECT * FROM Projects;";
    private static final String DELETE_PROJECT_SQL = "DELETE FROM Projects WHERE project_id = ?;";
    private static final String UPDATE_PROJECT_SQL = "UPDATE Projects SET title = ?, image = ?, description = ?, start_date = ?, end_date = ?, document = ?, role_project = ?, status = ?, staff_id = ?, created_by_org = ? WHERE project_id = ?;";
     private static final String SELECT_PROJECTS_BY_ORG_ID = "SELECT * FROM Projects WHERE created_by_org = ?";
    private static final String SELECT_PROJECTS_BY_ORG_ID_WITH_STATUS = 
        "SELECT * FROM Projects WHERE created_by_org = ? AND status = ?";
    private static final String SELECT_PROJECTS_BY_ORG_ID_PAGINATED = 
        "SELECT * FROM Projects WHERE created_by_org = ? LIMIT ? OFFSET ?";
    private static final String SELECT_PROJECTS_BY_ORG_ID_WITH_STATUS_PAGINATED = 
        "SELECT * FROM Projects WHERE created_by_org = ? AND status = ? LIMIT ? OFFSET ?";
    private static final String COUNT_PROJECTS_BY_ORG_ID = 
        "SELECT COUNT(*) FROM Projects WHERE created_by_org = ?";
    private static final String COUNT_PROJECTS_BY_ORG_ID_WITH_STATUS = 
        "SELECT COUNT(*) FROM Projects WHERE created_by_org = ? AND status = ?";
    
    // Insert a new project
    public void insertProject(Project project) throws SQLException {
        try (
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PROJECT_SQL, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, project.getTitle());
            preparedStatement.setString(2, project.getImage());
            preparedStatement.setString(3, project.getDescription());
            preparedStatement.setDate(4, new java.sql.Date(project.getStartDate().getTime()));
            preparedStatement.setDate(5, new java.sql.Date(project.getEndDate().getTime()));
            preparedStatement.setString(6, project.getDocument());
            preparedStatement.setString(7, project.getRoleProject());
            preparedStatement.setString(8, project.getStatus());
            preparedStatement.setInt(9, project.getStaffId());
            preparedStatement.setInt(10, project.getCreatedByOrg());
            
            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        project.setProjectId(generatedKeys.getInt(1));
                    }
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // Select project by ID
    public Project selectProject(int id) {
        Project project = null;
        try (
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PROJECT_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                project = extractProjectFromResultSet(rs);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return project;
    }

    // Select all projects
    public List<Project> selectAllProjects() {
        List<Project> projects = new ArrayList<>();
        try (
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PROJECTS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                projects.add(extractProjectFromResultSet(rs));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return projects;
    }

    // Update project
    public boolean updateProject(Project project) throws SQLException {
        boolean rowUpdated;
        try (
             PreparedStatement statement = connection.prepareStatement(UPDATE_PROJECT_SQL)) {
            statement.setString(1, project.getTitle());
            statement.setString(2, project.getImage());
            statement.setString(3, project.getDescription());
            statement.setDate(4, new java.sql.Date(project.getStartDate().getTime()));
            statement.setDate(5, new java.sql.Date(project.getEndDate().getTime()));
            statement.setString(6, project.getDocument());
            statement.setString(7, project.getRoleProject());
            statement.setString(8, project.getStatus());
            statement.setInt(9, project.getStaffId());
            statement.setInt(10, project.getCreatedByOrg());
            statement.setInt(11, project.getProjectId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // Delete project
    public boolean deleteProject(int id) throws SQLException {
        boolean rowDeleted;
        try (
             PreparedStatement statement = connection.prepareStatement(DELETE_PROJECT_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    private Project extractProjectFromResultSet(ResultSet rs) throws SQLException {
        return new Project(
            rs.getInt("project_id"),
            rs.getString("title"),
            rs.getString("image"),
            rs.getString("description"),
            rs.getDate("start_date"),
            rs.getDate("end_date"),
            rs.getString("document"),
            rs.getString("role_project"),
            rs.getString("status"),
            rs.getInt("staff_id"),
            rs.getInt("created_by_org"),
            rs.getTimestamp("created_at")
        );
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
    
    public class ProjectPage {
        private List<Project> projects;
        private int totalRecords;
        private int totalPages;
        private int currentPage;

        public ProjectPage(List<Project> projects, int totalRecords, int pageSize, int currentPage) {
            this.projects = projects;
            this.totalRecords = totalRecords;
            this.totalPages = (int) Math.ceil((double) totalRecords / pageSize);
            this.currentPage = currentPage;
        }

        // Getters
        public List<Project> getProjects() { return projects; }
        public int getTotalRecords() { return totalRecords; }
        public int getTotalPages() { return totalPages; }
        public int getCurrentPage() { return currentPage; }
    }

    // Get total number of projects for an organization
    private int getTotalProjects(Connection connection, int organizationId, String status) throws SQLException {
        String sql = (status == null) ? COUNT_PROJECTS_BY_ORG_ID : COUNT_PROJECTS_BY_ORG_ID_WITH_STATUS;
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, organizationId);
            if (status != null) {
                stmt.setString(2, status);
            }
            
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    // Get projects by organization ID with pagination and optional status filter
    public ProjectPage getProjectByOrgId(int organizationId, String status, int page, int pageSize) {
        List<Project> projects = new ArrayList<>();
        int totalRecords = 0;
        
        try  {
            // Get total records for pagination
            totalRecords = getTotalProjects(connection, organizationId, status);
            
            // Select appropriate SQL based on whether status filter is provided
            String sql = (status == null) ? 
                SELECT_PROJECTS_BY_ORG_ID_PAGINATED : 
                SELECT_PROJECTS_BY_ORG_ID_WITH_STATUS_PAGINATED;
            
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                // Calculate offset
                int offset = (page - 1) * pageSize;
                
                // Set parameters
                preparedStatement.setInt(1, organizationId);
                if (status != null) {
                    preparedStatement.setString(2, status);
                    preparedStatement.setInt(3, pageSize);
                    preparedStatement.setInt(4, offset);
                } else {
                    preparedStatement.setInt(2, pageSize);
                    preparedStatement.setInt(3, offset);
                }
                
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    projects.add(extractProjectFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        
        return new ProjectPage(projects, totalRecords, pageSize, page);
    }

    // Get projects by organization ID without pagination
    public List<Project> getProjectByOrgId(int organizationId) {
        List<Project> projects = new ArrayList<>();
        try (
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PROJECTS_BY_ORG_ID)) {
            
            preparedStatement.setInt(1, organizationId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                projects.add(extractProjectFromResultSet(rs));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return projects;
    }
    public static void main(String[] args) {
        ProjectDAO dao = new ProjectDAO();
        int id = 34;
        Project p = dao.selectProject(id);
        System.out.println("cái này đây"+ p.getDescription());
        System.out.println("cái này đây"+ p.getDocument());
        System.out.println("cái này đây"+ p.getRoleProject());
        System.out.println("cái này đây"+ p.getStatus());
        System.out.println("cái này đây"+ p.getTitle());
        System.out.println("cái này đây"+ p.getCreatedAt());
        System.out.println("cái này đây"+ p.getStartDate());
        System.out.println("cái này đây"+ p.getEndDate());
    }
}