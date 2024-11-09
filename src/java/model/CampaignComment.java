/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author admin
 */
public class CampaignComment {
    private int ccommentID;
    private String comment;
    private String userName;
    private Date date;
    
    public CampaignComment(){
        
    }

    public CampaignComment(int ccommentID, String comment, String userName, Date date) {
        this.ccommentID = ccommentID;
        this.comment = comment;
        this.userName = userName;
        this.date = date;
    }

    public int getCcommentID() {
        return ccommentID;
    }

    public void setCcommentID(int ccommentID) {
        this.ccommentID = ccommentID;
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "CampaignComment{" + "ccommentID=" + ccommentID + ", comment=" + comment + ", userName=" + userName + ", date=" + date + '}';
    }

   
    
}
