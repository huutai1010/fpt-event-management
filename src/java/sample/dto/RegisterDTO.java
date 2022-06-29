/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dto;

/**
 *
 * @author DELL
 */
public class RegisterDTO {
    private int registerID;
    private int userID;
    private int eventID;
    private int registerStatus;

    public RegisterDTO() {
    }

    public RegisterDTO(int registerID, int userID, int eventID, int registerStatus) {
        this.registerID = registerID;
        this.userID = userID;
        this.eventID = eventID;
        this.registerStatus = registerStatus;
    }

    public int getRegisterID() {
        return registerID;
    }

    public void setRegisterID(int registerID) {
        this.registerID = registerID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getEventID() {
        return eventID;
    }

    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    public int getRegisterStatus() {
        return registerStatus;
    }

    public void setRegisterStatus(int registerStatus) {
        this.registerStatus = registerStatus;
    }
    
    
}
