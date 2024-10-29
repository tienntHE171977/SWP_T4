/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author admin
 */
public class Volunteer {
    private int volunteerId;
    private int userId;
    private Date createdAt;

    // Constructor không tham số

    public Volunteer() {
    }
   

    // Constructor đầy đủ tham số

    public Volunteer(int volunteerId, int userId, Date createdAt) {
        this.volunteerId = volunteerId;
        this.userId = userId;
        this.createdAt = createdAt;
    }
    

    // Getter và Setter cho các thuộc tính
    public int getVolunteerId() {
        return volunteerId;
    }

    public void setVolunteerId(int volunteerId) {
        this.volunteerId = volunteerId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

}
