/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author admin
 */
public class Campaign {
    private int campaignID;
    private String campaignName;
    private String projectName;
    private Date createDate;
    private String campaignLocation;
    private String description;
    private String campaignJob;
    private String status;
    
    public Campaign(){
        
    }

    public Campaign(int campaignID, String campaignName, String projectName, Date createDate, String campaignLocation, String description, String campaignJob, String status) {
        this.campaignID = campaignID;
        this.campaignName = campaignName;
        this.projectName = projectName;
        this.createDate = createDate;
        this.campaignLocation = campaignLocation;
        this.description = description;
        this.campaignJob = campaignJob;
        this.status = status;
    }

    public int getCampaignID() {
        return campaignID;
    }

    public void setCampaignID(int campaignID) {
        this.campaignID = campaignID;
    }

    public String getCampaignName() {
        return campaignName;
    }

    public void setCampaignName(String campaignName) {
        this.campaignName = campaignName;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCampaignLocation() {
        return campaignLocation;
    }

    public void setCampaignLocation(String campaignLocation) {
        this.campaignLocation = campaignLocation;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCampaignJob() {
        return campaignJob;
    }

    public void setCampaignJob(String campaignJob) {
        this.campaignJob = campaignJob;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Campaign{" + "campaignID=" + campaignID + ", campaignName=" + campaignName + ", projectName=" + projectName + ", createDate=" + createDate + ", campaignLocation=" + campaignLocation + ", description=" + description + ", campaignJob=" + campaignJob + ", status=" + status + '}';
    }

    

    
}
