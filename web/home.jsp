<%-- 
    Document   : home
    Created on : May 30, 2022, 4:04:27 PM
    Author     : DELL
--%>

<%@page import="java.util.List"%>
<%@page import="sample.dto.EventDTO"%>
<%@page import="sample.dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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

        <!-- CSS -->
        <link rel="stylesheet" href="./CSS/home.css">
        <title>Home Page</title>
    </head>
    <body>
        <div class="wrapper">
            <!-- Lay attribute user -->
            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null || !loginUser.getRoleName().equals("US")) {
                    response.sendRedirect("login.jsp");
                    return;
                }
                String searchEve = request.getParameter("searchEve");
                if (searchEve == null) {
                    searchEve = "";
                }

            %>


            <header id="header" class="header">
                <div class="header_container container">
                    <div class="header_logo">
                        <a href="#"><img src="./img/F Event.png" alt="..."></a>
                    </div>
                    <div class="header_nav">
                        <a class="active" href="profile.jsp">
                            <img src="./img/Avatar_Chuong_San.jpg" alt="">

                            <span><%= loginUser.getEmail()%></span>
                        </a>
                        <a class="notification" href="#">
                            <i class="fa fa-bell"></i>
                        </a>
                        <div class="bars">
                            <a class="Bar__fa" href="#"><i class="fa fa-bars"></i>
                                <div class="bar__child">
                                    <a href=" profile.jsp "><span>Profile</span></a>
                                    <a href="MainController?action=Logout"><span>Logout</span></a>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </header>

            <section class="carousel">
                <div class="container">
                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="./img/mountains-1.jpg" alt="First slide">
                                <div class="carousel_info">
                                    <h1>Sự kiện nhạc cụ dân tộc FPTU</h1>
                                    <!-- timer -->
                                    <div class="carousel_timer">
                                        <p id="demo"></p>
                                    </div>
                                    <button class="btn btn-drak btn-carousel wow animate__animated animate__delay-1s"><a
                                            href="#">Register</a></button>

                                </div>
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="./img/finland.jpg" alt="Second slide">
                                <div class="carousel_info">
                                    <h1>Sự kiện nhạc cụ dân tộc FPTU</h1>
                                    <!-- timer -->
                                    <div class="carousel_timer">
                                        <p id="demo2"></p>
                                    </div>
                                    <button class="btn btn-drak btn-carousel wow animate__animated  animate__delay-1s"><a
                                            href="#">Register</a></button>

                                </div>
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="./img/3.jpg" alt="Third slide">
                                <div class="carousel_info">
                                    <h1>Sự kiện nhạc cụ dân tộc FPTU</h1>
                                    <!-- timer -->
                                    <div class="carousel_timer">
                                        <p id="demo3"></p>
                                    </div>
                                    <button class="btn btn-drak btn-carousel wow animate__animated animate__delay-1s"><a
                                            href="#">Register</a></button>
                                </div>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </section>

            <section class="portfolio">
                <header class="portfolio-header text-5m-center text-right text-lg-left">
                    <div class="container">
                        <h2>Event for you</h2>
                    </div>
                </header>
                <main class="portfolio-main">
                    <div class="container ">
                        <div>
                            <!--Search Event Of User-->
                            <div>
                                <form action="MainController" method="GET">
                                    <div class="input-group">                                                                    
                                        <input type="text" name="searchEve" value="<%= searchEve%>" placeholder="Search">
                                        <input type="submit" name="action" value="FindEvent"/>
                                    </div>  
                                </form>
                            </div>
                            <div>
                                <ul class="nav nav-pills mb-3 justify-content-center" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link active" data-toggle="pill" href="#all">Happening</a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link" data-toggle="pill" href="#Illustration">Coming</a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link" data-toggle="pill" href="#Photography">Completted</a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link" data-toggle="pill" href="#Webside">Followed</a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!--Category-->
                        <div class="tab-content">
                            <!--list-happening-->
                            <div class="tab-pane fade show active" id="all">
                                <!--start-list-->            
                                <div class="row">
                                    <%
                                        List<EventDTO> listEventInUser = (List<EventDTO>) session.getAttribute("LIST_EVENT_USER");
                                        if (listEventInUser != null) {
                                            if (listEventInUser.size() > 0) {
                                                for (EventDTO event : listEventInUser) {

                                    %>
                                    <div class="col-4">
                                        <div class="item shadow overflow-hidden mb-4">
                                            <img src="<%= event.getImage()%>" alt="g1" class="d-block w-100" />
                                            <div class="info p-3 text-center">
                                                <h3><%= event.getEventName()%></h3>
                                                <p>Start Time: <%= event.getStartTime()%> </p>
                                                <p>End Time: <%= event.getEndTime()%></p>
                                                <p>Fomality: <%= event.getFomality()%></p>
                                                <div class="content__detail">
                                                    <!--                                                    <div class="content__detail-icon">
                                                                                                            <i class="fa fa-heart"></i>
                                                                                                            <span>100 followed</span>
                                                                                                        </div>-->
                                                    <div class="content__detail-btn">
                                                        <a href="detailUser.jsp"><button class="btn btn-success">Detail</button></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%                                        }
                                            }
                                        }

                                    %>
                                </div>
                            </div> 
                            <!--end-list-->                                                

                            <!--up-coming-->
                            <div class="tab-pane fade" id="Illustration">
                                <!--start-time-->
                                <div class="row">                                                                   
                                    <div class="col-12 col-sm-6 col-md-4">
                                        <div class="item shadow overflow-hidden mb-4">
                                            <img src="./img/g1.jpg" alt="g1" class="d-block w-100" />
                                            <div class="info p-3 text-center">
                                                <h3>Ngày hội tiếng nhật FPT</h3>
                                                <p>Tuesday,28/6/2022 </p>
                                                <p>Câu lạc bộ Tiếng nhật FPT</p>
                                                <div class="content__detail">
                                                    <div class="content__detail-icon">
                                                        <i class="fa fa-heart"></i>
                                                        <span>100 followed</span>
                                                    </div>
                                                    <div class="content__detail-btn">
                                                        <a href="#"><button class="btn btn-success">Deltai</button></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                                                    
                                </div>

                            </div>
                            <!--end-list-->

                            <!--completted-->
                            <div class="tab-pane fade" id="Photography">
                                <!--start-list-->
                                <div class="row">
                                    <div class="col-12 col-sm-6 col-md-4">
                                        <div class="item shadow overflow-hidden mb-4">
                                            <img src="./img/g4.jpg" alt="g1" class="d-block w-100" />
                                            <div class="info p-3 text-center">
                                                <h3>Ngày hội tiếng nhật FPT</h3>
                                                <p>Tuesday,28/6/2022 </p>
                                                <p>Câu lạ bộ Tiếng nhật FPT</p>
                                                <div class="content__detail">
                                                    <div class="content__detail-icon">
                                                        <i class="fa fa-heart"></i>
                                                        <span>100 followed</span>
                                                    </div>
                                                    <div class="content__detail-btn">
                                                        <a href="#"><button class="btn btn-success">Deltai</button></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end-list-->
                             
                            <!--Followed-->
                            <div class="tab-pane fade" id="Webside">
                                <!--start-list-->
                                <div class="row">
                                    <div class="col-12 col-sm-6 col-md-4">
                                        <div class="item shadow overflow-hidden mb-4">
                                            <img src="./img/g6.jpg" alt="g1" class="d-block w-100" />
                                            <div class="info p-3 text-center">
                                                <h3>Ngày hội tiếng nhật FPT</h3>
                                                <p>Tuesday,28/6/2022 </p>
                                                <p>Câu lạ bộ Tiếng nhật FPT</p>
                                                <div class="content__detail">
                                                    <div class="content__detail-icon">
                                                        <i class="fa fa-heart"></i>
                                                        <span>100 followed</span>
                                                    </div>
                                                    <div class="content__detail-btn">
                                                        <a href="#"><button class="btn btn-success">Detail</button></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end-list-->

                            <!--ll-->
                        </div>
                    </div>
                </main>
            </section>

            <section id="contact" class="contact">
                <header>
                    <div class="container">
                        <h2>CONTACT US</h2>
                        <P>Thank you for your interest in our website.
                            Any questions please email or call us immediately for support</P>
                    </div>
                </header>
                <main>
                    <div class="container">
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.6100104981842!2d106.80769431474954!3d10.841127592277617!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgVFAuIEhDTQ!5e0!3m2!1svi!2s!4v1653822400724!5m2!1svi!2s"
                            width="800" height="400" style="border:0;" allowfullscreen="" loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade">
                        </iframe>
                        <div class="contact_content">
                            <div class="contact_content_item">
                                <i class="fa fa-phone"></i>
                                <p>Phone: +84 0909090909</p>
                            </div>
                            <div class="contact_content_item">
                                <i class="fa fa-envelope"></i>
                                <p>Mail: tungpvse140688@fpt.edu.vn</p>
                            </div>
                            <div class="contact_content_item">
                                <i class="fa fa-map-marker"></i>
                                <p>Địa chỉ: Trường Đại học FPT TP. HCM
                                    Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh
                                    700000</p>
                            </div>
                        </div>
                    </div>
                </main>
            </section>

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
                            <div class="item">
                                <img src="./img/0001.jpg" width="260" alt="">
                            </div>
                        </div>
                    </div>
                </main>
            </footer>

            <a class="btn" href="#header"><i class="icon fa fa-angle-up"></i></a>
        </div>

        <script src="./js/home.js"></script>
        <!-- Optional JavaScript -->
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
