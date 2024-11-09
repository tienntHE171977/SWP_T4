/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Location {
    private int locationID;
    private String city;
    private String province;
    private String country;
    public Location(){
        
    }

    public Location(int locationID, String city, String province, String country) {
        this.locationID = locationID;
        this.city = city;
        this.province = province;
        this.country = country;
    }

    public int getLocationID() {
        return locationID;
    }

    public void setLocationID(int locationID) {
        this.locationID = locationID;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    @Override
    public String toString() {
        return "Location{" + "locationID=" + locationID + ", city=" + city + ", province=" + province + ", country=" + country + '}';
    }
    
    
}
