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
    private String userName;
    private String eventName;
    private String avatar;
    private String questionDetail;
    

    public QuestionDTO() {
    }

    public QuestionDTO(String userName, String eventName, String avatar, String questionDetail) {
        this.userName = userName;
        this.eventName = eventName;
        this.avatar = avatar;
        this.questionDetail = questionDetail;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
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
