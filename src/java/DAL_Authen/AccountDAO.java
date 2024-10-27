/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL_Authen;

import DBContext.DBContext;
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
    public Users getUserByEmail(String email) {
        String query = "SELECT * FROM Users WHERE email = ?";

        try {
            ps = connection.prepareStatement(query);

            ps.setString(1, email);

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
            e.printStackTrace();
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

    public boolean updateUserProfile(Users user) {
        String query = """
        UPDATE Users 
        SET phone = ?, adrees = ? 
        WHERE user_id = ?
    """;

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getPhone());
            ps.setString(2, user.getAdrees());
            
            ps.setInt(3, user.getUserId());
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

    public boolean updateUserProfileImage(Users user) {
        String sql = "UPDATE Users SET image = ? WHERE user_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, user.getImage());
            ps.setInt(2, user.getUserId());
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
        
        String mail = "nguyentrungtien512003@gmail.com";
        Users user = accountDAO.getUserByEmail(mail);
        if (user != null) {
                System.out.println("User found: " + user.getAdrees());
                System.out.println("User found: " + user.getEmail());
                System.out.println("User found: " + user.getFullname());
                System.out.println("User found: " + user.getGender());
                System.out.println("User found: " + user.getImage());
                System.out.println("User found: " + user.getPassword());
                System.out.println("User found: " + user.getPhone());
                System.out.println("User found: " + user.getRole());
                System.out.println("User found: " + user.getUserName());
                System.out.println("User found: " + user.getUserId());
                System.out.println("User found: " + user.getUserId());
                // In ra các thông tin khác nếu cần
            } else {
                System.out.println("No user found with email: " + mail);
            }
    
//        user.setUserId(14); // Đặt ID người dùng cần cập nhật
//        user.setPhone("123456789");
//        user.setAdrees("123 Main St");
//        user.setImage("images/google.png"); // Đường dẫn đến file ảnh
//
//        // Gọi phương thức updateUserProfile
//        boolean isUpdated = accountDAO.updateUserProfile(user);
//        boolean imageUpdated = accountDAO.updateUserProfileImage(user);
//        // Kiểm tra kết quả
//        if (isUpdated) {
//            System.out.println("User profile updated successfully.");
//        } else {
//            System.out.println("Failed to update user profile.");
//        }
//        if (imageUpdated) {
//            System.out.println("Cập nhật ảnh người dùng thành công.");
//        } else {
//            System.out.println("Cập nhật ảnh người dùng thất bại.");
//        }
        // Test createNewUser
//    Users newUser = new Users();
//    newUser.setUserName("testUser");
//    newUser.setEmail("test@example.com");
//    newUser.setPassword("password123");
//    newUser.setFullname("Test User");
//    newUser.setAdrees("123 Test St");
//    newUser.setGender("Male");
//    newUser.setPhone("123456789");
//    newUser.setImage(null);
//    boolean isCreated = accountDAO.createNewUser(newUser);
//    System.out.println("Create new user: " + (isCreated ? "Success" : "Failed"));
//
//    // Test getAllAccount
//    List<Users> users = accountDAO.getAllAccount();
//    System.out.println("\nAll Accounts:");
//    for (Users user : users) {
//        printUserDetails(user);
//    }
//
//    // Test getAccountByUsername
//    String testUsername = "testUser";
//    String testPassword = "password123";
//    Users userByUsername = accountDAO.getAccountByUsername(testUsername, testPassword);
//    System.out.println("\nUser found by username:");
//    if (userByUsername != null) {
//        printUserDetails(userByUsername);
//    } else {
//        System.out.println("No user found with username: " + testUsername);
//    }
//
//    // Test checkAccountByUsername
//    Users checkUserByUsername = accountDAO.checkAccountByUsername(testUsername);
//    System.out.println("\nCheck user by username:");
//    if (checkUserByUsername != null) {
//        printUserDetails(checkUserByUsername);
//    } else {
//        System.out.println("No user found with username: " + testUsername);
//    }
//
//    // Test getAccountByemail
//    String testEmail = "test@example.com";
//    Users userByEmail = accountDAO.getAccountByemail(testEmail, testPassword);
//    System.out.println("\nUser found by email:");
//    if (userByEmail != null) {
//        printUserDetails(userByEmail);
//    } else {
//        System.out.println("No user found with email: " + testEmail);
//    }
//
//    // Test checkAccountByEmail
//    boolean emailExists = accountDAO.checkAccountByEmail(testEmail);
//    System.out.println("\nCheck account by email: " + (emailExists ? "Exists" : "Does not exist"));
//
//    // Test updatePasswordByEmail
//    String newPassword = "newPassword123";
//    boolean isPasswordUpdated = accountDAO.updatePasswordByEmail(testEmail, newPassword);
//    System.out.println("\nUpdate password by email: " + (isPasswordUpdated ? "Success" : "Failed"));
//
//    // Test getUserIdByEmail
//    int userId = accountDAO.getUserIdByEmail(testEmail);
//    System.out.println("\nUser ID by email: " + (userId != -1 ? userId : "Not found"));
//
//    // Test isUserVerified
//    boolean isVerified = accountDAO.isUserVerified(userId);
//    System.out.println("\nIs user verified: " + (isVerified ? "Yes" : "No"));
//
//    // Test updatePasswordResetRequired
//    boolean isPasswordResetRequiredUpdated = accountDAO.updatePasswordResetRequired(userId, true);
//    System.out.println("\nUpdate password reset required: " + (isPasswordResetRequiredUpdated ? "Success" : "Failed"));
//}
//
//private static void printUserDetails(Users user) {
//    System.out.println("User ID: " + user.getUserId());
//    System.out.println("Username: " + user.getUserName());
//    System.out.println("Email: " + user.getEmail());
//    System.out.println("Password Reset Required: " + user.isPassword_reset_required());
//    System.out.println("Role: " + user.getRole());
//    System.out.println("Full Name: " + user.getFullname());
//    System.out.println("Address: " + user.getAdrees());
//    System.out.println("Gender: " + user.getGender());
//    System.out.println("Phone: " + user.getPhone());
//    System.out.println("Image: " + user.getImage());
//    System.out.println("Verified: " + user.isVerified());
    }

}
