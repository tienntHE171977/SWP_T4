package Model;

import java.util.Date;

public class ProjectEvent {
    private int eventId;
    private int projectId;
    private String itemName;
    private int quantityNeeded;
    private int quantityProvided;
    private String unit;

    // Constructors, getters, and setters
    // ...

    public ProjectEvent() {
    }

    public ProjectEvent(int eventId, int projectId, String itemName, int quantityNeeded, int quantityProvided, String unit) {
        this.eventId = eventId;
        this.projectId = projectId;
        this.itemName = itemName;
        this.quantityNeeded = quantityNeeded;
        this.quantityProvided = quantityProvided;
        this.unit = unit;
    }
    

    public int getEventId() { return eventId; }
    public void setEventId(int eventId) { this.eventId = eventId; }
    public int getProjectId() { return projectId; }
    public void setProjectId(int projectId) { this.projectId = projectId; }
    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }
    public int getQuantityNeeded() { return quantityNeeded; }
    public void setQuantityNeeded(int quantityNeeded) { this.quantityNeeded = quantityNeeded; }
    public int getQuantityProvided() { return quantityProvided; }
    public void setQuantityProvided(int quantityProvided) { this.quantityProvided = quantityProvided; }
    public String getUnit() { return unit; }
    public void setUnit(String unit) { this.unit = unit; }
}