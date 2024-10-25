/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL_Authen;

import DBContext.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
import java.util.Random;
import java.util.UUID;
import model.PasswordResetTokens;
import model.Users;

/**
 *
 * @author FPT
 */
public class PasswordResetTokensDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public boolean saveToken(int userId, String token, Timestamp expiryDate) {
        String query = "INSERT INTO PasswordResetTokens (user_id, token, expiry_date) VALUES (?, ?, ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setString(2, token);
            ps.setTimestamp(3, new Timestamp(expiryDate.getTime()));
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isValidOTP(String email, String otp) {
        String query = "SELECT prt.* FROM PasswordResetTokens prt " +
                       "JOIN Users u ON prt.user_id = u.user_id " +
                       "WHERE u.email = ? AND prt.token = ? AND prt.expiry_date > ?";
        try { ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, otp);
            ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    
    public PasswordResetTokens getTokenByEmail(String email) {
    String query = "SELECT prt.* FROM PasswordResetTokens prt " +
                   "JOIN Users u ON prt.user_id = u.user_id " +
                   "WHERE u.email = ? " +
                   "ORDER BY prt.expiry_date DESC";
    try {
        ps = connection.prepareStatement(query);
        ps.setString(1, email);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return new PasswordResetTokens(
                    rs.getInt("token_id"),
                    rs.getInt("user_id"),
                    rs.getString("token"),
                    rs.getTimestamp("expiry_date")
                );
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
}

    public boolean deleteToken(String token) {
        String query = "DELETE FROM PasswordResetTokens WHERE token = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, token);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public static void main(String[] args) {
        PasswordResetTokensDAO dao = new PasswordResetTokensDAO();
        
        // Test saveToken
        int userId = 14; // Giả sử có một user với id là 1
        String token = generateOTP();
        Timestamp expiryDate = new Timestamp(System.currentTimeMillis() + 900000); // 15 phút từ bây giờ
        
        boolean saved = dao.saveToken(userId, token, expiryDate);
        System.out.println("Token saved: " + saved);
        
        // Test isValidOTP
        String email = "nguyentrungtien512003@gmail.com"; // Giả sử đây là email của user có id 1
        boolean isValid = dao.isValidOTP(email, token);
        System.out.println("Is valid OTP: " + isValid);
        
        // Test getTokenByEmail
        PasswordResetTokens retrievedToken = dao.getTokenByEmail(email);
        if (retrievedToken != null) {
            System.out.println("Retrieved token: " + retrievedToken.getToken());
            System.out.println("Expiry date: " + retrievedToken.getExpiryDate());
        } else {
            System.out.println("No token found for email: " + email);
        }
        
        // Test deleteToken
        boolean deleted = dao.deleteToken(token);
        System.out.println("Token deleted: " + deleted);
        
        // Verify deletion
        retrievedToken = dao.getTokenByEmail(email);
        if (retrievedToken == null) {
            System.out.println("Token successfully deleted");
        } else {
            System.out.println("Token still exists");
        }
    }
    private static String generateOTP() {
        Random random = new Random();
        return String.format("%06d", random.nextInt(999999));
    }
}
