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
    private String posterImage;
    private String backgroundImage;
    private Date date;
    private int numberOfAttendees;
    private String formality;
    private float ticketPrice;
    private int status;

    public EventDTO() {
    }

    public EventDTO(int eventID, String categoryName, String locationName, String eventName, String eventDetail, String posterImage, String backgroundImage, Date date, int numberOfAttendees, String formality, float ticketPrice, int status) {
        this.eventID = eventID;
        this.categoryName = categoryName;
        this.locationName = locationName;
        this.eventName = eventName;
        this.eventDetail = eventDetail;
        this.posterImage = posterImage;
        this.backgroundImage = backgroundImage;
        this.date = date;
        this.numberOfAttendees = numberOfAttendees;
        this.formality = formality;
        this.ticketPrice = ticketPrice;
        this.status = status;
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getPosterImage() {
        return posterImage;
    }

    public void setPosterImage(String posterImage) {
        this.posterImage = posterImage;
    }

    public String getBackgroundImage() {
        return backgroundImage;
    }

    public void setBackgroundImage(String backgroundImage) {
        this.backgroundImage = backgroundImage;
    }
    
    
}
