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
public class VerificationTokens {
    private int id_token;
    private int user_id;
    private String token;
    private Date createdAt;

    public VerificationTokens() {
    }

    public VerificationTokens(int id_token, int user_id, String token, Date createdAt) {
        this.id_token = id_token;
        this.user_id = user_id;
        this.token = token;
        this.createdAt = createdAt;
    }

    public int getId_token() {
        return id_token;
    }

    public void setId_token(int id_token) {
        this.id_token = id_token;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    
}
