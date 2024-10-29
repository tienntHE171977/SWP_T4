package Model;

public class VolunteerCV {
    private int cvId;
    private int volunteerId;
    private String description;
    private String skillDescription;
    private String createdAt;

    // Constructor
    public VolunteerCV(int cvId, int volunteerId, String description, String skillDescription, String createdAt) {
        this.cvId = cvId;
        this.volunteerId = volunteerId;
        this.description = description;
        this.skillDescription = skillDescription;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }

    public int getVolunteerId() {
        return volunteerId;
    }

    public void setVolunteerId(int volunteerId) {
        this.volunteerId = volunteerId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSkillDescription() {
        return skillDescription;
    }

    public void setSkillDescription(String skillDescription) {
        this.skillDescription = skillDescription;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

}
