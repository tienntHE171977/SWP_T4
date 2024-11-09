/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL_Staff;

import DBContext.DBContext;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Contact;
import model.Notification;

/**
 *
 * @author FPT
 */
public class NotificationDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;
    private String SELECT_NOTIFICATIONS_BY_USER_ID = "SELECT * FROM Notifications WHERE user_id = ? AND is_read = 0 ORDER BY created_at DESC";


    public List<Notification> selectNotificationsByUserId(int userId) {
        List<Notification> notifications = new ArrayList<>();
        try {
            ps = connection.prepareStatement(SELECT_NOTIFICATIONS_BY_USER_ID);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("notification_id");
                String type = rs.getString("type");
                String message = rs.getString("message");
                Timestamp createdAt = rs.getTimestamp("created_at");
                notifications.add(new Notification(id, userId, type, message, createdAt));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notifications;
    }
    public void insertNotification(int userId, String type, String message) {
        String query = "INSERT INTO Notifications (user_id, type, message, is_read, created_at) VALUES (?, ?, ?, 0, CURRENT_TIMESTAMP)";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setString(2, type);
            ps.setString(3, message);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public static void main(String[] args) {
        // Tạo instance của ContactDAO và NotificationDAO
        ContactDAO contactDAO = new ContactDAO();
        NotificationDAO notificationDAO = new NotificationDAO();

        // Tạo một đối tượng Contact để test
        Contact newContact = new Contact();
        newContact.setName("Jane Doe");
        newContact.setEmail("janedoe@example.com");
        newContact.setSubject("New Contact Test");
        newContact.setMessage("This is a test message for new contact.");

        // Thêm liên hệ mới
        contactDAO.addContact(newContact);
        System.out.println("New contact added successfully!");

        // Giả sử bạn có một phương thức để tạo thông báo khi có liên hệ mới
        int staffId = 14; // ID của nhân viên nhận thông báo
        String notificationMessage = "You have a new contact request from " + newContact.getName();
        createNewContactNotification(staffId, notificationMessage);

        // Kiểm tra thông báo cho nhân viên
        List<Notification> notifications = notificationDAO.selectNotificationsByUserId(staffId);
        if (!notifications.isEmpty()) {
            System.out.println("Notifications for staff ID: " + staffId);
            for (Notification notification : notifications) {
                System.out.println("ID: " + notification.getId());
                System.out.println("Type: " + notification.getType());
                System.out.println("Message: " + notification.getMessage());
                System.out.println("Created At: " + notification.getCreatedAt());
                System.out.println("---------------------------");
            }
        } else {
            System.out.println("No new notifications for staff ID: " + staffId);
        }
    }
    private static void createNewContactNotification(int staffId, String message) {
        NotificationDAO notificationDAO = new NotificationDAO();
        String type = "New Contact";
        // Tạo thông báo mới
        notificationDAO.insertNotification(staffId, type, message);
        System.out.println("Notification created for staff ID: " + staffId);
    }
}
