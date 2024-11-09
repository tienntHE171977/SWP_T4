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
public class Project {
    private int projectId;
    private String title;
    private String image;
    private String description;
    private Date startDate;
    private int staffId;
    private Date endDate;
    private String document;
    private String roleProject; // 'campaign' hoặc 'event'
    private String status; // 'pending', 'approved', 'rejected'
    private int createdByOrg;
    private Date createdAt;

    public Project() {
    }

    public Project(int projectId, String title, String image, String description, Date startDate, int staffId, Date endDate, String document, String roleProject, String status, int createdByOrg, Date createdAt) {
        this.projectId = projectId;
        this.title = title;
        this.image = image;
        this.description = description;
        this.startDate = startDate;
        this.staffId = staffId;
        this.endDate = endDate;
        this.document = document;
        this.roleProject = roleProject;
        this.status = status;
        this.createdByOrg = createdByOrg;
        this.createdAt = createdAt;
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

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
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

    public int getCreatedByOrg() {
        return createdByOrg;
    }

    public void setCreatedByOrg(int createdByOrg) {
        this.createdByOrg = createdByOrg;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    
}
