package ModelQuang;

import java.sql.Timestamp;

public class Campaign {
    private int campaignId;
     private String campaignName;
    private Project projectId;
    private String address;
    private String description;
    private String job;
    private String status;
    private Timestamp createdAt;

    public Campaign() {
    }

    public Campaign(int campaignId, String campaignName, Project projectId, String address, String description, String job, String status, Timestamp createdAt) {
        this.campaignId = campaignId;
        this.campaignName = campaignName;
        this.projectId = projectId;
        this.address = address;
        this.description = description;
        this.job = job;
        this.status = status;
        this.createdAt = createdAt;
    }

    
  

    

    // Getters và Setters
    public int getCampaignId() {
        return campaignId;
    }

    public void setCampaignId(int campaignId) {
        this.campaignId = campaignId;
    }

    public String getCampaignName() {
        return campaignName;
    }

    public void setCampaignName(String campaignName) {
        this.campaignName = campaignName;
    }
    
    public Project getProjectId() {
        return projectId;
    }

    public void setProjectId(Project projectId) {
        this.projectId = projectId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }
    
   

    public void setDescription(String description) {
        this.description = description;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
