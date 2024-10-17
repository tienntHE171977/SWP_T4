/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.*;
/**
 *
 * @author FPT
 */
public class Staff {
//    SELECT TOP (1000) [staff_id]
//      ,[user_id]
//      ,[role]
//      ,[status]
//      ,[approval_date]
//      ,[first_password]
//      ,[created_at]
//      ,[updated_at]
//  FROM [Volunteerisms77].[dbo].[Staff]
    private int staff_id;
    private int user_id;
    private String role;
    private String status;
    private Date approval_date;
    private String first_password;
    private Date created_at;
    private Date updated_at;

    public Staff() {
    }

    public Staff(int staff_id, int user_id, String role, String status, Date approval_date, String first_password, Date created_at, Date updated_at) {
        this.staff_id = staff_id;
        this.user_id = user_id;
        this.role = role;
        this.status = status;
        this.approval_date = approval_date;
        this.first_password = first_password;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
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

    public Date getApproval_date() {
        return approval_date;
    }

    public void setApproval_date(Date approval_date) {
        this.approval_date = approval_date;
    }

    public String getFirst_password() {
        return first_password;
    }

    public void setFirst_password(String first_password) {
        this.first_password = first_password;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }
    
}
