/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CampaignsDAO;

import DBContext.DBContext;
import Model.Campaign;
import Model.CampaignComment;
import Model.CampaignMembers;
import Model.ProjectCampaign;
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
public class CampaignDAOforAdmin {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    // For Project

    public List<ProjectCampaign> getAllProjects() {
        List<ProjectCampaign> list = new ArrayList<>();
        String query = "SELECT*FROM Projects";

        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int projectId = rs.getInt("project_id");
                String projectName = rs.getString("title");
                list.add(new ProjectCampaign(projectId, projectName));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalCampaignbyPID(String ID) {
        String query = "SELECT COUNT(*) FROM Campaigns \n"
                + "where project_id = ?";

        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Campaign> getCampaignbyPID(String ID, int index) {
        List<Campaign> list = new ArrayList<>();
        String query = "SELECT c.*, p.title, l.address \n"
                + "FROM Campaigns c\n"
                + "LEFT JOIN Projects p ON c.project_id = p.project_id\n"
                + "LEFT JOIN Locations l ON c.location_id = l.location_id\n"
                + "WHERE c.project_id = ?\n"
                + "ORDER BY c.project_id\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ID);
            ps.setInt(2, (index - 1) * 5);
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

    //For Campaign
    public int getTotalCampaigns() {
        String query = "select count(*) from Campaigns";

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
        String query = "SELECT c.*, p.title, l.address \n"
                + "FROM Campaigns c\n"
                + "LEFT JOIN Projects p ON c.project_id = p.project_id\n"
                + "LEFT JOIN Locations l ON c.location_id = l.location_id\n"
                + "ORDER BY c.project_id\n"
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
        String query = "SELECT c.*, p.title, l.address \n"
                + "FROM Campaigns c\n"
                + "LEFT JOIN Projects p ON c.project_id = p.project_id\n"
                + "LEFT JOIN Locations l ON c.location_id = l.location_id\n"
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

    public int getTotalCampaign(String name) {
        String query = "select count(*) from Campaigns "
                + "WHERE (campaign_name LIKE ? OR description LIKE ?)";

        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            ps.setString(2, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        } finally {
        }
        return 0;
    }

    public List<Campaign> searchCampaign(String name, int index) {
        List<Campaign> list = new ArrayList<>();
        String query = "SELECT c.*, p.title, l.address \n"
                + "FROM Campaigns c\n"
                + "LEFT JOIN Projects p ON c.project_id = p.project_id\n"
                + "LEFT JOIN Locations l ON c.location_id = l.location_id\n"
                + "WHERE (c.campaign_name LIKE ? OR c.description LIKE ?)\n"
                + "ORDER BY c.project_id\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            ps.setString(2, "%" + name + "%");
            ps.setInt(3, (index - 1) * 5);
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
        } finally {

        }

        return list;
    }

    public void deleteCampaign(String ID) {
        String query1 = "DELETE FROM CampaignReviews WHERE campaign_id = ?";
        String query2 = "DELETE FROM CampaignParticipants WHERE campaign_id = ?";
        String query = "DELETE FROM Campaigns WHERE campaign_id = ?";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query1);
            ps.setString(1, ID);
            ps.executeUpdate();

            ps = conn.prepareStatement(query2);
            ps.setString(1, ID);
            ps.executeUpdate();

            ps = conn.prepareStatement(query);
            ps.setString(1, ID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // For Campaign Member
    public int getTotalCampaignMembers(String MID) {
        String query = "SELECT COUNT(*) FROM CampaignParticipants WHERE campaign_id = ?";

        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, MID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

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
    
    // For Campaign Comment
    
   public List<CampaignComment> getCommentbyCampaignID(String Id) {
        List<CampaignComment> list = new ArrayList<>();
        String query = "SELECT nc.review_id, nc.comment, u.username, nc.created_at "
                + "FROM CampaignReviews nc "
                + "JOIN Users u ON nc.user_id = u.user_id "
                + "WHERE nc.campaign_id = ? ";

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

        CampaignDAOforAdmin dao = new CampaignDAOforAdmin();
        String ID = "5";
        List<CampaignComment> results = dao.getCommentbyCampaignID(ID);
        for (CampaignComment o : results) {
            System.out.println(o);
        }
    }
}
