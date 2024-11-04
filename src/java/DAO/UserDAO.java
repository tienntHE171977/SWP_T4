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
public class UserDAO extends DBContext {

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery(sql); // gọi phương thức executeQuery() mà không có tham số
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt(1));
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

    public List<User> searchUser(String search) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT*          \n"
                + "  FROM [dbo].[Users] where fullname LIKE ? OR email LIKE ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            String searchPattern = "%" + search + "%";
            pstmt.setString(1, searchPattern);
            pstmt.setString(2, searchPattern);
            ResultSet rs = pstmt.executeQuery(); 
            
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt(1));
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
        String sql = "SELECT * FROM users WHERE user_id = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                user = new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)
                );
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return user;
    }

    public boolean editUserRole(int id, String newRole) {
        String sql = "UPDATE users SET role = ? WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, newRole);
            pstmt.setInt(2, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }
    }

    public User userProfile(int id) {
        User user = null;
        String sql = "SELECT fullName,email, adrees, gender, phone FROM users WHERE user_id = ?"; // SQL query to get specific user details
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id); // Set the ID parameter in the SQL query
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                user = new User( // Create a new User object with only the desired fields
                        rs.getString("email"),
                        rs.getString("fullName"),
                        rs.getString("adrees"),
                        rs.getString("gender"),
                        rs.getString("phone")
                );
                // If your User class has a method to set the ID, you can set it here as well
                user.setId(id); // Assuming you have a setId method in your User class
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return user;

    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        String search = "Do Sy Hung";
        List<User> users = userDAO.searchUser(search);
       
        for (User user : users) {
           System.out.println(user.getFullName());
//        }
//        int testUserId = 2; // Thay đổi ID này thành ID mà bạn muốn kiểm tra
//        User userProfile = userDAO.getUserDetail(testUserId);

//        if (úe != null) {
//            System.out.println("User  Profile:");
//            System.out.println(userProfile.getId());
//            System.out.println("Full Name: " + userProfile.getFullName());
//            System.out.println("Email: " + userProfile.getEmail());
//            System.out.println("Address: " + userProfile.getAddress());
//            System.out.println("Gender: " + userProfile.getGender());
//            System.out.println("Phone: " + userProfile.getPhone());
//        } else {
//            System.out.println("User  not found with ID: " + testUserId);
//        
    }
    }

}
