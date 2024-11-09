package ModelQuang;

import java.util.Date;

public class Project {
    private int projectId;
    private String title;
    private String image;
    private String description;
    private Date startDate;
    private Date endDate;
    private String document;
    private String roleProject;
    private String status;
    private Organization createdByOrg;
    private java.util.Date createdAt;
    private int staffId;

    // Getters and Setters
    
    public Project() {
    }

    public Project(int projectId, String title, String image, String description, Date startDate, Date endDate, String document, String roleProject, String status, Organization createdByOrg, Date createdAt, int staffId) {
        this.projectId = projectId;
        this.title = title;
        this.image = image;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
        this.document = document;
        this.roleProject = roleProject;
        this.status = status;
        this.createdByOrg = createdByOrg;
        this.createdAt = createdAt;
        this.staffId = staffId;
    }

    
    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public java.util.Date getStartDate() {
        return startDate;
    }

    public void setStartDate(java.util.Date startDate) {
        this.startDate = startDate;
    }

    public java.util.Date getEndDate() {
        return endDate;
    }

    public void setEndDate(java.util.Date endDate) {
        this.endDate = endDate;
    }

    public String getDocument() {
        return document;
    }

    public void setDocument(String document) {
        this.document = document;
    }

    public String getRoleProject() {
        return roleProject;
    }

    public void setRoleProject(String roleProject) {
        this.roleProject = roleProject;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Organization getCreatedByOrg() {
        return createdByOrg;
    }

    public void setCreatedByOrg(Organization createdByOrg) {
        this.createdByOrg = createdByOrg;
    }

    

    public java.util.Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(java.util.Date createdAt) {
        this.createdAt = createdAt;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }
}
