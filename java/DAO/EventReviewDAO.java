package DAO;

import DBConnect.DBConnection;
import Model.EventReview;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EventReviewDAO {
    private static final String INSERT_EVENT_REVIEW_SQL = "INSERT INTO EventReviews (user_id, event_id, rating, comment, created_at) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_EVENT_REVIEW_BY_ID = "SELECT * FROM EventReviews WHERE review_id = ?";
    private static final String SELECT_REVIEWS_BY_EVENT_ID = "SELECT * FROM EventReviews WHERE event_id = ?";
    private static final String SELECT_REVIEWS_BY_PROJECT_ID = "SELECT er.* FROM EventReviews er JOIN ProjectEvent pe ON er.event_id = pe.event_id WHERE pe.project_id = ?";
    private static final String UPDATE_EVENT_REVIEW_SQL = "UPDATE EventReviews SET user_id = ?, event_id = ?, rating = ?, comment = ? WHERE review_id = ?";
    private static final String DELETE_EVENT_REVIEW_SQL = "DELETE FROM EventReviews WHERE review_id = ?";

    // Create
    public void createEventReview(EventReview review) throws SQLException {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EVENT_REVIEW_SQL, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setInt(1, review.getUserId());
            preparedStatement.setInt(2, review.getEventId());
            preparedStatement.setInt(3, review.getRating());
            preparedStatement.setString(4, review.getComment());
            preparedStatement.setTimestamp(5, new Timestamp(review.getCreatedAt().getTime()));
            
            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        review.setReviewId(generatedKeys.getInt(1));
                    }
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // Read
    public EventReview getEventReviewById(int reviewId) {
        EventReview review = null;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EVENT_REVIEW_BY_ID)) {
            preparedStatement.setInt(1, reviewId);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    review = extractEventReviewFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return review;
    }

    public List<EventReview> getReviewsByEventId(int eventId) {
        List<EventReview> reviews = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REVIEWS_BY_EVENT_ID)) {
            preparedStatement.setInt(1, eventId);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    reviews.add(extractEventReviewFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return reviews;
    }

    public List<EventReview> getReviewsByProjectId(int projectId) {
        List<EventReview> reviews = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REVIEWS_BY_PROJECT_ID)) {
            preparedStatement.setInt(1, projectId);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    reviews.add(extractEventReviewFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return reviews;
    }

    // Update
    public boolean updateEventReview(EventReview review) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_EVENT_REVIEW_SQL)) {
            statement.setInt(1, review.getUserId());
            statement.setInt(2, review.getEventId());
            statement.setInt(3, review.getRating());
            statement.setString(4, review.getComment());
            statement.setInt(5, review.getReviewId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // Delete
    public boolean deleteEventReview(int reviewId) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_EVENT_REVIEW_SQL)) {
            statement.setInt(1, reviewId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    private EventReview extractEventReviewFromResultSet(ResultSet rs) throws SQLException {
        EventReview review = new EventReview();
        review.setReviewId(rs.getInt("review_id"));
        review.setUserId(rs.getInt("user_id"));
        review.setEventId(rs.getInt("event_id"));
        review.setRating(rs.getInt("rating"));
        review.setComment(rs.getString("comment"));
        review.setCreatedAt(rs.getTimestamp("created_at"));
        return review;
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
}