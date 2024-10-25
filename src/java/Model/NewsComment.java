/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class NewsComment {
    private int ncommentID;
    private String comment;
    private String userName;
    private String status;
   public NewsComment(){
       
   }

    public NewsComment(int ncommentID, String comment, String userName, String status) {
        this.ncommentID = ncommentID;
        this.comment = comment;
        this.userName = userName;
        this.status = status;
    }

    public int getNcommentID() {
        return ncommentID;
    }

    public void setNcommentID(int ncommentID) {
        this.ncommentID = ncommentID;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "NewsComment{" + "ncommentID=" + ncommentID + ", comment=" + comment + ", userName=" + userName + ", status=" + status + '}';
    }

    

    
   
    
}
