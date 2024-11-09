/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL_Staff;

import DBContext.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Staff;
import model.User;

/**
 *
 * @author FPT
 */
public class StaffDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public Staff getStaffByUserId(int userId) {
        String query = "SELECT * FROM Staff WHERE user_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            if (rs.next()) {
                Staff staff = new Staff();
                staff.setStaff_id(rs.getInt("staff_id"));
                staff.setRole_staff(rs.getString("role"));
                staff.setStatus(rs.getString("status"));
                staff.setApproval_date(rs.getDate("approval_date"));
                staff.setFirst_password(rs.getString("first_password"));
                staff.setCreated_at(rs.getDate("created_at"));
                staff.setUpdated_at(rs.getDate("updated_at"));

                // Tạo và đặt User object
                User user = new User();
                user.setUserId(userId);
                staff.setUser(user);

                return staff;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public Staff getStaffProfile(int userId) {
        String query = """
            SELECT s.*, u.* 
            FROM Staff s
            INNER JOIN Users u ON s.user_id = u.user_id
            WHERE s.user_id = ?
        """;

        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Tạo đối tượng User
                User user = new User(
                    rs.getInt("user_id"),
                    rs.getString("username"),
                    rs.getString("email"),
                    rs.getString("password_hash"),
                    rs.getBoolean("password_reset_required"),
                    rs.getString("role"),
                    rs.getString("fullname"),
                    rs.getString("adrees"),
                    rs.getString("gender"),
                    rs.getString("phone"),
                    rs.getString("image"),
                    rs.getBoolean("verified")
                );

                // Tạo đối tượng Staff
                Staff staff = new Staff(
                    user,
                    rs.getInt("staff_id"),
                    rs.getString("role"),
                    rs.getString("status"),
                    rs.getDate("approval_date"),
                    rs.getString("first_password"),
                    rs.getDate("created_at"),
                    rs.getDate("updated_at")
                );

                return staff;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean updateStaffProfile(Staff staff) {
        // Update User table
        String updateUserQuery = """
            UPDATE Users 
            SET fullname = ?, adrees = ?, gender = ?, 
                phone = ?, image = ?
            WHERE user_id = ?
        """;

        // Update Staff table
        String updateStaffQuery = """
            UPDATE Staff
            SET role_staff = ?, status = ?
            WHERE user_id = ?
        """;

        try {
            connection.setAutoCommit(false);

            // Update User
            ps = connection.prepareStatement(updateUserQuery);
            ps.setString(1, staff.getUser().getFullname());
            ps.setString(2, staff.getUser().getAdrees());
            ps.setString(3, staff.getUser().getGender());
            ps.setString(4, staff.getUser().getPhone());
            ps.setString(5, staff.getUser().getImage());
            ps.setInt(6, staff.getUser().getUserId());
            ps.executeUpdate();

            // Update Staff
            ps = connection.prepareStatement(updateStaffQuery);
            ps.setString(1, staff.getRole_staff());
            ps.setString(2, staff.getStatus());
            ps.setInt(3, staff.getUser().getUserId());
            ps.executeUpdate();

            connection.commit();
            return true;

        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public static void main(String[] args) {
        StaffDAO dao = new StaffDAO();
        
        // Test loading staff profile
        Staff staff = dao.getStaffProfile(14); // Thay 1 bằng user_id thực tế
        if (staff != null) {
            System.out.println("Staff found:");
            System.out.println("Staff ID: " + staff.getStaff_id());
            System.out.println("Full Name: " + staff.getUser().getFullname());
            System.out.println("Role: " + staff.getRole_staff());
            System.out.println("Status: " + staff.getStatus());
        } else {
            System.out.println("Staff not found");
        }
    }
}
