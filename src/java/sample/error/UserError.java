/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.error;

/**
 *
 * @author Acer
 */
public class UserError {

    private String emailError;
    private String passwordError;
    private String confirmError;

    public UserError() {
        this.emailError = "";
        this.passwordError = "";
        this.confirmError = "";
    }

    public UserError(String emailError, String passwordError, String confirmError) {
        this.emailError = emailError;
        this.passwordError = passwordError;
        this.confirmError = confirmError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }
    
    
}
