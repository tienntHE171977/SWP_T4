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
public class CampaignMembers {
    private int memberID;
    private String memberName;
    private String memberJob;
    private Date joinedDate;
    private String status;
    
    public CampaignMembers(){
        
    }

    public CampaignMembers(int memberID, String memberName, String memberJob, Date joinedDate, String status) {
        this.memberID = memberID;
        this.memberName = memberName;
        this.memberJob = memberJob;
        this.joinedDate = joinedDate;
        this.status = status;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getMemberJob() {
        return memberJob;
    }

    public void setMemberJob(String memberJob) {
        this.memberJob = memberJob;
    }

    public Date getJoinedDate() {
        return joinedDate;
    }

    public void setJoinedDate(Date joinedDate) {
        this.joinedDate = joinedDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "CampaignMembers{" + "memberID=" + memberID + ", memberName=" + memberName + ", memberJob=" + memberJob + ", joinedDate=" + joinedDate + ", status=" + status + '}';
    }
    
    
    
    
}
