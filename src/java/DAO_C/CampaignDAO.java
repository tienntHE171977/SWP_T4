package DAO_C;


import DBContext.DBContext;
import Model_C.Campaign;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CampaignDAO extends DBContext{
    PreparedStatement ps = null;
    ResultSet rs = null;
    private static final String INSERT_CAMPAIGN_SQL = "INSERT INTO Campaigns (project_id, location_id, description, job, is_active, created_at) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_CAMPAIGN_BY_ID = "SELECT * FROM Campaigns WHERE campaign_id = ?";
    private static final String SELECT_CAMPAIGNS_BY_PROJECT_ID = "SELECT * FROM Campaigns WHERE project_id = ?";
    private static final String UPDATE_CAMPAIGN_SQL = "UPDATE Campaigns SET project_id = ?, location_id = ?, description = ?, job = ?, is_active = ? WHERE campaign_id = ?";
    private static final String DELETE_CAMPAIGN_SQL = "DELETE FROM Campaigns WHERE campaign_id = ?";
    private static final String GET_MAX_CAMPAIGN_ID = "SELECT MAX(campaign_id) FROM Campaigns";

    // Get next campaign ID
    public int getNextCampaignId() throws SQLException {
        int maxId = 0;
        try ( Statement statement = connection.createStatement(); ResultSet rs = statement.executeQuery(GET_MAX_CAMPAIGN_ID)) {
            if (rs.next()) {
                maxId = rs.getInt(1);
            }
        }
        return maxId + 1;
    }

    // Create
    public void createCampaign(Campaign campaign) throws SQLException {
        try ( PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CAMPAIGN_SQL)) {

            preparedStatement.setInt(1, campaign.getProjectId());
            preparedStatement.setInt(2, campaign.getLocationId());
            preparedStatement.setString(3, campaign.getDescription());
            preparedStatement.setString(4, campaign.getJob());
            preparedStatement.setBoolean(5, campaign.isActive());
            preparedStatement.setTimestamp(6, new Timestamp(campaign.getCreatedAt().getTime()));

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
            throw e;
        }
    }

    // Read
    public Campaign getCampaignById(int campaignId) {
        Campaign campaign = null;
        try ( PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CAMPAIGN_BY_ID)) {
            preparedStatement.setInt(1, campaignId);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    campaign = extractCampaignFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return campaign;
    }

    public List<Campaign> getCampaignsByProjectId(int projectId) {
        List<Campaign> campaigns = new ArrayList<>();
        try ( PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CAMPAIGNS_BY_PROJECT_ID)) {
            preparedStatement.setInt(1, projectId);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    campaigns.add(extractCampaignFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return campaigns;
    }

    // Update - không thay đổi
    public boolean updateCampaign(Campaign campaign) throws SQLException {
        boolean rowUpdated;
        try ( PreparedStatement statement = connection.prepareStatement(UPDATE_CAMPAIGN_SQL)) {
            statement.setInt(1, campaign.getProjectId());
            statement.setInt(2, campaign.getLocationId());
            statement.setString(3, campaign.getDescription());
            statement.setString(4, campaign.getJob());
            statement.setBoolean(5, campaign.isActive());
            statement.setInt(6, campaign.getCampaignId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // Delete - không thay đổi
    public boolean deleteCampaign(int campaignId) throws SQLException {
        boolean rowDeleted;
        try ( PreparedStatement statement = connection.prepareStatement(DELETE_CAMPAIGN_SQL)) {
            statement.setInt(1, campaignId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    private Campaign extractCampaignFromResultSet(ResultSet rs) throws SQLException {
        Campaign campaign = new Campaign();
        campaign.setCampaignId(rs.getInt("campaign_id"));
        campaign.setProjectId(rs.getInt("project_id"));
        campaign.setLocationId(rs.getInt("location_id"));
        campaign.setDescription(rs.getString("description"));
        campaign.setJob(rs.getString("job"));
        campaign.setActive(rs.getBoolean("is_active"));
        campaign.setCreatedAt(rs.getTimestamp("created_at"));
        return campaign;
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
