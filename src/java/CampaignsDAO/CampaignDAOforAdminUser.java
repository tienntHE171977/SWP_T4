/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CampaignsDAO;

import DBContext.DBContext;
import Model.Campaign;
import Model.CampaignComment;
import Model.CampaignMembers;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author admin
 */
public class CampaignDAOforAdminUser {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public int getTotalCampaigns() {
        String query = "select count(*) from Campaigns\n"
                + " where status = 'on'";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Campaign> getAllCampaigns(int index) {
        List<Campaign> list = new ArrayList<>();
        String query = "SELECT c.*, p.title "
                + "FROM Campaigns c "
                + "LEFT JOIN Projects p ON c.project_id = p.project_id "
                + "ORDER BY c.campaign_id ASC "
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";

        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                int campaignID = rs.getInt("campaign_id");
                String campaignName = rs.getString("campaign_name");
                String projectName = rs.getString("title"); // Lấy tên dự án
                String campaignLocation = rs.getString("address"); // Lấy tên địa điểm
                String description = rs.getString("description");
                String campaignJob = rs.getString("job");
                String status = rs.getString("status");
                Date createDate = rs.getDate("created_at");
                list.add(new Campaign(campaignID, campaignName, projectName, createDate, campaignLocation, description, campaignJob, status));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Campaign getCampaignByID(String campaignId) {
        String query = "SELECT c.*, p.title \n"
                + "FROM Campaigns c\n"
                + "LEFT JOIN Projects p ON c.project_id = p.project_id\n"
                + "WHERE c.campaign_id = ?";

        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, campaignId);
            rs = ps.executeQuery();
            if (rs.next()) {
                int campaignID = rs.getInt("campaign_id");
                String campaignName = rs.getString("campaign_name");
                String projectName = rs.getString("title"); // Lấy tên dự án
                String campaignLocation = rs.getString("address"); // Lấy tên địa điểm
                String description = rs.getString("description");
                String campaignJob = rs.getString("job");
                String status = rs.getString("status");
                Date createDate = rs.getDate("created_at");
                return new Campaign(campaignID, campaignName, projectName, createDate, campaignLocation, description, campaignJob, status);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void addNewCampaign(String campaignName, String projectId, String location, String description, String job) {
        String query = "INSERT INTO Campaigns (campaign_name, project_id, address,description, job, status, created_at) VALUES (?, ?, ?, ?, ?, 'on', GETDATE())";

        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, campaignName);
            ps.setString(2, projectId);
            ps.setString(3, location);
            ps.setString(4, description);
            ps.setString(5, job);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateCampaign(String campaignId, String campaignName, String address, String description, String job) {
        String query = "UPDATE Campaigns SET campaign_name = ?, address = ?, description = ?, job = ? WHERE campaign_id = ?";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, campaignName);
            ps.setString(2, address);
            ps.setString(3, description);
            ps.setString(4, job);
            ps.setString(5, campaignId);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
    }

    public void updateNewsStatusCampaign(String campaignId, String status) {
        String query = "UPDATE Campaigns SET status = ? WHERE campaign_id = ?";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            ps.setString(2, campaignId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //For Campaign Members
    public List<CampaignMembers> getAllCampaignMembers(String MID) {
        List<CampaignMembers> list = new ArrayList<>();
        String query = "SELECT c.*, u.username \n"
                + "FROM CampaignParticipants c\n"
                + "LEFT JOIN Volunteers v ON c.volunteer_id = v.volunteer_id\n"
                + "LEFT JOIN Users u ON u.user_id = v.user_id\n"
                + "WHERE c.campaign_id = ?\n"
                + "ORDER BY c.participant_id";

        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, MID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int memberID = rs.getInt("participant_id");
                String memberName = rs.getString("username");
                String memberJob = rs.getString("job");
                String status = rs.getString("participation_type");
                Date joinedDate = rs.getDate("participation_date");
                list.add(new CampaignMembers(memberID, memberName, memberJob, joinedDate, status));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public CampaignMembers getCampaignMemberbyID(String MID) {
        String query = "SELECT c.*, u.username \n"
                + "FROM CampaignParticipants c\n"
                + "LEFT JOIN Volunteers v ON c.volunteer_id = v.volunteer_id\n"
                + "LEFT JOIN Users u ON u.user_id = v.user_id\n"
                + "WHERE c.participant_id = ?\n"
                + "ORDER BY c.participant_id DESC";

        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, MID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int memberID = rs.getInt("participant_id");
                String memberName = rs.getString("username");
                String memberJob = rs.getString("job");
                String status = rs.getString("participation_type");
                Date joinedDate = rs.getDate("participation_date");
                return new CampaignMembers(memberID, memberName, memberJob, joinedDate, status);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateNewsMemberCampaign(String campaignId, String job, String status) {
        String query = "UPDATE CampaignParticipants SET job =?, participation_type = ? WHERE participant_id = ?";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, job);
            ps.setString(2, status);
            ps.setString(3, campaignId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getCampaignIDByMemberID(String ID) {
        String cID = null;
        String query = "SELECT campaign_id FROM CampaignParticipants WHERE participant_id = ?";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ID);
            rs = ps.executeQuery();
            while (rs.next()) {
                cID = rs.getString("campaign_id");
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return cID;
    }

    // For Campaign Comment
    public List<CampaignComment> getCommentbyCampaignID(String Id) {
        List<CampaignComment> list = new ArrayList<>();
        String query = "SELECT nc.review_id, nc.comment, u.username, nc.created_at "
                + "FROM CampaignReviews nc "
                + "JOIN Users u ON nc.user_id = u.user_id "
                + "WHERE nc.campaign_id = ? "
                + "ORDER BY nc.review_id DESC";

        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, Id);
            rs = ps.executeQuery();

            while (rs.next()) {
                int ccommentID = rs.getInt("review_id");
                String userName = rs.getString("username");
                String comment = rs.getString("comment");
                Date date = rs.getDate("created_at");
                list.add(new CampaignComment(ccommentID, comment, userName, date));
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return list;
    }

    public static void main(String[] args) {

        CampaignDAOforAdminUser dao = new CampaignDAOforAdminUser();

        String campaignId = "4"; // Replace with a valid campaign ID
        String job = "Updated job information";
        String status = "Joined";

        // Call the update method
        dao.updateNewsMemberCampaign(campaignId, job, status);
    }
}