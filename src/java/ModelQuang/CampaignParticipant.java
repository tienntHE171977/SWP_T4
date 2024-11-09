package ModelQuang;

import java.util.Date;

public class CampaignParticipant {
    private int participantId;
    private Campaign campaignId;
    private Volunteer volunteerId;
    private String job;
    private String participationType;
    private Date participationDate;

    // Constructor
    
    public CampaignParticipant() {
    }

    public CampaignParticipant(int participantId, Campaign campaignId, Volunteer volunteerId, String job, String participationType, Date participationDate) {
        this.participantId = participantId;
        this.campaignId = campaignId;
        this.volunteerId = volunteerId;
        this.job = job;
        this.participationType = participationType;
        this.participationDate = participationDate;
    }
    

    // Getters and Setters
    public int getParticipantId() {
        return participantId;
    }

    public void setParticipantId(int participantId) {
        this.participantId = participantId;
    }

    public Campaign getCampaignId() {
        return campaignId;
    }

    public void setCampaignId(Campaign campaignId) {
        this.campaignId = campaignId;
    }

    

    public Volunteer getVolunteerId() {
        return volunteerId;
    }

    public void setVolunteerId(Volunteer volunteerId) {
        this.volunteerId = volunteerId;
    }

    

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getParticipationType() {
        return participationType;
    }

    public void setParticipationType(String participationType) {
        this.participationType = participationType;
    }

    public Date getParticipationDate() {
        return participationDate;
    }

    public void setParticipationDate(Date participationDate) {
        this.participationDate = participationDate;
    }
}
