<%-- 
    Document   : Detail
    Created on : Jun 13, 2022, 5:47:13 PM
    Author     : DELL
--%>

<%@page import="java.util.List"%>
<%@page import="sample.dto.EventDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Detail Page</title>
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
        <link rel="stylesheet" href="CSS/Detail.css">
    </head>
    <body>
        <div id="blur" class="blur">
        </div>
        <%
            EventDTO event = (EventDTO) request.getAttribute("DETAIL_EVENT");

        %>

        <div class="wrapper">
            <header id="header" class="header">
                <div class="header_container container">
                    <div class="header_logo">
                        <a href="login.jsp"><img src="./img/F Event.png" alt="..."></a>
                    </div>
                    <!-- <div class="header_nav">
                        <a class="active" href="#">Home</a>
                        <a href="#about">About us</a>
                        <a href="#contact">Contact us</a>
                    </div> -->
                    <div class="header_icon">
                        <a href="sign.jsp">
                            <i class="fa fa-user">
                                <span>Login</span>
                            </i>
                        </a>
                    </div>

                </div>
            </header>

            <main>
                <section class="background">
                    <div class="background_img">
                        <img src="<%=event.getImage()%>" alt="...">
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
                                <button class="btn btn-success"><a href="sign.jsp"><%= event.getTicketPrice() == 0 ? "Register" : "Buy Ticket"%></a></button>
                                <button class="btn btn-primary">Follow</button>
                                <p>100 Follow</p>
                                <p></p>
                            </div>
                        </div>
                    </div>
                </section>
                <%
                    if (event != null) {

                %>
                <section class="nav">
                    <div class="container">
                        <nav class="nav">
                            <a class="nav-link" href="#introduce">Giới thiệu</a>
                            <a class="nav-link" href="#comment">Bình luận</a>
                            <a class="nav-link" href="#">Q/A</a>
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
                                <img src="<%= event.getImage()%>" alt="...">
                                <p><%= event.getEventName()%> </p>
                            </div>-->
                            <div class="content-left">
                                <h3>Thông tin chung</h3>

                                <p class="param">
                                    <%= event.getEventDetail()%>
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
                <%
                    }
                %>

                
                <section id="comment" class="comment">
                    <div class="container">
                        <div class="comment_head">
                            <h3>Bình luận</h3>
                        </div>
                        <div class="container_comment">
                            <div class="comment_container opened" >
                                <div class="comment_card">
                                    <div class="comment_title">
                                        <a href="#">
                                            <img src="./img/02-3.jpg" alt="">
                                            <span>Nguyễn Văn A</span>
                                        </a>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil modi ipsum
                                            doloremque
                                            earum illo maiores quo omnis. Maiores, repellat hic.
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="comment_container opened" >
                                <div class="comment_card">
                                    <div class="comment_title">
                                        <a href="#">
                                            <img src="./img/02-3.jpg" alt="">
                                            <span>Nguyễn Văn A</span>
                                        </a>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil modi ipsum
                                            doloremque
                                            earum illo maiores quo omnis. Maiores, repellat hic.
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="comment_container opened" >
                                <div class="comment_card">
                                    <div class="comment_title">
                                        <a href="#">
                                            <img src="./img/02-3.jpg" alt="">
                                            <span>Nguyễn Văn A</span>
                                        </a>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil modi ipsum
                                            doloremque
                                            earum illo maiores quo omnis. Maiores, repellat hic.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="comment-text bg-line px-5 pt-2">
                            <div class="d-flex flex-row align-items-start">
                                <img src="./img/02-3.jpg" alt="" class="rounded-circle" width="45">
                                <textarea class="form-control ml-1 shadow-none textarea"></textarea>
                            </div>
                            <div class="mt-2 text-right">
                                <button class="btn btn-success btn-sm shadow-none" type="button">Đăng</button>
                            </div>
                        </div>
                    </div>
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