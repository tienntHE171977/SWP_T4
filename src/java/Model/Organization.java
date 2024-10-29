package Model;

import java.util.Date;

public class Organization {
    private int organizationId;
    private String name;
    private String website;
    private String description;
    private String image;
    private String Phone;
    private String Email;
    private User createdBy;
    private int staffId;
    private Date approvalDate;
    private Date establishmentTime;
    private String organizationStatus;
    
    
    // Getters and Setters
    // ...

    public Organization() {
    }

    public Organization(int organizationId, String name, String website, String description, String image, String Phone, String Email, User createdBy, int staffId, Date approvalDate, Date establishmentTime, String organizationStatus) {
        this.organizationId = organizationId;
        this.name = name;
        this.website = website;
        this.description = description;
        this.image = image;
        this.Phone = Phone;
        this.Email = Email;
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
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public User getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(User createdBy) {
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


