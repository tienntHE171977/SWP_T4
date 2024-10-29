package Model;

import java.time.LocalDateTime;

public class News {

    private int newsId;
    private String title;
    private int categoryId;
    private String content;
    private String message;
    private int authorId;
    private String image;
    private String status;
    private String createdAt;

    public News() {
    }

    public News(int newsId, String title, int categoryId, String content, String message, int authorId, String image, String status, String createdAt) {
        this.newsId = newsId;
        this.title = title;
        this.categoryId = categoryId;
        this.content = content;
        this.message = message;
        this.authorId = authorId;
        this.image = image;
        this.status = status;
        this.createdAt = createdAt;
    }

    
 
    // Getters and Setters
    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

   
}
