/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CampaignsDAO;

import DBContext.DBContext;
import Model.Campaign;
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
        String query = "SELECT c.*, p.title, l.address \n"
                + "FROM Campaigns c\n"
                + "LEFT JOIN Projects p ON c.project_id = p.project_id\n"
                + "LEFT JOIN Locations l ON c.location_id = l.location_id\n"
                + "WHERE c.status = 'on'\n"
                + "ORDER BY c.campaign_id\n"
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

    public static void main(String[] args) {

        CampaignDAOforAdminUser dao = new CampaignDAOforAdminUser();

        List<Campaign> results = dao.getAllCampaigns(2);
        for (Campaign o : results) {
            System.out.println(o);
        }
    }
}
