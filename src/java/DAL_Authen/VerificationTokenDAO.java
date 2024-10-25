/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL_Authen;

import DBContext.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;
import java.sql.Timestamp;

/**
 *
 * @author FPT
 */
public class VerificationTokenDAO extends DBContext{
    PreparedStatement ps = null;
    ResultSet rs = null;
//    public void saveVerificationToken(int userId, String token) {
//        String query = "INSERT INTO VerificationTokens (user_id, token) VALUES (?, ?)";
//        
//        try {
//            ps = connection.prepareStatement(query); 
//
//            ps.setInt(1, userId);
//            ps.setString(2, token);
//            ps.executeUpdate();
//
//        } catch (SQLException exception) {
//            System.out.println("Error saving verification token: " + exception.getMessage());
//        }
//    }
    
    public boolean verifyToken(String token) {
    String query = "SELECT user_id FROM VerificationTokens WHERE token = ? AND created_at > ?";
    try (PreparedStatement ps = connection.prepareStatement(query)) {
        ps.setString(1, token);
        // Tính toán thời gian 24 giờ trước
        Timestamp timestamp = new Timestamp(System.currentTimeMillis() - 24 * 60 * 60 * 1000);
        ps.setTimestamp(2, timestamp);
        
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                int userId = rs.getInt("user_id");
                activateUserAccount(userId);
                deleteToken(token);
                return true;
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}
    private void deleteToken(String token) {
    String query = "DELETE FROM VerificationTokens WHERE token = ?";
    try (PreparedStatement ps = connection.prepareStatement(query)) {
        ps.setString(1, token);
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
    public String generateAndSaveVerificationToken(int userId) {
    String token = UUID.randomUUID().toString();
    String query = "INSERT INTO [dbo].[VerificationTokens]\n" +
"           ([user_id]\n" +
"           ,[token]\n" +
"           ,[created_at])\n" +
"     VALUES\n" +
"            (?," +
"            ?," +
"            GETDATE())";

    try (PreparedStatement ps = connection.prepareStatement(query)) {
        ps.setInt(1, userId);
        ps.setString(2, token);
        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
            return token;
        }
    } catch (SQLException e) {
        e.printStackTrace();
        return null;
    }

    return token; // Trả về null nếu không lưu được
}
    // Phương thức kiểm tra mã xác thực
    public Integer getUserIdByToken(String token) {
        String query = "SELECT user_id FROM VerificationTokens WHERE token = ?";
        
        try {
             PreparedStatement ps = connection.prepareStatement(query);

            ps.setString(1, token);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("user_id");
            }
        } catch (SQLException exception) {
            System.out.println("Error verifying token: " + exception.getMessage());
        }

        return null; // Token không hợp lệ
    }
    public boolean isUserVerified(int userId) {
    String query = "SELECT verified FROM Users WHERE user_id = ?";
    
    try {
        ps = connection.prepareStatement(query);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getBoolean("verified");
        }
    } catch (SQLException exception) {
        System.out.println("Error checking user verification status: " + exception.getMessage());
    }
    
    return false; // Mặc định là chưa xác thực
}
    public void activateUserAccount(int userId) {
    String query = "UPDATE Users SET verified = 1 WHERE user_id = ?";
    
    try {
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, userId);
        ps.executeUpdate();
    } catch (SQLException exception) {
        System.out.println("Error activating user account: " + exception.getMessage());
    }
}
     public static void main(String[] args) {
        // Khởi tạo đối tượng VerificationTokenDAO
        VerificationTokenDAO verificationTokenDAO = new VerificationTokenDAO();

        // Test: Lưu mã xác thực
        VerificationTokenDAO tokenDAO = new VerificationTokenDAO();

        // Giả sử userId là 1
        int userId = 14;

        // Gọi hàm generateAndSaveVerificationToken và in ra kết quả
        String token = tokenDAO.generateAndSaveVerificationToken(userId);

        if (token != null) {
            System.out.println("Token generated and saved successfully: " + token);
        } else {
            System.out.println("Failed to generate and save token.");
        }
    }
}
