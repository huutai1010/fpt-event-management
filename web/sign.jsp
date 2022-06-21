<%-- 
    Document   : sign.jsp
    Created on : May 29, 2022, 11:53:32 PM
    Author     : DELL
--%>


<%@page import="sample.error.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/sign.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
        <title>Sign Page</title>
    </head>
    <body>
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
        
            String message_sign = (String) request.getAttribute("MESSAGE_SIGN");
            if (message_sign == null) {
                message_sign = "";
            }
        
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
            
            String eventID = (String) request.getParameter("eventID");
            if (eventID == null) {
            eventID = "";
            }
        %>
        <div>
            <h2 style="color: red"><%= error%></h2>
            <h2 style="color: red"><%= message_sign%></h2>
            <h2>WellCome to our Sign in/up Form</h2>
            <div class="container" id="container">
                <div class="form-container sign-up-container">
                    <form action="MainController" method="POST">
                        <h1>Create Account</h1>
                        <div class="social-container">
                            <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>                      
                        </div>
                        <span>or use your email for registration</span>

                        <input type="email" placeholder="Email" name="userEmail" required="" />
                        <%= userError.getEmailError()%>
                        <input type="password" placeholder="Password" name="password" required="" />                  
                        <input type="password" placeholder="Confirm" name="confirm" required=""/>
                        <%= userError.getConfirmError()%></br>
                        <button type="submit" name="action" value="signUp">Sign Up</button> </br>
                        <button type="reset"  value="Reset">Reset</button>
                        <div>
                            <a href="login.jsp" style="color: orangered">Back to home</a>
                        </div>
                    </form>

                </div>

                <div class="form-container sign-in-container">
                    <form action="MainController" method="POST" >
                        <h1>Sign in</h1>

                        <span>or use your account</span>
                        <input type="email" placeholder="Email" name="userEmail" required=""/>
                        <input type="password" placeholder="Password" name="password" required=""/>
                        <input type="hidden" name="eventID" value="<%=eventID%>"/> <!--SEND eventID  to MainController-->
                        <a href="#">Forgot your password?</a>
                        <button type="submit" name="action" value="Login">Sign In</button>
                        <div class="social-container">                    
                            <a href="MainController?action=LoginGoogleAccount&eventID=<%=eventID%>" class="social"><i class="fab fa-google"></i></a>
                        </div>
                        <div>
                            <a href="login.jsp" style="color: orange">Back to home</a>
                        </div>


                    </form>
                </div>
                <div class="overlay-container">
                    <div class="overlay">
                        <div class="overlay-panel overlay-left">
                            <h1>Welcome Back!</h1>
                            <p>To keep connected with us please login with your personal info</p>
                            <button class="ghost" id="signIn">Sign In</button>
                        </div>
                        <div class="overlay-panel overlay-right">
                            <h1>Hello, Friend!</h1>
                            <p>Enter your personal details and start journey with us</p>
                            <button class="ghost" id="signUp">Sign Up</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <p>
                Created with <i class="fa fa-heart"></i> by
                <a target="_blank" href="https://florin-pop.com">Florin Pop</a>
                - Read how I created this and how you can join the challenge
                <a target="_blank" href="https://www.florin-pop.com/blog/2019/03/double-slider-sign-in-up-form/">here</a>.
            </p>
        </footer>
        <script src="js/sign.js"></script>
    </body>
</html>