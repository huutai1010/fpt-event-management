/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dto;

/**
 *
 * @author Acer
 */
public class UserDTO {

    private int userID;
    private String email;
    private String password;
    private String userName;
    private String urlAvatar;
    private String roleName;
    private int status;

    public UserDTO() {
        this.userID = 0;
        this.userName = "";
        this.password = "";
        this.email = "";
        this.roleName = "";
        this.status = 0;
        this.urlAvatar = "";

    }

    public UserDTO(int userID, String email, String password, String userName, String urlAvatar, String roleName, int status) {
        this.userID = userID;
        this.email = email;
        this.password = password;
        this.userName = userName;
        this.urlAvatar = urlAvatar;
        this.roleName = roleName;
        this.status = status;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUrlAvatar() {
        return urlAvatar;
    }

    public void setUrlAvatar(String urlAvatar) {
        this.urlAvatar = urlAvatar;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "userID=" + userID + ", email=" + email + ", password=" + password + ", userName=" + userName + ", urlAvatar=" + urlAvatar + ", roleName=" + roleName + ", status=" + status + '}';
    }

    
}
