/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL_Staff;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Staff;
import model.Users;

/**
 *
 * @author FPT
 */
public class StaffDAO extends DBContext{
    PreparedStatement ps = null;
    ResultSet rs = null;
    public Staff getStaffByUserId(int userId) {
        
        String query = "SELECT * FROM Staff WHERE user_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            if (rs.next()) {
                Staff staff = new Staff(rs.getInt("staff_id"), rs.getInt("user_id"),
                        rs.getString("role"), rs.getString("status"),
                        rs.getDate("approval_date"), rs.getString("first_password"),
                        rs.getDate("created_at"), rs.getDate("updated_at"));
                return staff;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
