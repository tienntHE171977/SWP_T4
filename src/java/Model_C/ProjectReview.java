
package Model_C;

import java.util.Date;

public class ProjectReview {
    private int reviewId;
    private int userId;
    private int projectId;
    private int rating;
    private String comment;
    private Date createdAt;

    // Constructors, getters, and setters

    public ProjectReview() {}

    public ProjectReview(int reviewId, int userId, int projectId, int rating, String comment, Date createdAt) {
        this.reviewId = reviewId;
        this.userId = userId;
        this.projectId = projectId;
        this.rating = rating;
        this.comment = comment;
        this.createdAt = createdAt;
    }
    
    
    // ...
    public int getReviewId() {
        return reviewId;
    }
    public void setReviewId(int reviewId) { this.reviewId = reviewId; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public int getProjectId() { return projectId; }
    public void setProjectId(int projectId) { this.projectId = projectId; }
    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }
    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
}