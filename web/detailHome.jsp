<%-- 
    Document   : DetailLogin
    Created on : Jun 13, 2022, 5:48:56 PM
    Author     : DELL
--%>

<%@page import="sample.dao.FollowDAO"%>
<%@page import="sample.dao.RegisterDAO"%>
<%@page import="sample.dto.CommentDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="sample.dao.CommentDAO"%>
<%@page import="sample.dto.UserDTO"%>
<%@page import="sample.dto.EventDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home Detail Page</title>
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
        <link rel="stylesheet" href="CSS/DetailHome.css">
    </head>
    <body>
        <%
            EventDTO event = (EventDTO) request.getAttribute("DETAIL_EVENT");
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            RegisterDAO registerDAO = new RegisterDAO();
            FollowDAO followDAO = new FollowDAO();

        %>
        <%  String messageRegister = (String) request.getAttribute("MESSAGE_REGISTER");
            if (messageRegister == null) {
                messageRegister = "";
            }
            String messageFllow = (String) request.getAttribute("MESSAGE_FOLLOW");
            if (messageFllow == null) {
                messageFllow = "";
            }

        %>
        <div id="blur" class="blur">

        </div>
        <div class="wrapper">
            <header class="header">
                <div class="header_container container">
                    <div class="header__logo">
                        <a href="home.jsp"><img src="./img/F Event.png" alt=""></a>
                    </div>
                    <div class="header__nav">
                        <div class="action">
                            <a href="#">
                                <img src="<%=loginUser.getUrlAvatar()%>" alt="">
                                <span><%=loginUser.getUserName()%></span>
                            </a>
                        </div>
                        <div class="event_register">
                            <div class="check" id="check">
                                <a style="margin-right: 40px;
                                   margin-left: 20px;
                                   font-size: 30px;
                                   color: #000;" href="MainController?action=ShowRegistered&userID=<%= loginUser.getUserID()%>">
                                    <i class="fa fa-clipboard-check"></i>
                                </a>
                            </div>
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
            </header>

            <main>
                <section class="background">
                    <div class="background_img">
                        <%
                            String backgroundImage = "";
                        %>
                        <img src="<%=event.getImage() != null ? event.getImage() : backgroundImage%>" alt="...">
                    </div>
                </section>

                <section class="event">
                    <div class="container">
                        <div class="event_content">
                            <div class="event_timer">
                                <div class="calendar">
                                    <p id="monthNames" class="month">Tháng 6</p>
                                    <p id="date" class="date">8</p>
                                    <p id="dayNames" class="day">Thứ 4</p>
                                </div>
                            </div>

                            <div class="event_info">
                                <h2><%=event.getEventName()%></h2>
                                <div class="info">
                                    <div class="info_date">
                                        <p>
                                            <i class="fa fa-clock"></i>
                                            <%=event.getStartTime().toString()%> - <%=event.getEndTime().toString()%>
                                        </p>
                                    </div>
                                    <div class="info_address">
                                        <p>
                                            <i class="fa fa-map-marker-alt"></i>
                                            <%=event.getLocationName()%>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="choose">
                                <%
                                    if (messageRegister.equals("Register successfully") || registerDAO.isEventRegisterExistentActive(loginUser.getUserID(), event.getEventID())) {

                                %>
                                <a href="MainController?action=UnRegister&eventID=<%= event.getEventID()%>&userID=<%= loginUser.getUserID()%>&image=<%= event.getImage()%>&categoryName=<%= event.getCategoryName()%>
                                   &locationName=<%= event.getLocationName()%>&startTime=<%= event.getStartTime()%>&endTime=<%= event.getEndTime()%>&numberOfAttendees=<%= event.getNumberOfAttendees()%>&formality=<%= event.getFormality()%>
                                   &ticketPrice=<%= event.getTicketPrice()%>&eventDetail=<%= event.getEventDetail()%>&eventName=<%= event.getEventName()%>" style="text-decoration: none"><button class="btn btn-success" name="action" value="UnRegister">UnRegister</button></a>
                                <%
                                } else {
                                %>
                                <a href="MainController?action=Register&eventID=<%= event.getEventID()%>&userID=<%= loginUser.getUserID()%>&image=<%= event.getImage()%>&categoryName=<%= event.getCategoryName()%>
                                   &locationName=<%= event.getLocationName()%>&startTime=<%= event.getStartTime()%>&endTime=<%= event.getEndTime()%>&numberOfAttendees=<%= event.getNumberOfAttendees()%>&formality=<%= event.getFormality()%>
                                   &ticketPrice=<%= event.getTicketPrice()%>&eventDetail=<%= event.getEventDetail()%>&eventName=<%= event.getEventName()%>" style="text-decoration: none"><button class="btn btn-success" name="action" value="Register" ><%= event.getTicketPrice() == 0 ? "Register" : "Buy Ticket"%></button></a>
                                    <%
                                        }
                                    %>
                                    <%-- Start flow --%>
                                    <%
                                        if (messageFllow.equals("Follow Successfully") || followDAO.isEventRegisterExistentActive(loginUser.getUserID(), event.getEventID())) {
                                    %>
                                <a href="MainController?action=UnFollow&eventID=<%= event.getEventID()%>&userID=<%= loginUser.getUserID()%>&image=<%= event.getImage()%>&categoryName=<%= event.getCategoryName()%>
                                   &locationName=<%= event.getLocationName()%>&startTime=<%= event.getStartTime()%>&endTime=<%= event.getEndTime()%>&numberOfAttendees=<%= event.getNumberOfAttendees()%>&formality=<%= event.getFormality()%>
                                   &ticketPrice=<%= event.getTicketPrice()%>&eventDetail=<%= event.getEventDetail()%>&eventName=<%= event.getEventName()%>" style="text-decoration: none"><button class="btn btn-primary" name="action" value="UnFollow">Un Follow</button></a>
                                <%
                                } else {
                                %>

                                <a href="MainController?action=Follow&eventID=<%= event.getEventID()%>&userID=<%= loginUser.getUserID()%>&image=<%= event.getImage()%>&categoryName=<%= event.getCategoryName()%>
                                   &locationName=<%= event.getLocationName()%>&startTime=<%= event.getStartTime()%>&endTime=<%= event.getEndTime()%>&numberOfAttendees=<%= event.getNumberOfAttendees()%>&formality=<%= event.getFormality()%>
                                   &ticketPrice=<%= event.getTicketPrice()%>&eventDetail=<%= event.getEventDetail()%>&eventName=<%= event.getEventName()%>" style="text-decoration: none"><button class="btn btn-primary" name="action" value="Follow">Follow</button></a>
                                <%
                                    }
                                %>
                                <p></p>
                            </div>

                        </div>
                    </div>
                </section>

                <section class="nav">
                    <div class="container">
                        <nav class="nav">
                            <a class="nav-link" href="#introduce">Giới thiệu</a>
                            <a class="nav-link" href="#comment">Bình luận</a>
                            <a class="nav-link" href="MainController?action=QuestionList">Q/A</a>
                        </nav>
                    </div>
                </section>

                <section id="introduce" class="introduce">
                    <div class="container">
                        <div class="intro">
                            <h3>Giới thiệu</h3>
                        </div>
                        <div class="intro_content">
                            <!--<div class="content-right">
                                <img src="./img/g1.jpg" alt="...">
                                <p><%=event.getEventName()%> </p>
                            </div>-->
                            <div class="content-left">
                                <h3>Thông tin chung</h3>

                                <p class="param">
                                    <%=event.getEventDetail()%>
                                </p>
                                <p>Địa điểm diễn ra sự kiện</p>
                                <ul>
                                    <li><%=event.getLocationName()%></li>

                                </ul>
                                <p>Thơi gian tổ chức</p>
                                <ul>
                                    <li>10/6/2022</li>
                                    <li>08:00 AM - 11:00 AM</li>
                                </ul>
                                <p>Giảng viên tham dự</p>
                                <ul>
                                    <li>Nguyễn Thế Hoàng</li>
                                </ul>
                                <p>Người tổ chức</p>
                                <ul>
                                    <li>Câu lạc bộ nhạc cụ</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </section>

                <section id="comment" class="comment">
                    <div class="container">
                        <div class="comment_head">
                            <h3>Bình luận</h3>
                        </div>






                        <!--start container_comment-->
                        <div class="container_comment">


                            <%
                                CommentDAO commentDAO = new CommentDAO();
                                List<CommentDTO> listComments = commentDAO.getListComments(event.getEventID());
                                System.out.println("SIZE LIST COMMENTS = " + listComments.size());
                                for (int i = 0; i < listComments.size(); i++) {
                                    CommentDTO comment = listComments.get(i);
                            %>
                            <div class="comment_container opened" id="first_comment">
                                <div class="comment_card">
                                    <div class="comment_title">
                                        <a href="#">
                                            <% String defaultAvatar = "./img/default.png";%>
                                            <img src="<%=comment.getAvatar() == null ? defaultAvatar : comment.getAvatar()%>" alt=""/>
                                            <span><%=comment.getUserName()%></span>
                                        </a>
                                        <p>
                                            <%=comment.getCommentDetail()%>
                                        </p>
                                    </div>                                  
                                </div>
                            </div>


                            <%
                                }
                            %>





                        </div>
                        <!--end container_comment-->
                        <!--comment-->
                        <div class="comment-text bg-line px-5 pt-2">
                            <form action="MainController">
                                <div class="d-flex flex-row align-items-start">
                                    <img src="<%=loginUser.getUrlAvatar()%>" alt="" class="rounded-circle" width="45">
                                    <input class="form-control ml-1 shadow-none textarea" name="commentDetail"/>
                                </div>
                                <div class="mt-2 text-right">
                                    <input type="hidden" name="action" value="PublishComment"/>
                                    <input type="hidden" name="userID" value="<%=loginUser.getUserID()%>">
                                    <input type="hidden" name="eventID" value="<%=event.getEventID()%>">


                                    <input type="hidden" name="categoryName" value="<%=event.getCategoryName()%>"/>
                                    <input type="hidden" name="locationName" value="<%=event.getLocationName()%>"/>
                                    <input type="hidden" name="eventName" value="<%=event.getEventName()%>"/>
                                    <input type="hidden" name="eventDetail" value="<%=event.getEventDetail()%>"/>
                                    <input type="hidden" name="image" value="<%=event.getImage()%>"/>
                                    <input type="hidden" name="startTime" value="<%=event.getStartTime()%>"/>
                                    <input type="hidden" name="endTime" value="<%=event.getEndTime()%>"/>
                                    <input type="hidden" name="numberOfAttendees" value="<%=event.getNumberOfAttendees()%>"/>
                                    <input type="hidden" name="formality" value="<%=event.getFormality()%>"/>
                                    <input type="hidden" name="ticketPrice" value="<%=event.getTicketPrice()%>"/>



                                    <input class="btn btn-success btn-sm shadow-none" type="submit" value="Đăng"/>
                                </div>
                            </form>
                        </div>



                    </div>
                    <!--end div container-->
                </section>
            </main>



            <footer class="footer">
                <main>
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
                </main>
            </footer>
        </div>
        <!-- Optional JavaScript -->
        <script src="./index.js"></script>
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
