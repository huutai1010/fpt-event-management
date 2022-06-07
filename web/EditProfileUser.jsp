<%-- 
    Document   : EditProfileUser
    Created on : Jun 7, 2022, 8:52:13 AM
    Author     : Acer
--%>

<%@page import="sample.dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile Page</title>
    </head>
    <body>
        <h1 style="text-align: center; color: red">Edit Profile User</h1>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleName().equals("US")) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <form action="MainController">
            Email<input type="email" name="userEmail" value="<%= loginUser.getEmail() %>" required="" /></br>
            User Name<input  type="text" name="userName" value="<%= loginUser.getUserName() %> " required="" /></br>
            Url Avatar<input type="text" name="urlAvatar" value="<%= loginUser.getUrlAvatar() %>" required="" /> </br>          
            <input class="form-element is-submit" type="submit" name="action" value="editProfile">
            <input class="form-element is-submit" type="reset"  value="Reset">      
        </form>
    </body>
</html>
