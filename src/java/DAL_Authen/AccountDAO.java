/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL_Authen;

import DAL_Staff.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Users;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author FPT
 */
public class AccountDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Users> getAllAccount() {
        List<Users> list = new ArrayList<>();
        String query = "select * from Users";

        try {
            ps = connection.prepareStatement(query);

            rs = ps.executeQuery();

            while (rs.next()) {
                Users account = new Users(
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
                        rs.getBoolean("verified"));
                list.add(account);

            }
            return list;

        } catch (SQLException exception) {
            System.out.println(exception);
        }

        return null;
    }

    public Users getAccountByUsername(String username, String pass) {
        String query = "SELECT * FROM Users WHERE username = ?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
                String hashedPassword = rs.getString("password_hash");
                if (BCrypt.checkpw(pass, hashedPassword)) {
                    return new Users(
                            rs.getInt("user_id"),
                            rs.getString("username"),
                            rs.getString("email"),
                            hashedPassword,
                            rs.getBoolean("password_reset_required"),
                            rs.getString("role"),
                            rs.getString("fullname"),
                            rs.getString("adrees"),
                            rs.getString("gender"),
                            rs.getString("phone"),
                            rs.getString("image"),
                            rs.getBoolean("verified")
                    );
                }
            }
        } catch (SQLException exception) {
            System.out.println(exception);
        }
        return null;
    }

    public Users checkAccountByUsername(String username) {
        String query = "SELECT * FROM Users WHERE username = ?";

        try {
            ps = connection.prepareStatement(query);

            ps.setString(1, username);

            rs = ps.executeQuery();

            if (rs.next()) {
                Users account = new Users(
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
                        rs.getBoolean("verified"));
                return account;
            }

        } catch (SQLException exception) {
            System.out.println(exception);
        }

        return null;
    }

    public Users getAccountByemail(String email, String pass) {
        String query = "SELECT * FROM Users WHERE email = ?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();

            if (rs.next()) {
                String hashedPassword = rs.getString("password_hash");
                if (BCrypt.checkpw(pass, hashedPassword)) {
                    return new Users(
                            rs.getInt("user_id"),
                            rs.getString("username"),
                            rs.getString("email"),
                            hashedPassword,
                            rs.getBoolean("password_reset_required"),
                            rs.getString("role"),
                            rs.getString("fullname"),
                            rs.getString("adrees"),
                            rs.getString("gender"),
                            rs.getString("phone"),
                            rs.getString("image"),
                            rs.getBoolean("verified")
                    );
                }
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return null;
    }

    public boolean createNewUser(Users user) {
        String query = "INSERT INTO Users (username, email, password_hash, fullname, adrees, gender, phone, image, role,password_reset_required)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        user.setRole("donor");
        user.setPassword_reset_required(false);
        try {
            ps = connection.prepareStatement(query);

            ps.setString(1, user.getUserName());
            ps.setString(2, user.getEmail());
            // Mã hóa mật khẩu bằng BCrypt
            String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
            ps.setString(3, hashedPassword);
            ps.setString(4, user.getFullname());
            ps.setString(5, user.getAdrees());
            ps.setString(6, user.getGender());
            ps.setString(7, user.getPhone());
            ps.setString(8, user.getImage());
            ps.setString(9, user.getRole());
            ps.setBoolean(10, user.isPassword_reset_required());

            ps.executeUpdate();
            return true;

        } catch (SQLException exception) {
            System.out.println(exception);
        }
        return false;
    }

    public boolean checkAccountByEmail(String email) {
        String query = "SELECT * FROM Users WHERE email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Users checkAccountByemail(String email) {
        String query = "SELECT * FROM Users WHERE email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                Users account = new Users(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8),
                        rs.getString(9), rs.getString(10), rs.getString(11), rs.getBoolean(12));
                return account;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updatePasswordByEmail(String email, String newPassword) {
        String query = "UPDATE Users SET password_hash = ? WHERE email = ?";
        try {
            ps = connection.prepareStatement(query);
            String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
            ps.setString(1, hashedPassword);
            ps.setString(2, email);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace(); // Thay thế bằng logging framework
        }
        return false;
    }

    public int getUserIdByEmail(String email) {
        String query = "SELECT user_id FROM Users WHERE email = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("user_id");
                }
            }
        } catch (SQLException exception) {
            exception.printStackTrace(); // Thay thế bằng logging framework
        }
        return -1; // Trả về -1 nếu không tìm thấy
    }

    public boolean isUserVerified(int userId) {
        String query = "SELECT verified FROM Users WHERE user_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getBoolean("verified");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updatePasswordResetRequired(int userId, boolean required) {
        String query = "UPDATE Users SET password_reset_required = ? WHERE user_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setBoolean(1, required);
            ps.setInt(2, userId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        // Tạo một instance của AccountDAO
        AccountDAO accountDAO = new AccountDAO();

        // Email cần kiểm tra, thay thế bằng email thực tế có trong cơ sở dữ liệu
        String testEmail = "ntt4447777@gmail.com";
        String testPassword = "abc";

        // Gọi phương thức checkAccountByemail
        Users userByEmail = accountDAO.getAccountByemail(testEmail, testPassword);
        if (userByEmail != null) {
            System.out.println("User found by email:");
            printUserDetails(userByEmail);
        } else {
            System.out.println("No user found with email: " + testEmail);
        }

        // Test getAccountByUsername
        String testUsername = "mafiaTien";
        Users userByUsername = accountDAO.getAccountByUsername(testUsername, testPassword);
        if (userByUsername != null) {
            System.out.println("\nUser found by username:");
            printUserDetails(userByUsername);
        } else {
            System.out.println("No user found with username: " + testUsername);
        }

    }

    private static void printUserDetails(Users user) {
        System.out.println("User ID: " + user.getUserId());
        System.out.println("Username: " + user.getUserName());
        System.out.println("Email: " + user.getEmail());
        System.out.println("Password Reset Required: " + user.isPassword_reset_required());
        System.out.println("Role: " + user.getRole());
        System.out.println("Full Name: " + user.getFullname());
        System.out.println("Address: " + user.getAdrees());
        System.out.println("Gender: " + user.getGender());
        System.out.println("Phone: " + user.getPhone());
        System.out.println("Image: " + user.getImage());
        System.out.println("Verified: " + user.isVerified());
    }
}
