/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class NewsCategories {
    private int ncategoriesID;
    private String ncategoryName;
    public NewsCategories(){
        
    }

    public NewsCategories(int ncategoriesID, String ncategoryName) {
        this.ncategoriesID = ncategoriesID;
        this.ncategoryName = ncategoryName;
    }

    public int getNcategoriesID() {
        return ncategoriesID;
    }

    public void setNcategoriesID(int ncategoriesID) {
        this.ncategoriesID = ncategoriesID;
    }

    public String getNcategoryName() {
        return ncategoryName;
    }

    public void setNcategoryName(String ncategoryName) {
        this.ncategoryName = ncategoryName;
    }

    @Override
    public String toString() {
        return "NewsCategories{" + "ncategoriesID=" + ncategoriesID + ", ncategoryName=" + ncategoryName + '}';
    }

    
    
}
