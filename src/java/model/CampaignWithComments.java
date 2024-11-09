/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;


/**
 *
 * @author admin
 */
public class CampaignWithComments {
    private Campaign campaign;
    private List<CampaignComment> comments;
    public CampaignWithComments(){
        
    }

    public CampaignWithComments(Campaign campaign, List<CampaignComment> comments) {
        this.campaign = campaign;
        this.comments = comments;
    }

    public Campaign getCampaign() {
        return campaign;
    }

    public void setCampaign(Campaign campaign) {
        this.campaign = campaign;
    }

    public List<CampaignComment> getComments() {
        return comments;
    }

    public void setComments(List<CampaignComment> comments) {
        this.comments = comments;
    }

   
    
}
