/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dto;

import java.util.Date;

/**
 *
 * @author maihuutai
 */
public class EventDTO {
    private int eventID;
    private String categoryName;
    private String locationName;
    private String eventName;
    private String eventDetail;
    private String image;
    private Date startTime;
    private Date endTime;
    private int numberOfAttendees;
    private String formality;
    private float ticketPrice;

    public EventDTO() {
    }

    public EventDTO(int eventID, String categoryName, String locationName, String eventName, String eventDetail, String image, Date startTime, Date endTime, int numberOfAttendees, String formality, float ticketPrice) {
        this.eventID = eventID;
        this.categoryName = categoryName;
        this.locationName = locationName;
        this.eventName = eventName;
        this.eventDetail = eventDetail;
        this.image = image;
        this.startTime = startTime;
        this.endTime = endTime;
        this.numberOfAttendees = numberOfAttendees;
        this.formality = formality;
        this.ticketPrice = ticketPrice;
    }

    public int getEventID() {
        return eventID;
    }

    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getLocationName() {
        return locationName;
    }

    public void setLocationName(String locationName) {
        this.locationName = locationName;
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

    public int getNumberOfAttendees() {
        return numberOfAttendees;
    }

    public void setNumberOfAttendees(int numberOfAttendees) {
        this.numberOfAttendees = numberOfAttendees;
    }

    public String getFormality() {
        return formality;
    }

    public void setFormality(String formality) {
        this.formality = formality;
    }

    public float getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(float ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    
    
    
    
}
