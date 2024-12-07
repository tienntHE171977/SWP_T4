/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dalQuang;

import ModelQuang.Organization;
import ModelQuang.User;
import java.security.Timestamp;
import dalQuang.DAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author admin
 */
public class OrganizationDAO extends DBContext {

    DAO d = new DAO();

    public List<Organization> getAllOrganizations() {
        List<Organization> organizations = new ArrayList<>();
        String sql = "SELECT * FROM Organizations";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Organization organization = new Organization();
                organization.setOrganizationId(rs.getInt("organization_id"));
                organization.setName(rs.getString("name"));
                organization.setWebsite(rs.getString("website"));
                organization.setDescription(rs.getString("description"));
                organization.setImage(rs.getString("image"));
                organization.setPhone(rs.getString("phone"));
                organization.setEmail(rs.getString("email"));
                User u = d.selectUserById(rs.getInt("created_by"));
                organization.setCreatedBy(u);
                organization.setStaffId(rs.getInt("staff_id"));
                organization.setApprovalDate(rs.getDate("approval_date"));
                organization.setEstablishmentTime(rs.getDate("Establishment_time"));
                organization.setOrganizationStatus(rs.getString("organization_status"));
                organizations.add(organization);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Hoặc log lỗi
        }

        return organizations;
    }

    public List<Organization> getWaitApprovelOrganizations() {
        List<Organization> organizations = new ArrayList<>();
        String sql = "SELECT * FROM Organizations Where organization_status Like 'pending'";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Organization organization = new Organization();
                organization.setOrganizationId(rs.getInt("organization_id"));
                organization.setName(rs.getString("name"));
                organization.setWebsite(rs.getString("website"));
                organization.setDescription(rs.getString("description"));
                organization.setImage(rs.getString("image"));
                organization.setPhone(rs.getString("phone"));
                organization.setEmail(rs.getString("email"));
                User u = d.selectUserById(rs.getInt("created_by"));
                organization.setCreatedBy(u);
                organization.setStaffId(rs.getInt("staff_id"));
                organization.setApprovalDate(rs.getDate("approval_date"));
                organization.setEstablishmentTime(rs.getDate("Establishment_time"));
                organization.setOrganizationStatus(rs.getString("organization_status"));
                organizations.add(organization);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Hoặc log lỗi
        }

        return organizations;
    }

    public Organization getOById(int id) {
        String sql = "select * from Organizations where organization_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String website = rs.getString("website");
                String des = rs.getString("description");
                String img = rs.getString("image");
                String phone = rs.getString("phone");
                String mail = rs.getString("email");
                User u = d.selectUserById(rs.getInt("created_by"));
                int staff_id = rs.getInt("staff_id");
                Date approval_date = rs.getDate("approval_date");
                Date Est_date = rs.getDate("Establishment_time");
                String status = rs.getString("organization_status");
                Organization o = new Organization(id, name, website, des, img, phone, mail, u, staff_id, approval_date, Est_date, status);
                return o;
            }
        } catch (Exception e) {
        }
        return null;
    }
    public Organization getOByUserId(int id) {
        String sql = "select * from Organizations where created_by = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int Oid = rs.getInt("organization_id");
                String name = rs.getString("name");
                String website = rs.getString("website");
                String des = rs.getString("description");
                String img = rs.getString("image");
                String phone = rs.getString("phone");
                String mail = rs.getString("email");
                User u = d.selectUserById(id);
                int staff_id = rs.getInt("staff_id");
                Date approval_date = rs.getDate("approval_date");
                Date Est_date = rs.getDate("Establishment_time");
                String status = rs.getString("organization_status");
                Organization o = new Organization(Oid, name, website, des, img, phone, mail, u, staff_id, approval_date, Est_date, status);
                return o;
            }
        } catch (Exception e) {
        }
        return null;
    }

    // Insert a new organization
    public void insert(Organization organization){
        String sql = "INSERT INTO Organizations (name, website, description, image, phone, email, created_by, staff_id, approval_date, Establishment_time, organization_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
        PreparedStatement pstmt = connection.prepareStatement(sql);
        pstmt.setString(1, organization.getName());
        pstmt.setString(2, organization.getWebsite());
        pstmt.setString(3, organization.getDescription());
        pstmt.setString(4, organization.getImage());
        pstmt.setString(5, organization.getPhone());
        pstmt.setString(6, organization.getEmail());
        pstmt.setInt(7, organization.getCreatedBy().getUserId()); // Giả sử User có phương thức getUserId()
        pstmt.setInt(8, organization.getStaffId());
        pstmt.setDate(9, new java.sql.Date(organization.getApprovalDate().getTime()));
        pstmt.setDate(10, new java.sql.Date(organization.getEstablishmentTime().getTime()));
        pstmt.setString(11, organization.getOrganizationStatus());

        pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Hoặc log lỗi
        }
    }

    public void update(Organization organization) {
        String sql = "UPDATE Organizations SET name = ?, website = ?, description = ?, image = ?, phone = ?, email = ?, created_by = ?, staff_id = ?, approval_date = ?, Establishment_time = ?, organization_status = ? WHERE organization_id = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, organization.getName());
            pstmt.setString(2, organization.getWebsite());
            pstmt.setString(3, organization.getDescription());
            pstmt.setString(4, organization.getImage());
            pstmt.setString(5, organization.getPhone());
            pstmt.setString(6, organization.getEmail());
            pstmt.setInt(7, organization.getCreatedBy().getUserId()); // Giả sử User có phương thức getUserId()
            pstmt.setInt(8, organization.getStaffId());
            pstmt.setDate(9, new java.sql.Date(organization.getApprovalDate().getTime()));
            pstmt.setDate(10, new java.sql.Date(organization.getEstablishmentTime().getTime()));
            pstmt.setString(11, organization.getOrganizationStatus());
            pstmt.setInt(12, organization.getOrganizationId());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Hoặc log lỗi
        }
    }

    // Delete organization
    public void delete(int organizationId) {
        String query = "DELETE FROM Organizations WHERE organization_id = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, organizationId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Hoặc log lỗi
        }
    }

    public static void main(String[] args) {
        DAO dd = new DAO();
        OrganizationDAO ddd  = new OrganizationDAO();
        User u = dd.selectUserById(7);
        System.out.println(ddd.getOByUserId(u.getUserId()));
        Organization n = new Organization(0, "dd", "sad", "sdad", "Dasd", "adf", "sfa", u, 3, new Date(), new Date(), "pending");
        ddd.insert(n);
    }
}
