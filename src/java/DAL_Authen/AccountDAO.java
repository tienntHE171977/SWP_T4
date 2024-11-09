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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.User;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author FPT
 */
public class AccountDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<User> getAllAccount() {
        List<User> list = new ArrayList<>();
        String query = "select * from Users";

        try {
            ps = connection.prepareStatement(query);

            rs = ps.executeQuery();

            while (rs.next()) {
                User account = new User(
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

    public List<User> getUsersByPage(int page, int pageSize) {
        List<User> list = new ArrayList<>();
        String query = "SELECT * FROM Users ORDER BY user_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, (page - 1) * pageSize);
            ps.setInt(2, pageSize);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    User account = new User(
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
            }
        } catch (SQLException exception) {
            exception.printStackTrace();  // Hoặc sử dụng logging framework
        }
        return list;
    }

    public int getTotalUsers() {
        String query = "SELECT COUNT(*) FROM Users";
        int totalUsers = 0;

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                totalUsers = rs.getInt(1);  // Lấy giá trị đếm từ cột đầu tiên
            }
        } catch (SQLException exception) {
            exception.printStackTrace();  // Hoặc sử dụng logging framework
        }

        return totalUsers;
    }

    public int countUsersByRole(String role) {
        int count = 0;
        String query = "SELECT COUNT(*) FROM Users WHERE role = ?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, role);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                count = resultSet.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Thay đổi cách xử lý ngoại lệ tùy theo yêu cầu của bạn
        }

