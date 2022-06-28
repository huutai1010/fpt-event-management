/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dto;

/**
 *
 * @author DELL
 */
public class QuestionDTO {

    private int eventID;
    private int questionID;
    private int userID;
    private String userName;
    private String avatar;
    private String questionDetail;

    public QuestionDTO() {
    }

    public QuestionDTO(int eventID, int questionID, int userID, String userName, String avatar, String questionDetail) {
        this.eventID = eventID;
        this.questionID = questionID;
        this.userID = userID;
        this.userName = userName;
        this.avatar = avatar;
        this.questionDetail = questionDetail;
    }

    public int getEventID() {
        return eventID;
    }

    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getQuestionDetail() {
        return questionDetail;
    }

    public void setQuestionDetail(String questionDetail) {
        this.questionDetail = questionDetail;
    }

    

}