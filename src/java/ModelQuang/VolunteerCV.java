package ModelQuang;

import java.util.Date;
import model.User;
public class VolunteerCV {

    private int cvId;
    private User userid;
    private String description;
    private String skillDescription;
    private Date createdAt;
    private String cvImage;
    private String experience;
    private String education;

    // Constructor

    public VolunteerCV() {
    }

    public VolunteerCV(int cvId, User userid, String description, String skillDescription, Date createdAt, String cvImage, String experience, String education) {
        this.cvId = cvId;
        this.userid = userid;
        this.description = description;
        this.skillDescription = skillDescription;
        this.createdAt = createdAt;
        this.cvImage = cvImage;
        this.experience = experience;
        this.education = education;
    }


    // Getters and Setters
    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }

    public User getUserid() {
        return userid;
    }

    public void setUserid(User userid) {
        this.userid = userid;
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

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getCvImage() {
        return cvImage;
    }

    public void setCvImage(String cvImage) {
        this.cvImage = cvImage;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

   

}
