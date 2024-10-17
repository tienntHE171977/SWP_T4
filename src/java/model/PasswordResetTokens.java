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
public class PasswordResetTokens {
    private int tokenId;
    private int userId;
    private String token;
    private Timestamp expiryDate;

    public PasswordResetTokens() {
    }

    public PasswordResetTokens(int tokenId, int userId, String token, Timestamp expiryDate) {
        this.tokenId = tokenId;
        this.userId = userId;
        this.token = token;
        this.expiryDate = expiryDate;
    }

    public int getTokenId() {
        return tokenId;
    }

    public void setTokenId(int tokenId) {
        this.tokenId = tokenId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Timestamp getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Timestamp expiryDate) {
        this.expiryDate = expiryDate;
    }

    
}
