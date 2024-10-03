/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.User;
import java.util.ArrayList;
import java.util.List;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

/**
 *
 * @author pc
 */
public class UserDAO extends DBContext  {
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery(sql); // gọi phương thức executeQuery() mà không có tham số
            while (rs.next()) {
                User  user = new User();
                user.setUserName(rs.getString("userName"));
                user.setEmail(rs.getString("Email"));
                user.setPassWord(rs.getString("password_hash"));
                user.setRole(rs.getString("role"));
                users.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        
        return users;
    }
 public User getUserDetail(int id) {
    User user = null;
    String sql = "SELECT * FROM users WHERE id = ?";
    try (Connection conn = getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setInt(1, id);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            user = new User();
            user.setId(rs.getInt("id"));
            user.setUserName(rs.getString("userName"));
            user.setEmail(rs.getString("email"));
            user.setPassWord(rs.getString("passWord"));
            user.setRole(rs.getString("role"));
        }
    } catch (SQLException e) {
        System.out.println("Error: " + e.getMessage());
    }
    return user;
}
 public boolean editUserRole(int id, String newRole) {
    String sql = "UPDATE users SET role = ? WHERE id = ?";
    try (Connection conn = getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setString(1, newRole);
        pstmt.setInt(2, id);
        return pstmt.executeUpdate() > 0;
    } catch (SQLException e) {
        System.out.println("Error: " + e.getMessage());
        return false;
    }
}
    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        List<User> users = userDAO.getAllUsers();
        for (User  user : users) {
            System.out.println(user.toString());
        }
    }

}
