/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL_Project;

import DBContext.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import model.Organization;
import model.Project;

/**
 *
 * @author FPT
 */
public class OrganizationDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;
    
    /////////////tiếnnt
    public List<Organization> getAllOrganization() {
        List<Organization> list = new ArrayList<>();
        String query = "SELECT * FROM Organization";

        try {
            ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int organizationId = rs.getInt("organization_id");
                String name = rs.getString("name");
                String website = rs.getString("website");
                String description = rs.getString("description");
                String image = rs.getString("image");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                int createdBy = rs.getInt("created_by");
                int staffId = rs.getInt("staff_id");
                Date approvalDate = rs.getDate("approval_date");
                Date establishmentTime = rs.getDate("Establishment_time");
                String organizationStatus = rs.getString("organization_status");

                Organization o = new Organization(organizationId, name, website, description, image, phone, email, createdBy, staffId, approvalDate, establishmentTime, organizationStatus);

                list.add(o);
            }
        } catch (SQLException exception) {
            System.out.println("Error while fetching projects: " + exception.getMessage());
        }

        return list;
    }

    public int getTotalOrganization() {
        String query = "SELECT COUNT(*) FROM Organizations";
        try {
            ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException exception) {
            System.out.println("Error while fetching total projects: " + exception.getMessage());
        }
        return 0;
    }
    public Map<String, Integer> getOrganizationsCreatedPerMonth(int year) {
    Map<String, Integer> organizationsPerMonth = new LinkedHashMap<>();
    String query = "SELECT MONTH(establishment_time) AS month, COUNT(*) AS total " +
                   "FROM Organizations " +
                   "WHERE YEAR(establishment_time) = ? " +
                   "GROUP BY MONTH(establishment_time) " +
                   "ORDER BY MONTH(establishment_time)";
    
    try {
        ps = connection.prepareStatement(query);
        ps.setInt(1, year);
        rs = ps.executeQuery();
        
        while (rs.next()) {
            String month = String.format("%02d", rs.getInt("month"));
            int total = rs.getInt("total");
            organizationsPerMonth.put(month, total);
        }
    } catch (SQLException exception) {
        System.out.println("Error while fetching organizations per month: " + exception.getMessage());
    }
    
    return organizationsPerMonth;
}

    public static void main(String[] args) {
        OrganizationDAO organizationDAO = new OrganizationDAO();
            
            // Gọi phương thức getOrganizationsCreatedPerMonth
            //Map<String, Integer> organizationsPerMonth = organizationDAO.getOrganizationsCreatedPerMonth();
            
            // In kết quả ra màn hình
//            for (Map.Entry<String, Integer> entry : organizationsPerMonth.entrySet()) {
//                System.out.println("Month: " + entry.getKey() + ", Total: " + entry.getValue());
//            }
    }
}
