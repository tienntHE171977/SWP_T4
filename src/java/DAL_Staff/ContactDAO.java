package DAL_Staff;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Contact;

public class ContactDAO extends DBContext {
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Contact> getAllContacts() {
        List<Contact> contacts = new ArrayList<>();
        String query = "SELECT * FROM Contact ORDER BY created_at DESC";
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

    public static void main(String[] args) {
        // Tạo kết nối đến database
      
        
        
            // Đăng ký driver
           
            
            // Tạo instance của ContactDAO
            ContactDAO contactDAO = new ContactDAO();
            
            // Tạo một đối tượng Contact để test
            Contact testContact = new Contact();
            testContact.setName("John Doe");
            testContact.setEmail("johndoe@example.com");
            testContact.setSubject("Test Subject");
            testContact.setMessage("This is a test message.");
            
            // Gọi phương thức addContact
            contactDAO.addContact(testContact);
            
            System.out.println("Contact added successfully!");
            
            // Đóng kết nối
            
            
        
    }
}
