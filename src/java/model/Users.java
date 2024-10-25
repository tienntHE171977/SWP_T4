/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author FPT
 */
public class Users {
    private int userId;
    private String userName;
    private String email;
    private String password;
    private boolean password_reset_required;
    private String role;
    private String fullname;
    private String adrees;
    private String gender;
    private String phone;
    private String image;
    
    private boolean verified;
    

    public Users() {
    }
 
    public Users( String userName, String email, String password, boolean password_reset_required, String role, String fullname, String adrees, String gender, String phone, String image,  boolean verified) {
        
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.password_reset_required = password_reset_required;
        this.role = role;
        this.fullname = fullname;
        this.adrees = adrees;
        this.gender = gender;
        this.phone = phone;
        this.image = image;
        
        this.verified = verified;
    }
    public Users(int userId, String userName, String email, String password, boolean password_reset_required, String role, String fullname, String adrees, String gender, String phone, String image,  boolean verified) {
        this.userId = userId;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.password_reset_required = password_reset_required;
        this.role = role;
        this.fullname = fullname;
        this.adrees = adrees;
        this.gender = gender;
        this.phone = phone;
        this.image = image;
        
        this.verified = verified;
    }

    public Users(int aInt) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isPassword_reset_required() {
        return password_reset_required;
    }

    public void setPassword_reset_required(boolean password_reset_required) {
        this.password_reset_required = password_reset_required;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAdrees() {
        return adrees;
    }

    public void setAdrees(String adrees) {
        this.adrees = adrees;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    

    public boolean isVerified() {
        return verified;
    }

    public void setVerified(boolean verified) {
        this.verified = verified;
    }

    @Override
    public String toString() {
        return "Users{" + "userId=" + userId + ", userName=" + userName + ", email=" + email + ", password=" + password + ", password_reset_required=" + password_reset_required + ", role=" + role + ", fullname=" + fullname + ", adrees=" + adrees + ", gender=" + gender + ", phone=" + phone + ", image=" + image + ", verified=" + verified + '}';
    }
   
}
