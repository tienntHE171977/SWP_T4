package DAO_C;

import DBContext.DBContext;
import Model_C.Organization;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrganizationDAO extends DBContext{
    PreparedStatement ps = null;
    ResultSet rs = null;
    private static final String INSERT_ORGANIZATION_SQL = "INSERT INTO Organizations (name, website, description, image, phone, email, created_by, staff_id, approval_date, Establishment_time, organization_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_ORGANIZATION_BY_ID = "SELECT * FROM Organizations WHERE organization_id = ?;";
    private static final String SELECT_ALL_ORGANIZATIONS = "SELECT * FROM Organizations;";
    private static final String DELETE_ORGANIZATION_SQL = "DELETE FROM Organizations WHERE organization_id = ?;";
    private static final String UPDATE_ORGANIZATION_SQL = "UPDATE Organizations SET name = ?, website = ?, description = ?, image = ?, phone = ?, email = ?, created_by = ?, staff_id = ?, approval_date = ?, Establishment_time = ?, organization_status = ? WHERE organization_id = ?;";
    private static final String SELECT_PENDING_ORGANIZATIONS = "SELECT * FROM Organizations WHERE organization_status = 'pending';";
    private static final String SELECT_ACTIVE_INACTIVE_ORGANIZATIONS = "SELECT * FROM Organizations WHERE organization_status IN ('active', 'inactive');";

    
    // Insert a new organization
    public void insertOrganization(Organization organization) throws SQLException {
        try ( PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORGANIZATION_SQL, Statement.RETURN_GENERATED_KEYS)) {
            setOrganizationParameters(preparedStatement, organization);

            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        organization.setOrganizationId(generatedKeys.getInt(1));
                    }
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // Select organization by ID
    public Organization selectOrganization(int id) {
        Organization organization = null;
        try ( PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORGANIZATION_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                organization = extractOrganizationFromResultSet(rs);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return organization;
    }

    // Select all organizations
    public List<Organization> selectAllOrganizations() {
        List<Organization> organizations = new ArrayList<>();
        try ( PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ORGANIZATIONS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                organizations.add(extractOrganizationFromResultSet(rs));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return organizations;
    }

    // Update organization
    public boolean updateOrganization(Organization organization) throws SQLException {
        boolean rowUpdated;
        try ( PreparedStatement statement = connection.prepareStatement(UPDATE_ORGANIZATION_SQL)) {
            setOrganizationParameters(statement, organization);
            statement.setInt(12, organization.getOrganizationId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // Delete organization
    public boolean deleteOrganization(int id) throws SQLException {
        boolean rowDeleted;
        try ( PreparedStatement statement = connection.prepareStatement(DELETE_ORGANIZATION_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    private Organization extractOrganizationFromResultSet(ResultSet rs) throws SQLException {
        return new Organization(
                rs.getInt("organization_id"),
                rs.getString("name"),
                rs.getString("website"),
                rs.getString("description"),
                rs.getString("image"),
                rs.getString("phone"),
                rs.getString("email"),
                rs.getInt("created_by"),
                rs.getInt("staff_id"),
                rs.getTimestamp("approval_date").toLocalDateTime(),
                rs.getDate("Establishment_time").toLocalDate(),
                rs.getString("organization_status")
        );
    }

    private void setOrganizationParameters(PreparedStatement statement, Organization organization) throws SQLException {
        statement.setString(1, organization.getName());
        statement.setString(2, organization.getWebsite());
        statement.setString(3, organization.getDescription());
        statement.setString(4, organization.getImage());
        statement.setString(5, organization.getPhone());
        statement.setString(6, organization.getEmail());
        statement.setInt(7, organization.getCreatedBy());
        statement.setInt(8, organization.getStaffId());
        statement.setTimestamp(9, Timestamp.valueOf(organization.getApprovalDate()));
        statement.setDate(10, Date.valueOf(organization.getEstablishmentTime()));
        statement.setString(11, organization.getOrganizationStatus());
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

    // Select organization by created_by
    public Organization getOrganizationByCreatedBy(int createdBy) {
        Organization organization = null;
        String SELECT_ORGANIZATION_BY_CREATED_BY = "SELECT * FROM Organizations WHERE created_by = ?;";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORGANIZATION_BY_CREATED_BY)) {
            preparedStatement.setInt(1, createdBy);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                organization = extractOrganizationFromResultSet(rs);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return organization;
    }
    
    public List<Organization> selectPendingOrganizations() {
        List<Organization> organizations = new ArrayList<>();
        try ( 
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PENDING_ORGANIZATIONS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                organizations.add(extractOrganizationFromResultSet(rs));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return organizations;
    }
    
    public List<Organization> selectActiveInactiveOrganizations() {
        List<Organization> organizations = new ArrayList<>();
        try ( 
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACTIVE_INACTIVE_ORGANIZATIONS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                organizations.add(extractOrganizationFromResultSet(rs));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return organizations;
    }

    
    
    

}