        return count;
    }

    public boolean banUser(int userId) {
        String sql = "UPDATE Users SET role = 'ban' WHERE user_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Map<String, Integer> getUserStatisticsByRole() {
        Map<String, Integer> statistics = new HashMap<>();
        String query = "SELECT role, COUNT(*) AS count FROM Users GROUP BY role";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                statistics.put(resultSet.getString("role"), resultSet.getInt("count"));
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Thay đổi cách xử lý ngoại lệ tùy theo yêu cầu của bạn
        }

        return statistics;
    }

    public List<User> searchUsersByName(String name, int page, int pageSize) {
        List<User> users = new ArrayList<>();

        // Kiểm tra giá trị page và pageSize
        if (page <= 0 || pageSize <= 0) {
            throw new IllegalArgumentException("Page and pageSize must be greater than 0");
        }

        int start = (page - 1) * pageSize;
        String sql = "SELECT * FROM users WHERE username LIKE ? ORDER BY user_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, "%" + name + "%");
            ps.setInt(2, start);
            ps.setInt(3, pageSize);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
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
                            rs.getBoolean("verified"));
                    users.add(user);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public int getTotalUsersByName(String name) {
        String sql = "SELECT COUNT(*) FROM users WHERE username LIKE ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public User getAccountByUsername(String username, String pass) {
        String query = "SELECT * FROM Users WHERE username = ?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
                String hashedPassword = rs.getString("password_hash");
                if (BCrypt.checkpw(pass, hashedPassword)) {
                    return new User(
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

    public User checkAccountByUsername(String username) {
        String query = "SELECT * FROM Users WHERE username = ?";

        try {
            ps = connection.prepareStatement(query);

            ps.setString(1, username);

            rs = ps.executeQuery();

            if (rs.next()) {
                User account = new User(
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

    public User getUserByEmail(String email) {
        String query = "SELECT * FROM Users WHERE email = ?";

        try {
            ps = connection.prepareStatement(query);

            ps.setString(1, email);

            rs = ps.executeQuery();

            if (rs.next()) {
                User account = new User(
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

    public User getAccountByemail(String email, String pass) {
        String query = "SELECT * FROM Users WHERE email = ?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();

            if (rs.next()) {
                String hashedPassword = rs.getString("password_hash");
                if (BCrypt.checkpw(pass, hashedPassword)) {
                    return new User(
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

    public boolean createNewUser(User user) {
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

    public User checkAccountByemail(String email) {
        String query = "SELECT * FROM Users WHERE email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                User account = new User(rs.getInt(1), rs.getString(2), rs.getString(3),
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

    public boolean updateUserProfile(User user) {
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

    public boolean userProfile(User user) {
        String query = """
        UPDATE Users 
        SET phone = ?, adrees = ?, gender = ?, role = ?
        WHERE user_id = ?
    """;

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getPhone());
            ps.setString(2, user.getAdrees());
            ps.setString(3, user.getGender());
            ps.setString(4, user.getRole());
            ps.setInt(5, user.getUserId());
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

    public List<User> getUsersByRole(String role, int page, int pageSize) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM Users WHERE role = ? ORDER BY user_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, role);
            ps.setInt(2, (page - 1) * pageSize);
            ps.setInt(3, pageSize);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    User user = new User();
                    user.setUserId(rs.getInt("user_id"));
                    user.setUserName(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password_hash"));
                    user.setFullname(rs.getString("fullname"));
                    user.setAdrees(rs.getString("adrees"));
                    user.setGender(rs.getString("gender"));
                    user.setPhone(rs.getString("phone"));
                    user.setImage(rs.getString("image"));
                    user.setRole(rs.getString("role"));
                    user.setPassword_reset_required(rs.getBoolean("password_reset_required"));
                    user.setVerified(rs.getBoolean("verified"));
                    users.add(user);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    public int getTotalUsersByRole(String role) {
        int totalUsers = 0;
        String sql = "SELECT COUNT(*) FROM Users WHERE role = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, role);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    totalUsers = rs.getInt(1);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalUsers;
    }

    public List<User> getUsersByGender(String gender, int page, int pageSize) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM Users WHERE gender = ? ORDER BY user_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, gender);
            ps.setInt(2, (page - 1) * pageSize);
            ps.setInt(3, pageSize);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    User user = new User();
                    user.setUserId(rs.getInt("user_id"));
                    user.setUserName(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password_hash"));
                    user.setFullname(rs.getString("fullname"));
                    user.setAdrees(rs.getString("adrees"));
                    user.setGender(rs.getString("gender"));
                    user.setPhone(rs.getString("phone"));
                    user.setImage(rs.getString("image"));
                    user.setRole(rs.getString("role"));
                    user.setPassword_reset_required(rs.getBoolean("password_reset_required"));
                    user.setVerified(rs.getBoolean("verified"));
                    users.add(user);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    public int getTotalUsersByGender(String gender) {
        int totalUsers = 0;
        String sql = "SELECT COUNT(*) FROM Users WHERE gender = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, gender);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    totalUsers = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalUsers;
    }

    public User getUserById(int userId) {
        User user = null;
        String query = "SELECT * FROM [Users] WHERE [user_id] = ?";

        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User(
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
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý ngoại lệ hoặc ghi log
        }

        return user;
    }

    public boolean updateUserProfileImage(User user) {
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

        // Kiểm tra hàm getUserById
//        int userId = 17; // Thay đổi ID người dùng để kiểm tra
//        User user = accountDAO.getUserById(userId);
//        if (user != null) {
//            System.out.println("User found: " + user.getFullname());
//        } else {
//            System.out.println("User not found.");
//        }
//
//        // Kiểm tra hàm userProfile
//        if (user != null) {
//            user.setPhone("123456789");
//            user.setAdrees("New Address");
//            user.setGender("Male");
//            user.setRole("volunteer");
//
//            boolean updateSuccess = accountDAO.userProfile(user);
//            if (updateSuccess) {
//                System.out.println("User profile updated successfully.");
//            } else {
//                System.out.println("Failed to update user profile.");
//            }
//        // ID của người dùng mà bạn muốn kiểm tra
//        int userIdToTest = 13; // Thay đổi ID này tùy theo dữ liệu của bạn
//
//        // Gọi phương thức getUserById
//        User user = accountDAO.getUserById(userIdToTest);
//
//        // Kiểm tra kết quả
//        if (user != null) {
//            System.out.println("Thông tin người dùng: " + user);
//        } else {
//            System.out.println("Không tìm thấy người dùng với ID: " + userIdToTest);
//        }

//                System.out.println("User found: " + user.getEmail());
//                System.out.println("User found: " + user.getFullname());
//                System.out.println("User found: " + user.getGender());
//                System.out.println("User found: " + user.getImage());
//                System.out.println("User found: " + user.getPassword());
//                System.out.println("User found: " + user.getPhone());
//                System.out.println("User found: " + user.getRole());
//                System.out.println("User found: " + user.getUserName());
//                System.out.println("User found: " + user.getUserId());
//                System.out.println("User found: " + user.getUserId());
            // In ra các thông tin khác nếu cần
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
    User newUser = new User();
    newUser.setUserName("tiennt88");
    newUser.setEmail("tiennt252@gmail.com");
    newUser.setPassword("123");
    newUser.setFullname("tiennt77");
    newUser.setAdrees("123 Test St");
    newUser.setGender("Male");
    newUser.setPhone("123456789");
    newUser.setImage(null);
//    newUser.getRole("staff");
    newUser.setPassword_reset_required(true);
    boolean isCreated = accountDAO.createNewUser(newUser);
    System.out.println("Create new user: " + (isCreated ? "Success" : "Failed"));
//
//    // Test getAllAccount
//    List<Users> users = accountDAO.getAllAccount();
//    System.out.println("\nAll Accounts:");
//    for (User user : users) {
//        printUserDetails(user);
//    }
//
//    // Test getAccountByUsername
//    String testUsername = "testUser";
//    String testPassword = "password123";
//    User userByUsername = accountDAO.getAccountByUsername(testUsername, testPassword);
//    System.out.println("\nUser found by username:");
//    if (userByUsername != null) {
//        printUserDetails(userByUsername);
//    } else {
//        System.out.println("No user found with username: " + testUsername);
//    }
//
//    // Test checkAccountByUsername
//    User checkUserByUsername = accountDAO.checkAccountByUsername(testUsername);
//    System.out.println("\nCheck user by username:");
//    if (checkUserByUsername != null) {
//        printUserDetails(checkUserByUsername);
//    } else {
//        System.out.println("No user found with username: " + testUsername);
//    }
//
//    // Test getAccountByemail
//    String testEmail = "test@example.com";
//    User userByEmail = accountDAO.getAccountByemail(testEmail, testPassword);
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
//private static void printUserDetails(User user) {
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
