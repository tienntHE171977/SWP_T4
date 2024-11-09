/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author pc
 */
public class User_1 {

    private int Id;
    private String userName;
    private String email;
    private String passWord;
    private String fullName;
    private String address;
    private String gender;
    private String phone;
    private String role;

    /**
     *
     * @param userName 
     * @param email
     * @param passWord
     * @param role
     */
    public User_1(String userName, String email, String passWord, String role) {
        this.userName = userName;
        this.email = email;
        this.passWord = passWord;
        this.role = role;
    }

    public User_1(int Id, String userName, String email, String passWord, String fullName, String address, String gender, String phone, String role) {
        this.Id = Id;
        this.userName = userName;
        this.email = email;
        this.passWord = passWord;
        this.fullName = fullName;
        this.address = address;
        this.gender = gender;
        this.phone = phone;
        this.role = role;
    }
    
        /**
     *
     * @param fullName
     * @param phone
     * @param address
     * @param gender
     * @param email
     */
   
    public User_1(String email, String fullName, String address, String gender, String phone) {
        this.email = email;
        this.fullName = fullName;
        this.address = address;
        this.gender = gender;
        this.phone = phone;
        
    }

    public User_1(int Id, String userName, String email, String passWord, String role) {
        this.Id = Id;
        this.userName = userName;
        this.email = email;
        this.passWord = passWord;
        this.role = role;
    }
    public User_1() {
    }

    

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
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

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" + "userName=" + userName + ", Email=" + email + ", passWord=" + passWord + ", role=" + role + '}';
    }

}
