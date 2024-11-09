/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelQuang;
import model.User;
import java.util.Date;

/**
 *
 * @author admin
 */
public class Volunteer {

    private int volunteerId;
    private User userId;
    private String status;
    private Date createdAt;

    // Constructor không tham số
    public Volunteer() {
    }

    // Constructor đầy đủ tham số

    public Volunteer(int volunteerId, User userId, String status, Date createdAt) {
        this.volunteerId = volunteerId;
        this.userId = userId;
        this.status = status;
        this.createdAt = createdAt;
    }
    

    // Getter và Setter cho các thuộc tính
    public int getVolunteerId() {
        return volunteerId;
    }

    public void setVolunteerId(int volunteerId) {
        this.volunteerId = volunteerId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

}
