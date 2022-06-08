/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dto;

import java.util.Date;

/**
 *
 * @author Acer
 */
public class EventDTO {
    private String eventID;
    private int categoryID;
    private int locationID;
    private String eventName;
    private String eventDetail;
    private String image;
    private Date startTime;
    private Date endTime;
    private int numberOfSeats;
    private String fomality;
    private int status; 

    public EventDTO() {
    }

    public EventDTO(String eventID, int categoryID, int locationID, String eventName, String eventDetail, String image, Date startTime, Date endTime, int numberOfSeats, String fomality, int status) {
        this.eventID = eventID;
        this.categoryID = categoryID;
        this.locationID = locationID;
        this.eventName = eventName;
        this.eventDetail = eventDetail;
        this.image = image;
        this.startTime = startTime;
        this.endTime = endTime;
        this.numberOfSeats = numberOfSeats;
        this.fomality = fomality;
        this.status = status;
    }

    public String getEventID() {
        return eventID;
    }

    public void setEventID(String eventID) {
        this.eventID = eventID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getLocationID() {
        return locationID;
    }

    public void setLocationID(int locationID) {
        this.locationID = locationID;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getEventDetail() {
        return eventDetail;
    }

    public void setEventDetail(String eventDetail) {
        this.eventDetail = eventDetail;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public int getNumberOfSeats() {
        return numberOfSeats;
    }

    public void setNumberOfSeats(int numberOfSeats) {
        this.numberOfSeats = numberOfSeats;
    }

    public String getFomality() {
        return fomality;
    }

    public void setFomality(String fomality) {
        this.fomality = fomality;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "EventDTO{" + "eventID=" + eventID + ", categoryID=" + categoryID + ", locationID=" + locationID + ", eventName=" + eventName + ", eventDetail=" + eventDetail + ", image=" + image + ", startTime=" + startTime + ", endTime=" + endTime + ", numberOfSeats=" + numberOfSeats + ", fomality=" + fomality + ", status=" + status + '}';
    }
    
    
}
