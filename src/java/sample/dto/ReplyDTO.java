/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dto;

import java.util.Date;

/**
 *
 * @author DELL
 */
public class ReplyDTO {
    
    private int userID;
    private String userName;
    private String avatar; 
    private int questionID;
    private String replyDetail;
    private Date date;
    public String defaultImage = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8bwlD9_T78ny8Bd1c0lAjGolcKIsCq6xG5E6Dzs9jFVtYIvS_UI3QVAIPbcPT-hHpCMU&usqp=CAU";

    public ReplyDTO() {
    }

    public ReplyDTO(int userID, String userName, String avatar, int questionID, String replyDetail, Date date) {
        this.userID = userID;
        this.userName = userName;
        this.avatar = avatar;
        this.questionID = questionID;
        this.replyDetail = replyDetail;
        this.date = date;
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

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public String getReplyDetail() {
        return replyDetail;
    }

    public void setReplyDetail(String replyDetail) {
        this.replyDetail = replyDetail;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDefaultImage() {
        return defaultImage;
    }

    public void setDefaultImage(String defaultImage) {
        this.defaultImage = defaultImage;
    }

   
    
    
}
