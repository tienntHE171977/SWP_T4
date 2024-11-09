package DAL_Staff;

import DBContext.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Contact;

public class ContactDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Contact> getAllContacts(int page, int pageSize, String status) {
        List<Contact> contacts = new ArrayList<>();
        String query = "SELECT * FROM Contact";
        if (status != null && !status.isEmpty()) {
            query += " WHERE status = ?";
        }
        query += " ORDER BY created_at DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            ps = connection.prepareStatement(query);
            int paramIndex = 1;
            if (status != null && !status.isEmpty()) {
                ps.setString(paramIndex++, status);
            }
            ps.setInt(paramIndex++, (page - 1) * pageSize);
            ps.setInt(paramIndex, pageSize);
            rs = ps.executeQuery();

            while (rs.next()) {
                Contact contact = new Contact(
                        rs.getInt("contact_id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getString("status"),
                        rs.getDate("created_at"),
                        rs.getInt("assigned_staff_id")
                );
                contacts.add(contact);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contacts;
    }

    public int getTotalContacts(String status) {
        String query = "SELECT COUNT(*) FROM Contact";
        if (status != null && !status.isEmpty()) {
            query += " WHERE status = ?";
        }

        try {
            ps = connection.prepareStatement(query);
            if (status != null && !status.isEmpty()) {
                ps.setString(1, status);
            }
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public Contact getContactById(int id) {
        String query = "SELECT * FROM Contact WHERE contact_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Contact(
                        rs.getInt("contact_id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getString("status"),
                        rs.getDate("created_at"),
                        rs.getInt("assigned_staff_id")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void addContact(Contact contact) {
        String query = "INSERT INTO Contact (name, email, subject, message, status, created_at) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, contact.getName());
            ps.setString(2, contact.getEmail());
            ps.setString(3, contact.getSubject());
            ps.setString(4, contact.getMessage());
            ps.setString(5, "new"); // Giả sử trạng thái mặc định là "Pending"
            ps.setDate(6, new java.sql.Date(System.currentTimeMillis()));
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateContactStatus(int id, String status, int staffId) {
        String query = "UPDATE Contact SET status = ?, assigned_staff_id = ? WHERE contact_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, staffId);
            ps.setInt(3, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Contact> getContactsByStatus(String status, int page, int pageSize) {
        List<Contact> contacts = new ArrayList<>();
        String query = "SELECT * FROM Contact WHERE status = ? ORDER BY created_at DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, (page - 1) * pageSize);
            ps.setInt(3, pageSize);
            rs = ps.executeQuery();

            while (rs.next()) {
                Contact contact = new Contact(
                        rs.getInt("contact_id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getString("status"),
                        rs.getDate("created_at"),
                        rs.getInt("assigned_staff_id")
                );
                contacts.add(contact);
            }
        } catch (SQLException e) {

        }
        return contacts;
    }

    public int getTotalContactsByStatus(String status) {
        String query = "SELECT COUNT(*) FROM Contact WHERE status = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, status);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean deleteContact(int contactId) {
        String query = "DELETE FROM Contact WHERE contact_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, contactId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean assignContactToStaff(int contactId, int staffId) {
    String query = "UPDATE Contact SET assigned_staff_id = ?, status = 'in progress' WHERE contact_id = ?";
    try {
        ps = connection.prepareStatement(query);
        ps.setInt(1, staffId);
        ps.setInt(2, contactId);
        int affectedRows = ps.executeUpdate();
        return affectedRows > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
    
    public List<Contact> searchContactsByName(String name) {
    List<Contact> contacts = new ArrayList<>();
    String query = "SELECT * FROM Contact WHERE subject LIKE ? ORDER BY created_at DESC";

    try {
        ps = connection.prepareStatement(query);
        ps.setString(1, "%" + name + "%");
        rs = ps.executeQuery();

        while (rs.next()) {
            Contact contact = new Contact(
                    rs.getInt("contact_id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("subject"),
                    rs.getString("message"),
                    rs.getString("status"),
                    rs.getDate("created_at"),
                    rs.getInt("assigned_staff_id")
            );
            contacts.add(contact);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return contacts;
}



    public List<Contact> getUnassignedContacts() {
        List<Contact> contacts = new ArrayList<>();
        String query = "SELECT * FROM Contact WHERE assigned_staff_id IS NULL ORDER BY created_at DESC";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Contact contact = new Contact(
                        rs.getInt("contact_id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getString("status"),
                        rs.getDate("created_at"),
                        rs.getInt("assigned_staff_id")
                );
                contacts.add(contact);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contacts;
    }

    public static void main(String[] args) {
        // Tạo kết nối đến database

        // Đăng ký driver
        // Tạo instance của ContactDAO
        ContactDAO contactDAO = new ContactDAO();
//
//        // Tạo một đối tượng Contact để test
//        Contact testContact = new Contact();
//        testContact.setName("John Doe");
//        testContact.setEmail("johndoe@example.com");
//        testContact.setSubject("Test Subject");
//        testContact.setMessage("This is a test message.");
//
//        // Gọi phương thức addContact
//        contactDAO.addContact(testContact);
//
//        System.out.println("Contact added successfully!");
//
//        // Đóng kết nối


            // Test hàm assignContactToStaff
            int contactId = 1; // Thay đổi theo ID liên hệ thực tế trong database của bạn
            int staffId = 9; // Thay đổi theo ID nhân viên thực tế trong database của bạn
            int contactIdToDelete = 1; // Thay đổi ID này theo dữ liệu trong database của bạn
            
            // Gọi phương thức deleteContact
            boolean result = contactDAO.deleteContact(contactIdToDelete);
            
            // In kết quả
            if (result) {
                System.out.println("Contact with ID " + contactIdToDelete + " was successfully deleted.");
            } else {
                System.out.println("Failed to delete contact with ID " + contactIdToDelete + ".");
            }
//            boolean result = contactDAO.assignContactToStaff(contactId, staffId);
//
//            if (result) {
//                System.out.println("Gán liên hệ thành công!");
//            } else {
//                System.out.println("Gán liên hệ thất bại!");
//            }
    }
}
