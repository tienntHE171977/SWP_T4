package DAO_C;

import DBContext.DBContext;
import Model_C.ProjectReview;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjectReviewDAO extends DBContext{
    PreparedStatement ps = null;
    ResultSet rs = null;
    private static final String INSERT_PROJECT_REVIEW_SQL = "INSERT INTO ProjectReviews (user_id, project_id, rating, comment, created_at) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_PROJECT_REVIEW_BY_ID = "SELECT * FROM ProjectReviews WHERE review_id = ?";
    private static final String SELECT_REVIEWS_BY_PROJECT_ID = "SELECT * FROM ProjectReviews WHERE project_id = ?";
    private static final String UPDATE_PROJECT_REVIEW_SQL = "UPDATE ProjectReviews SET user_id = ?, project_id = ?, rating = ?, comment = ? WHERE review_id = ?";
    private static final String DELETE_PROJECT_REVIEW_SQL = "DELETE FROM ProjectReviews WHERE review_id = ?";

    // Create
    public void createProjectReview(ProjectReview review) throws SQLException {
        try (
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PROJECT_REVIEW_SQL, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setInt(1, review.getUserId());
            preparedStatement.setInt(2, review.getProjectId());
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
    public ProjectReview getProjectReviewById(int reviewId) {
        ProjectReview review = null;
        try (
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PROJECT_REVIEW_BY_ID)) {
            preparedStatement.setInt(1, reviewId);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    review = extractProjectReviewFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return review;
    }

    public List<ProjectReview> getReviewsByProjectId(int projectId) {
        List<ProjectReview> reviews = new ArrayList<>();
        try (
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REVIEWS_BY_PROJECT_ID)) {
            preparedStatement.setInt(1, projectId);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    reviews.add(extractProjectReviewFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return reviews;
    }

    // Update
    public boolean updateProjectReview(ProjectReview review) throws SQLException {
        boolean rowUpdated;
        try (
             PreparedStatement statement = connection.prepareStatement(UPDATE_PROJECT_REVIEW_SQL)) {
            statement.setInt(1, review.getUserId());
            statement.setInt(2, review.getProjectId());
            statement.setInt(3, review.getRating());
            statement.setString(4, review.getComment());
            statement.setInt(5, review.getReviewId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // Delete
    public boolean deleteProjectReview(int reviewId) throws SQLException {
        boolean rowDeleted;
        try (
             PreparedStatement statement = connection.prepareStatement(DELETE_PROJECT_REVIEW_SQL)) {
            statement.setInt(1, reviewId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    private ProjectReview extractProjectReviewFromResultSet(ResultSet rs) throws SQLException {
        ProjectReview review = new ProjectReview();
        review.setReviewId(rs.getInt("review_id"));
        review.setUserId(rs.getInt("user_id"));
        review.setProjectId(rs.getInt("project_id"));
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