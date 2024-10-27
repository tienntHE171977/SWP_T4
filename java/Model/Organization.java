/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import java.time.LocalDate;
import java.time.LocalDateTime;
/**
 *
 * @author Admin
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
    private LocalDateTime approvalDate;
    private LocalDate establishmentTime;
    private String organizationStatus;

    // Constructor
    
    public Organization() {
    }

    public Organization(int organizationId, String name, String website, String description, String image, String phone, String email, int createdBy, int staffId, LocalDateTime approvalDate, LocalDate establishmentTime, String organizationStatus) {
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

    public LocalDateTime getApprovalDate() {
        return approvalDate;
    }

    public void setApprovalDate(LocalDateTime approvalDate) {
        this.approvalDate = approvalDate;
    }

    public LocalDate getEstablishmentTime() {
        return establishmentTime;
    }

    public void setEstablishmentTime(LocalDate establishmentTime) {
        this.establishmentTime = establishmentTime;
    }

    public String getOrganizationStatus() {
        return organizationStatus;
    }

    public void setOrganizationStatus(String organizationStatus) {
        this.organizationStatus = organizationStatus;
    }
    
    @Override
    public String toString() {
        return "Organization{" +
                "organizationId=" + organizationId +
                ", name='" + name + '\'' +
                ", website='" + website + '\'' +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", createdBy=" + createdBy +
                ", staffId=" + staffId +
                ", approvalDate=" + approvalDate +
                ", establishmentTime=" + establishmentTime +
                ", organizationStatus='" + organizationStatus + '\'' +
                '}';
    }
}
