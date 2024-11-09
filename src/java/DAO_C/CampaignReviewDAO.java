package DAO_C;

import DBContext.DBContext;
import Model_C.CampaignReview;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CampaignReviewDAO extends DBContext{
    PreparedStatement ps = null;
    ResultSet rs = null;
    private static final String INSERT_CAMPAIGN_REVIEW_SQL = "INSERT INTO CampaignReviews (user_id, campaign_id, rating, comment, created_at) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_CAMPAIGN_REVIEW_BY_ID = "SELECT * FROM CampaignReviews WHERE review_id = ?";
    private static final String SELECT_REVIEWS_BY_CAMPAIGN_ID = "SELECT * FROM CampaignReviews WHERE campaign_id = ?";
    private static final String SELECT_REVIEWS_BY_PROJECT_ID = "SELECT cr.* FROM CampaignReviews cr JOIN Campaigns c ON cr.campaign_id = c.campaign_id WHERE c.project_id = ?";
    private static final String UPDATE_CAMPAIGN_REVIEW_SQL = "UPDATE CampaignReviews SET user_id = ?, campaign_id = ?, rating = ?, comment = ? WHERE review_id = ?";
    private static final String DELETE_CAMPAIGN_REVIEW_SQL = "DELETE FROM CampaignReviews WHERE review_id = ?";

    // Create
    public void createCampaignReview(CampaignReview review) throws SQLException {
        try (
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CAMPAIGN_REVIEW_SQL, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setInt(1, review.getUserId());
            preparedStatement.setInt(2, review.getCampaignId());
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
    public CampaignReview getCampaignReviewById(int reviewId) {
        CampaignReview review = null;
        try (
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CAMPAIGN_REVIEW_BY_ID)) {
            preparedStatement.setInt(1, reviewId);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    review = extractCampaignReviewFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return review;
    }

    public List<CampaignReview> getReviewsByCampaignId(int campaignId) {
        List<CampaignReview> reviews = new ArrayList<>();
        try (
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REVIEWS_BY_CAMPAIGN_ID)) {
            preparedStatement.setInt(1, campaignId);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    reviews.add(extractCampaignReviewFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return reviews;
    }

    public List<CampaignReview> getReviewsByProjectId(int projectId) {
        List<CampaignReview> reviews = new ArrayList<>();
        try (
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REVIEWS_BY_PROJECT_ID)) {
            preparedStatement.setInt(1, projectId);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    reviews.add(extractCampaignReviewFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return reviews;
    }

    // Update
    public boolean updateCampaignReview(CampaignReview review) throws SQLException {
        boolean rowUpdated;
        try (
             PreparedStatement statement = connection.prepareStatement(UPDATE_CAMPAIGN_REVIEW_SQL)) {
            statement.setInt(1, review.getUserId());
            statement.setInt(2, review.getCampaignId());
            statement.setInt(3, review.getRating());
            statement.setString(4, review.getComment());
            statement.setInt(5, review.getReviewId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // Delete
    public boolean deleteCampaignReview(int reviewId) throws SQLException {
        boolean rowDeleted;
        try (
             PreparedStatement statement = connection.prepareStatement(DELETE_CAMPAIGN_REVIEW_SQL)) {
            statement.setInt(1, reviewId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    private CampaignReview extractCampaignReviewFromResultSet(ResultSet rs) throws SQLException {
        CampaignReview review = new CampaignReview();
        review.setReviewId(rs.getInt("review_id"));
        review.setUserId(rs.getInt("user_id"));
        review.setCampaignId(rs.getInt("campaign_id"));
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