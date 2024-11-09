package DAO_C;

import DBContext.DBContext;
import Model_C.ProjectEvent;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjectEventDAO extends DBContext{
    PreparedStatement ps = null;
    ResultSet rs = null;
    private static final String INSERT_PROJECT_EVENT_SQL = "INSERT INTO ProjectEvent (project_id, item_name, quantity_needed, quantity_provided, unit) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_PROJECT_EVENT_BY_ID = "SELECT * FROM ProjectEvent WHERE event_id = ?";
    private static final String SELECT_EVENTS_BY_PROJECT_ID = "SELECT * FROM ProjectEvent WHERE project_id = ?";
    private static final String SELECT_ALL_EVENTS = "SELECT * FROM ProjectEvent ORDER BY event_id DESC";
    private static final String UPDATE_PROJECT_EVENT_SQL = "UPDATE ProjectEvent SET project_id = ?, item_name = ?, quantity_needed = ?, quantity_provided = ?, unit = ? WHERE event_id = ?";
    private static final String DELETE_PROJECT_EVENT_SQL = "DELETE FROM ProjectEvent WHERE event_id = ?";
    private static final String SELECT_ALL_EVENTS_PAGED = "SELECT * FROM ProjectEvent ORDER BY event_id DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
    private static final String COUNT_ALL_EVENTS = "SELECT COUNT(*) FROM ProjectEvent";
    private static final String SELECT_PROJECT_EVENT_BY_ITEM_NAME = "SELECT * FROM ProjectEvent WHERE item_name = ? AND project_id = ?";

    // Create
    public void createProjectEvent(ProjectEvent event) throws SQLException {
        try ( PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PROJECT_EVENT_SQL, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setInt(1, event.getProjectId());
            preparedStatement.setString(2, event.getItemName());
            preparedStatement.setInt(3, event.getQuantityNeeded());
            preparedStatement.setInt(4, event.getQuantityProvided());
            preparedStatement.setString(5, event.getUnit());

            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        event.setEventId(generatedKeys.getInt(1));
                    }
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // Read all events
    public List<ProjectEvent> selectAllEvents() {
        List<ProjectEvent> events = new ArrayList<>();
        try ( PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EVENTS); ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                events.add(extractProjectEventFromResultSet(rs));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return events;
    }

    // Read single event
    public ProjectEvent getProjectEventById(int eventId) {
        ProjectEvent event = null;
        try ( PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PROJECT_EVENT_BY_ID)) {
            preparedStatement.setInt(1, eventId);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    event = extractProjectEventFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return event;
    }

    // Read events by project
    public List<ProjectEvent> getEventsByProjectId(int projectId) {
        List<ProjectEvent> events = new ArrayList<>();
        try ( PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EVENTS_BY_PROJECT_ID)) {
            preparedStatement.setInt(1, projectId);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    events.add(extractProjectEventFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return events;
    }

    // Update
    public boolean updateProjectEvent(ProjectEvent event) throws SQLException {
        boolean rowUpdated;
        try ( PreparedStatement statement = connection.prepareStatement(UPDATE_PROJECT_EVENT_SQL)) {
            statement.setInt(1, event.getProjectId());
            statement.setString(2, event.getItemName());
            statement.setInt(3, event.getQuantityNeeded());
            statement.setInt(4, event.getQuantityProvided());
            statement.setString(5, event.getUnit());
            statement.setInt(6, event.getEventId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // Delete
    public boolean deleteProjectEvent(int eventId) throws SQLException {
        boolean rowDeleted;
        try ( PreparedStatement statement = connection.prepareStatement(DELETE_PROJECT_EVENT_SQL)) {
            statement.setInt(1, eventId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    private ProjectEvent extractProjectEventFromResultSet(ResultSet rs) throws SQLException {
        ProjectEvent event = new ProjectEvent();
        event.setEventId(rs.getInt("event_id"));
        event.setProjectId(rs.getInt("project_id"));
        event.setItemName(rs.getString("item_name"));
        event.setQuantityNeeded(rs.getInt("quantity_needed"));
        event.setQuantityProvided(rs.getInt("quantity_provided"));
        event.setUnit(rs.getString("unit"));
        return event;
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

    public List<ProjectEvent> selectAllEventsPaged(int pageNumber, int pageSize) {
        List<ProjectEvent> events = new ArrayList<>();
        try ( PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EVENTS_PAGED)) {
            preparedStatement.setInt(1, (pageNumber - 1) * pageSize); // OFFSET
            preparedStatement.setInt(2, pageSize); // FETCH NEXT
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    events.add(extractProjectEventFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return events;
    }

// Phương thức để lấy tổng số sự kiện
    public int getTotalEvents() {
        int total = 0;
        try ( PreparedStatement preparedStatement = connection.prepareStatement(COUNT_ALL_EVENTS); ResultSet rs = preparedStatement.executeQuery()) {
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return total;
    }

    public ProjectEvent getProjectEventByItemName(String itemName, int projectId) {
        ProjectEvent event = null;
        try ( PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PROJECT_EVENT_BY_ITEM_NAME)) {
            preparedStatement.setString(1, itemName);
            preparedStatement.setInt(2, projectId);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    event = extractProjectEventFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return event;
    }
}
