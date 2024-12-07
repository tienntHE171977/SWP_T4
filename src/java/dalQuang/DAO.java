/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dalQuang;

import ModelQuang.Campaign;
import ModelQuang.Notification;
import ModelQuang.Project;
import ModelQuang.User;
import ModelQuang.Volunteer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class DAO extends DBContext {
    
    public List<User> getAll() {
        List<User> list = new ArrayList<>();
        String sql = "select * from Users";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("user_id");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String passwordHash = rs.getString("password_hash");
                String fullname = rs.getString("fullname");
                String address = rs.getString("adrees"); // 'address' column as 'adrees' in your table
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String image = rs.getString("image");
                boolean passre = rs.getBoolean("password_reset_required");
                boolean veri = rs.getBoolean("verified");
                String role = rs.getString("role");

                list.add(new User(userId, username, email, passwordHash, passre, role, fullname, address, gender, phone, image, veri));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public void update(User user) {
        String sql = "UPDATE Users SET username = ?, email = ?, password_hash = ?, fullname = ?, adrees = ?, gender = ?, phone = ?, image = ?, role = ? WHERE user_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getUserName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPassword());
            st.setString(4, user.getFullname());
            st.setString(5, user.getAdrees());
            st.setString(6, user.getGender());
            st.setString(7, user.getPhone());
            st.setString(8, user.getImage());
            st.setString(9, user.getRole());
            st.setInt(10, user.getUserId());

            st.executeUpdate();
//            return rowsUpdated > 0; // Trả về true nếu có ít nhất một hàng được cập nhật
        } catch (SQLException e) {
            System.out.println(e);
//            return false; // Trả về false nếu có lỗi
        }
    }

    public User selectUserById(int id) {
        String sql = "select * from Users where user_id = ?";
        // Establish a connection
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            // Execute the query
            ResultSet rs = st.executeQuery();

            // Process the result set and retrieve user data
            if (rs.next()) {
                String username = rs.getString("username");
                String email = rs.getString("email");
                String passwordHash = rs.getString("password_hash");
                String fullname = rs.getString("fullname");
                String address = rs.getString("adrees");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String image = rs.getString("image");
                boolean passre = rs.getBoolean("password_reset_required");
                boolean veri = rs.getBoolean("verified");
                String role = rs.getString("role");

                User user = new User(id, username, email, passwordHash, passre, role, fullname, address, gender, phone, image, veri);
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

//    public List<Notification> getAllNotic() {
//        List<Notification> list = new ArrayList<>();
//        String sql = "select * from Notification";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Notification notification = new Notification();
//                notification.setNotificationId(rs.getInt("notification_id"));
//                notification.setMessage(rs.getString("message"));
//                notification.setRead(rs.getBoolean("is_read"));
//                notification.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
//
//                // You may need to set the user if you want to include user data
//                // notification.setUser(rs.getInt("user_id")); // Assuming you set this in your model
//                list.add(notification);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//    }

   
//    public List<Campaign> getAllCampaigns() {
//    List<Campaign> list = new ArrayList<>();
//    String sql = "SELECT * FROM Campaigns";  // Truy vấn lấy tất cả các chiến dịch
//    try {
//        PreparedStatement st = connection.prepareStatement(sql);
//        ResultSet rs = st.executeQuery();
//        while (rs.next()) {
//            Campaign campaign = new Campaign();
//            
//            // Lấy dữ liệu từ ResultSet và gán vào đối tượng Campaign
//            campaign.setCampaignId(rs.getInt("campaign_id"));
//            campaign.setOrganizationId(rs.getInt("organization_id"));
//            campaign.setCampaignName(rs.getString("campaign_name"));
//            campaign.setImage(rs.getString("image"));
//            campaign.setLocationId(rs.getObject("location_id") != null ? rs.getInt("location_id") : null);  // Có thể null
//            campaign.setDescription(rs.getString("description"));
//            campaign.setStartDate(rs.getDate("startDate"));
//            campaign.setEndDate(rs.getDate("endDate"));
//            campaign.setActive(rs.getBoolean("is_active"));
//            campaign.setCreatedAt(rs.getTimestamp("created_at"));  // Sử dụng Timestamp nếu cần thời gian chính xác
//
//            list.add(campaign);  // Thêm chiến dịch vào danh sách
//        }
//    } catch (SQLException e) {
//        System.out.println(e);
//    }
//    return list;  // Trả về danh sách các chiến dịch
//}



    public static void main(String[] args) {
        DAO d = new DAO();
        List<User> volunteers = new ArrayList<>();
        for (User volunteer : d.getAll()) {
            if (volunteer.getRole().equals("volunteer")) {
                volunteers.add(volunteer);
            }
        }
        System.out.println(volunteers.size());
    }
}
