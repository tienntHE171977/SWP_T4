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
public class Contact {
//    SELECT TOP (1000) [contact_id]
//      ,[name]
//      ,[email]
//      ,[subject]
//      ,[message]
//      ,[status]
//      ,[created_at]
//      ,[assigned_staff_id]
//  FROM [Volunteerisms77].[dbo].[Contact]
    private int contact_id;
    private String name;
    private String email;
    private String subject;
    private String message;
    private String status;
    private Date created_at;
    private int assigned_staff_id;

    public Contact() {
    }

    public Contact(int contact_id, String name, String email, String subject, String message, String status, Date created_at, int assigned_staff_id) {
        this.contact_id = contact_id;
        this.name = name;
        this.email = email;
        this.subject = subject;
        this.message = message;
        this.status = status;
        this.created_at = created_at;
        this.assigned_staff_id = assigned_staff_id;
    }

    public int getContact_id() {
        return contact_id;
    }

    public void setContact_id(int contact_id) {
        this.contact_id = contact_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public int getAssigned_staff_id() {
        return assigned_staff_id;
    }

    public void setAssigned_staff_id(int assigned_staff_id) {
        this.assigned_staff_id = assigned_staff_id;
    }
    
}
