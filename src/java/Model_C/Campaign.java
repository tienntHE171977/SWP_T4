package Model_C;

import java.util.Date;

public class Campaign {
    private int campaignId;
    private int projectId;
    private int locationId;
    private String description;
    private String job;
    private boolean isActive;
    private Date createdAt;

    // Constructors, getters, and setters
    // ...

    public Campaign() {
    }

    public Campaign(int campaignId, int projectId, int locationId, String description, String job, boolean isActive, Date createdAt) {
        this.campaignId = campaignId;
        this.projectId = projectId;
        this.locationId = locationId;
        this.description = description;
        this.job = job;
        this.isActive = isActive;
        this.createdAt = createdAt;
    }
    

    public int getCampaignId() { return campaignId; }
    public void setCampaignId(int campaignId) { this.campaignId = campaignId; }
    public int getProjectId() { return projectId; }
    public void setProjectId(int projectId) { this.projectId = projectId; }
    public int getLocationId() { return locationId; }
    public void setLocationId(int locationId) { this.locationId = locationId; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getJob() { return job; }
    public void setJob(String job) { this.job = job; }
    public boolean isActive() { return isActive; }
    public void setActive(boolean active) { isActive = active; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
}
