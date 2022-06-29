/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dto;

/**
 *
 * @author maihuutai
 */
public class CommentDTO {
    private String avatar;
    private String userName;
    private String commentDetail;

    public CommentDTO() {
    }

    public CommentDTO(String avatar, String userName, String commentDetail) {
        this.avatar = avatar;
        this.userName = userName;
        this.commentDetail = commentDetail;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCommentDetail() {
        return commentDetail;
    }

    public void setCommentDetail(String commentDetail) {
        this.commentDetail = commentDetail;
    }
    
    
}
