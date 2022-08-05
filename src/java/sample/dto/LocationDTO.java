/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dto;

/**
 *
 * @author maihuutai
 */
public class LocationDTO {
    private String locationID;
    private String locationName;
    private int locationCapacity;

    public LocationDTO(String locationID, String locationName, int locationCapacity) {
        this.locationID = locationID;
        this.locationName = locationName;
        this.locationCapacity = locationCapacity;
    }

    public String getLocationID() {
        return locationID;
    }

    public void setLocationID(String locationID) {
        this.locationID = locationID;
    }

    public String getLocationName() {
        return locationName;
    }

    public void setLocationName(String locationName) {
        this.locationName = locationName;
    }

    public int getLocationCapacity() {
        return locationCapacity;
    }

    public void setLocationCapacity(int locationCapacity) {
        this.locationCapacity = locationCapacity;
    }
    
    
}
