<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="sample.dto.UserDTO"%>
<!doctype html>
<html lang="vi">

    <head>
        <title>Edit User Page</title>
        <!-- Required meta tags -->
        <meta charset="utf-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- GG Font -->
        <link as="font" crossorigin
              href="https://assets.oneweb.mercedes-benz.com/plugin/workbench/fonts/1.4.0/WOFF2/MBCorpoATitleCond-Regular-Web.woff2"
              rel="preload" type="font/woff2" />
        <link as="font" crossorigin
              href="https://assets.oneweb.mercedes-benz.com/plugin/workbench/fonts/1.4.0/WOFF2/MBCorpoSText-Regular-Web.woff2"
              rel="preload" type="font/woff2" />

        <!-- Font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
              integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous" />
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <!-- Animation css -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <link rel="stylesheet" href="./lib/WOW-master/css/libs/animate.css" />

        <link rel="stylesheet" href="./CSS/editProfile.css">
    </head>

    <body>
        <div id="blur" class="blur">
        </div>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleName().equals("US")) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <div class="header">
            <div class="header_container container">
                <div class="header__logo">
                    <a href="home.jsp"><img src="./img/F Event.png" alt=""></a>
                </div>
                <div class="header__nav">
                    <div class="action">
                        <a href="profile.jsp">
                            <img src="<%= loginUser.getUrlAvatar()%>" alt="">
                            <span><%= loginUser.getEmail()%></span>
                        </a>
                    </div>

                    <div class="notification">
                        <a href="#"><i class="fa fa-bell"></i></a>
                    </div>

                    <div id="navbars" class="navbar">
                        <div class="Bar__fa">
                            <a id="btn_nav">
                                <i class="fa fa-bars"></i>
                            </a>
                        </div>

                        <div id="menu" class="bar__child">
                            <div class="child">
                                <ul>
                                    <li><i class="fa fa-user"></i><a href="profile.jsp">Profile</a></li>
                                    <li><i class="fa fa-sign-out-alt"></i><a href="MainController?action=Logout">Logout</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="section">
            <div class="container">
                <form action="MainController">
                <div class="box">
                    <h4>Edit profile</h4>
                    <div class="editprofile">
                        <div class="picture">
                            <!-- sửa -->
                            <div class="Form">
                                <div class="grid">
                                    <div class="form-element">
                                        <input type="file" id="file-1" name="urlAvatar" accept="image/*" />
                                        <label for="file-1" id="file-1-preview">
                                            <img src="<%=loginUser.getUrlAvatar()%>" alt="" />
                                            <div>
                                                <span>+</span>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="profile">
                            <div class="info">
                                <label for="userID"></label>
                                <input type="hidden" name="userID" value="<%= loginUser.getUserID()%>" placeholder="User ID">
                            </div>
                            <div class="info">
                                <label for="role Name"></label>
                                <input type="hidden" name="roleName" value="<%= loginUser.getRoleName()%>" placeholder="Role Name">
                            </div>
                            <div class="info">
                                <label for="Email"></label>
                                <input type="hidden" name="userEmail" value="<%= loginUser.getEmail()%>" placeholder="Role Name">
                            </div>
                            <div class="info">
                                <label for="name">Name</label>
                                <input type="text" name="userName" value="<%= loginUser.getUserName()%>" placeholder="Name">
                            </div>
                            <div class="info">
                                <label for="phone">Phone</label>
                                <input type="text" name="phone" value="<%= loginUser.getPhone()%>"  placeholder="Phone">
                            </div>
                            <div class="info">
                                <label for="Address">Address</label>
                                <input type="text" name="address" value="<%= loginUser.getAddress()%>" placeholder="Address">
                            </div>
                            <div class="info">
                                <label for="Password">Password</label>
                                <input type="password" name="password" value="<%= loginUser.getPassword()%>" placeholder="Password">
                            </div>
                        </div>
                    </div>
                    <div class="btn">
                        <button><a href="profile.jsp">Cancel</a></button>
                        <button type="submit" name="action" value="Edit">OK</button>
                    </div>
                </div>
            </form>
            </div>
        </div>              





        <div class="footer">
            <div class="container">
                <div class="list">
                    <div class="item">
                        <p>SE1620 - SWP391 Project by Team 4</p>
                    </div>
                    <div class="item">
                        <p>© 2022 FPT Event Management </p>
                    </div>
                </div>
            </div>
        </div>


        <!-- Optional JavaScript -->
        <script src="./editProfile.js"></script>
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    </body>

</html>