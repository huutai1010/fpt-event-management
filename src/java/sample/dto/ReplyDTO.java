/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dto;

/**
 *
 * @author DELL
 */
public class ReplyDTO {
    
    private int userID;
    private int questionID;
    private String replyDetail;

    public ReplyDTO() {
    }

    public ReplyDTO(int userID, int questionID, String replyDetail) {
        this.userID = userID;
        this.questionID = questionID;
        this.replyDetail = replyDetail;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
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
    
    
}
