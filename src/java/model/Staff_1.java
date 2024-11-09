/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author pc
 */
public class Staff_1 {
    
    private String fullname;
    private String approvalDate;
    private String adrees;
    private String phone;
    private String email;
    private String role;

    public Staff_1() {
    }

    
    public Staff_1(String fullname, String approvalDate, String address, String phone, String email, String role) {
        this.fullname = fullname;
        this.approvalDate = approvalDate;
        this.adrees = address;
        this.phone = phone;
        this.email = email;
        this.role = role;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getApprovalDate() {
        return approvalDate;
    }

    public void setApprovalDate(String approvalDate) {
        this.approvalDate = approvalDate;
    }

    public String getAddress() {
        return adrees;
    }

    public void setAddress(String address) {
        this.adrees = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    
}
