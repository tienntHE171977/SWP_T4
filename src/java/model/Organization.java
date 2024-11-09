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
public class Organization {
    private int organizationId;
    private String name;
    private String website;
    private String description;
    private String image;
    private String phone;
    private String email;
    private int createdBy;
    private int staffId;
    private Date approvalDate;
    private Date establishmentTime;
    private String organizationStatus;

    public Organization() {
    }

    public Organization(int organizationId, String name, String website, String description, String image, String phone, String email, int createdBy, int staffId, Date approvalDate, Date establishmentTime, String organizationStatus) {
        this.organizationId = organizationId;
        this.name = name;
        this.website = website;
        this.description = description;
        this.image = image;
        this.phone = phone;
        this.email = email;
        this.createdBy = createdBy;
        this.staffId = staffId;
        this.approvalDate = approvalDate;
        this.establishmentTime = establishmentTime;
        this.organizationStatus = organizationStatus;
    }

    public int getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(int organizationId) {
        this.organizationId = organizationId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public Date getApprovalDate() {
        return approvalDate;
    }

    public void setApprovalDate(Date approvalDate) {
        this.approvalDate = approvalDate;
    }

    public Date getEstablishmentTime() {
        return establishmentTime;
    }

    public void setEstablishmentTime(Date establishmentTime) {
        this.establishmentTime = establishmentTime;
    }

    public String getOrganizationStatus() {
        return organizationStatus;
    }

    public void setOrganizationStatus(String organizationStatus) {
        this.organizationStatus = organizationStatus;
    }
    
}
