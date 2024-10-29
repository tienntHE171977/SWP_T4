package Model;

import java.util.Date;

public class Staff {
    private int staffId;
    private int userId;
    private String role;
    private String status;
    private java.util.Date approvalDate;
    private String firstPassword;
    private java.util.Date createdAt;
    private java.util.Date updatedAt;

    public Staff() {
    }

    public Staff(int staffId, int userId, String role, String status, Date approvalDate, String firstPassword, Date createdAt, Date updatedAt) {
        this.staffId = staffId;
        this.userId = userId;
        this.role = role;
        this.status = status;
        this.approvalDate = approvalDate;
        this.firstPassword = firstPassword;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
    
    // Getters and Setters
    
    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public java.util.Date getApprovalDate() {
        return approvalDate;
    }

    public void setApprovalDate(java.util.Date approvalDate) {
        this.approvalDate = approvalDate;
    }

    public String getFirstPassword() {
        return firstPassword;
    }

    public void setFirstPassword(String firstPassword) {
        this.firstPassword = firstPassword;
    }

    public java.util.Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(java.util.Date createdAt) {
        this.createdAt = createdAt;
    }

    public java.util.Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(java.util.Date updatedAt) {
        this.updatedAt = updatedAt;
    }
}
