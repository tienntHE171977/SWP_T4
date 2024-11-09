/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CampaignsDAO;

import DBContext.DBContext;
import model.Campaign;
import model.CampaignComment;
import model.CampaignMembers;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author admin
 */
public class CampaignDAOforUsers extends DBContext{

    PreparedStatement ps = null;
    ResultSet rs = null;

// For Campaign
    public int getTotalCampaigns() {
        String query = "select count(*) from Campaigns\n"
                + " where status = 'on'";

        try {
            
            ps = connection.prepareStatement(query);
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
        String query = "SELECT c.*, p.title \n"
                + "FROM Campaigns c\n"
                + "LEFT JOIN Projects p ON c.project_id = p.project_id\n"
                + "WHERE c.status = 'on'\n"
                + "ORDER BY c.project_id\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";

        try {
            
            ps = connection.prepareStatement(query);
            ps.setInt(1, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                 int campaignID = rs.getInt("campaign_id");
                String campaignName = rs.getString("campaign_name");
                String projectName = rs.getString("title"); // Lấy tên dự án
                int projectID = rs.getInt("project_id");
                String campaignLocation = rs.getString("address"); // Lấy tên địa điểm
                String description = rs.getString("description");
                String campaignJob = rs.getString("job");
                String status = rs.getString("status");
                Date createDate = rs.getDate("created_at");
                list.add(new Campaign(campaignID, campaignName, projectName,projectID, createDate, campaignLocation, description, campaignJob, status));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Campaign> SortPostByCampaignName(int index) {
        List<Campaign> list = new ArrayList<>();
        String query = "SELECT c.*, p.title \n"
                + "FROM Campaigns c\n"
                + "LEFT JOIN Projects p ON c.project_id = p.project_id\n"
                + "WHERE c.status = 'on'\n"
                + "ORDER BY c.campaign_name\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        try {
           
            ps = connection.prepareStatement(query);
            ps.setInt(1, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                 int campaignID = rs.getInt("campaign_id");
                String campaignName = rs.getString("campaign_name");
                String projectName = rs.getString("title"); // Lấy tên dự án
                int projectID = rs.getInt("project_id");
                String campaignLocation = rs.getString("address"); // Lấy tên địa điểm
                String description = rs.getString("description");
                String campaignJob = rs.getString("job");
                String status = rs.getString("status");
                Date createDate = rs.getDate("created_at");
                list.add(new Campaign(campaignID, campaignName, projectName,projectID, createDate, campaignLocation, description, campaignJob, status));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Campaign> SortPostByCampaignDate(int index) {
        List<Campaign> list = new ArrayList<>();
        String query = "SELECT c.*, p.title \n"
                + "FROM Campaigns c\n"
                + "LEFT JOIN Projects p ON c.project_id = p.project_id\n"
                + "WHERE c.status = 'on'\n"
                + "ORDER BY c.created_at DESC\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        try {
            
            ps = connection.prepareStatement(query);
            ps.setInt(1, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                 int campaignID = rs.getInt("campaign_id");
                String campaignName = rs.getString("campaign_name");
                String projectName = rs.getString("title"); // Lấy tên dự án
                int projectID = rs.getInt("project_id");
                String campaignLocation = rs.getString("address"); // Lấy tên địa điểm
                String description = rs.getString("description");
                String campaignJob = rs.getString("job");
                String status = rs.getString("status");
                Date createDate = rs.getDate("created_at");
                list.add(new Campaign(campaignID, campaignName, projectName,projectID, createDate, campaignLocation, description, campaignJob, status));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Campaign> SortPostByProject(int index) {
        List<Campaign> list = new ArrayList<>();
        String query = "SELECT c.*, p.title \n"
                + "FROM Campaigns c\n"
                + "LEFT JOIN Projects p ON c.project_id = p.project_id\n"
                + "WHERE c.status = 'on'\n"
                + "ORDER BY p.title ASC\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        try {
            
            ps = connection.prepareStatement(query);
            ps.setInt(1, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                 int campaignID = rs.getInt("campaign_id");
                String campaignName = rs.getString("campaign_name");
                String projectName = rs.getString("title"); // Lấy tên dự án
                int projectID = rs.getInt("project_id");
                String campaignLocation = rs.getString("address"); // Lấy tên địa điểm
                String description = rs.getString("description");
                String campaignJob = rs.getString("job");
                String status = rs.getString("status");
                Date createDate = rs.getDate("created_at");
                list.add(new Campaign(campaignID, campaignName, projectName,projectID, createDate, campaignLocation, description, campaignJob, status));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public int getTotalCampaign(String name) {
        String query = "SELECT COUNT(*) FROM Campaigns "
                 + "WHERE (campaign_name LIKE ? OR description LIKE ?) "
                 + "AND status = 'on'";

        try {
            
            ps = connection.prepareStatement(query);
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
        String query = "SELECT c.*, p.title \n"
                + "FROM Campaigns c\n"
                + "LEFT JOIN Projects p ON c.project_id = p.project_id\n"
                + "WHERE (c.campaign_name LIKE ? OR c.description LIKE ?)\n"
                + "AND c.status = 'on'\n"
                + "ORDER BY c.project_id\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        try {
            
            ps = connection.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            ps.setString(2, "%" + name + "%");
            ps.setInt(3, (index - 1) * 5);
            rs = ps.executeQuery();

            while (rs.next()) {
                int campaignID = rs.getInt("campaign_id");
                String campaignName = rs.getString("campaign_name");
                String projectName = rs.getString("title"); // Lấy tên dự án
                int projectID = rs.getInt("project_id");
                String campaignLocation = rs.getString("address"); // Lấy tên địa điểm
                String description = rs.getString("description");
                String campaignJob = rs.getString("job");
                String status = rs.getString("status");
                Date createDate = rs.getDate("created_at");
                list.add(new Campaign(campaignID, campaignName, projectName,projectID, createDate, campaignLocation, description, campaignJob, status));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }

        return list;
    }

    public List<Campaign> getAllCampaignsforPid(String PID) {
        List<Campaign> list = new ArrayList<>();
        String query = "SELECT c.*, p.title "
                + "FROM Campaigns c "
                + "LEFT JOIN Projects p ON c.project_id = p.project_id "
                + "WHERE c.status = 'on' "
                + "AND p.project_id = ? "
                + "ORDER BY c.campaign_id ASC ";

        try {
            
            ps = connection.prepareStatement(query);
            ps.setString(1, PID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int campaignID = rs.getInt("campaign_id");
                String campaignName = rs.getString("campaign_name");
                String projectName = rs.getString("title"); // Lấy tên dự án
                int projectID = rs.getInt("project_id");
                String campaignLocation = rs.getString("address"); // Lấy tên địa điểm
                String description = rs.getString("description");
                String campaignJob = rs.getString("job");
                String status = rs.getString("status");
                Date createDate = rs.getDate("created_at");
                list.add(new Campaign(campaignID, campaignName, projectName,projectID, createDate, campaignLocation, description, campaignJob, status));
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
           
            ps = connection.prepareStatement(query);
            ps.setString(1, campaignId);
            rs = ps.executeQuery();
            if (rs.next()) {
                 int campaignID = rs.getInt("campaign_id");
                String campaignName = rs.getString("campaign_name");
                String projectName = rs.getString("title"); // Lấy tên dự án
                int projectID = rs.getInt("project_id");
                String campaignLocation = rs.getString("address"); // Lấy tên địa điểm
                String description = rs.getString("description");
                String campaignJob = rs.getString("job");
                String status = rs.getString("status");
                Date createDate = rs.getDate("created_at");
                return new Campaign(campaignID, campaignName, projectName,projectID, createDate, campaignLocation, description, campaignJob, status);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public String getProjectIDByCampaignID(String CID) {
        String projectID = null;
        String query = "SELECT project_id FROM Campaigns\n"
                + "WHERE campaign_id = ?";

        try {
            
            ps = connection.prepareStatement(query);
            ps.setString(1, CID);
            rs = ps.executeQuery();
            while (rs.next()) {
                projectID = rs.getString("project_id");
            }

        } catch (Exception e) {
        }

        return projectID;
    }

    // For Comment
    public List<CampaignComment> getCommentsForCampaign(String Id) {
        List<CampaignComment> list = new ArrayList<>();
        String query = "SELECT nc.review_id, nc.comment, u.username, nc.created_at "
                + "FROM CampaignReviews nc "
                + "JOIN Users u ON nc.user_id = u.user_id "
                + "WHERE nc.campaign_id = ? "
                + "ORDER BY nc.review_id DESC";

        try {
            
            ps = connection.prepareStatement(query);
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

    public void insertCommentCampaign(int Id, int userId, String comment) {
        String query = "INSERT INTO CampaignReviews (campaign_id, user_id, comment) VALUES (?, ?, ?)";
        try {
            
            ps = connection.prepareStatement(query);
            ps.setInt(1, Id);
            ps.setInt(2, userId);
            ps.setString(3, comment);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
    }

    // For Member
    public List<CampaignMembers> getAllCampaignMembers(String MID) {
        List<CampaignMembers> list = new ArrayList<>();
        String query = "SELECT c.*, u.username \n"
                + "FROM CampaignParticipants c\n"
                + "LEFT JOIN Volunteers v ON c.volunteer_id = v.volunteer_id\n"
                + "LEFT JOIN Users u ON u.user_id = v.user_id\n"
                + "WHERE c.campaign_id = ?\n"
                + "AND participation_type = 'Joined'\n"
                + "ORDER BY c.participant_id";

        try {
            
            ps = connection.prepareStatement(query);
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
    
    public boolean doesUserHaveVolunteerId(int userId) {
        boolean hasVolunteerId = false;
        try {
            
            String query = "SELECT COUNT(*) FROM Volunteers WHERE user_id = ?";
            ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                hasVolunteerId = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return hasVolunteerId;
    }

    public boolean isUserInCampaign(int userId, int campaignId) {
        String query = "SELECT 1\n"
                + "FROM CampaignParticipants cp\n"
                + "JOIN Volunteers v ON v.volunteer_id = cp.volunteer_id\n"
                + "JOIN Users u ON u.user_id = v.user_id\n"
                + "WHERE u.user_id = ? AND cp.campaign_id = ?";
        try {
            
            ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, campaignId);
            rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void addUserToCampaign(int userId, int campaignId) {
        String query = "INSERT INTO CampaignParticipants (volunteer_id, campaign_id, job, participation_type) "
                + "VALUES ((SELECT v.volunteer_id "
                + "FROM Volunteers v "
                + "JOIN Users u ON u.user_id = v.user_id "
                + "WHERE u.user_id = ?), ?, 'null', 'Interested')";

        try {
        
            ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, campaignId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void removeUserFromCampaign(int userId, int campaignId) {
        String query = "DELETE FROM CampaignParticipants "
                + "WHERE volunteer_id = (SELECT v.volunteer_id "
                + "FROM Volunteers v "
                + "JOIN Users u ON u.user_id = v.user_id "
                + "WHERE u.user_id = ?) "
                + "AND campaign_id = ?";
        try {
            
            ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, campaignId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {

        CampaignDAOforUsers dao = new CampaignDAOforUsers();
        int userId = 1;        // Thay đổi giá trị userId theo ý muốn
        int campaignId = 6;  // Thay đổi giá trị campaignId theo ý muốn

        dao.addUserToCampaign(userId, campaignId);
        List<Campaign> list = dao.getAllCampaigns(1);
        for(Campaign o : list){
            System.out.print(o);
        }
    }
}
