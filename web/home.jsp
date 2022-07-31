<%-- 
    Document   : login
    Created on : Jun 11, 2022, 12:51:19 AM
    Author     : DELL
--%>

<%@page import="sample.dao.FollowDAO"%>
<%@page import="sample.dto.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sample.dao.EventDAO"%>
<%@page import="sample.dto.EventDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>UserManagement</title>
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

    <!-- CSS -->
    <link rel="stylesheet" href="CSS/home.css">
    <body>
        <div id="blur" class="blur">    
        </div>
        <!-- Phần này là thiển thị thông tin đăng nhập -->
        <div class="wrapper">
            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null || !loginUser.getRoleName().equals("US")) {
                    response.sendRedirect("login.jsp");
                    return;
                }

            %>
            <header class="header">
                <div class="header_container container">
                    <div class="header__logo">
                        <a href="home.jsp"><img src="./img/F Event.png" alt=""></a>
                    </div>
                    <div class="header__nav">
                        <div class="action">
                            <a href="profile.jsp">
                                <img src="<%= loginUser.getUrlAvatar()%>" alt="">
                                <span><%= loginUser.getUserName() == null ? loginUser.getEmail() : loginUser.getUserName()%></span>
                            </a>
                        </div>

                        <div class="event_register">
                            <div class="check" id="check">
                                <a href="MainController?action=ShowRegistered&userID=<%= loginUser.getUserID() %>">
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



            <!-- Phần dưới đây thì copy y chang bên login.jsp  -->


            <%
                EventDAO eventDAO = new EventDAO();

                List<EventDTO> listAllEvents = eventDAO.getAllEvents();
                List<EventDTO> listHappeningEvents = new ArrayList();
                List<EventDTO> listComingEvents = new ArrayList();
                List<EventDTO> listTookPlaceEvents = new ArrayList();

                for (EventDTO checkEvent : listAllEvents) {
                    int check = eventDAO.checkTimeOfEvent(checkEvent);
                    if (check == -1) {
                        listTookPlaceEvents.add(checkEvent);
                    } else if (check == 0) {
                        listHappeningEvents.add(checkEvent);
                    } else if (check == 1) {
                        listComingEvents.add(checkEvent);
                    }
                }
            %>
            <!-- Start Carousel-->
            <section class="carousel">
                <div class="container">
                    <div
                        id="carouselExampleControls"
                        class="carousel slide"
                        data-ride="carousel"
                        >

                        <ol class="carousel-indicators">
                            <%
                                for (int i = 0; i < listComingEvents.size(); i++) {
                            %>
                            <li
                                data-target="#carouselExampleIndicators"
                                data-slide-to="0"
                                class="active"
                                ></li>
                                <%
                                    }
                                %>
                        </ol>
                        <!--Start Carousel Picture-->
                        <!-- Put Event Will Happen in here-->
                        <div class="carousel-inner">
                            <%
                                for (EventDTO comingEvent1 : listComingEvents) {
                                    if (listComingEvents.indexOf(comingEvent1) == 0) {
                            %>
                            <div class="carousel-item active">
                                <a href="MainController?action=ShowDetailEventHome&eventID=<%= comingEvent1.getEventID()%>" ><img class="" src="<%=comingEvent1.getPosterImage()%>" alt="First slide" /></a>
                            </div>   
                            <%
                            } else {
                            %>
                            <div class="carousel-item">
                                <a href="MainController?action=ShowDetailEventHome&eventID=<%= comingEvent1.getEventID()%>"><img class="" src="<%=comingEvent1.getPosterImage()%>" alt="First slide" /></a>
                            </div>      
                            <%
                                    }
                                }
                            %>

                        </div>
                        <!-- End Carousel Picture -->

                        <!--Start Carousel Controll-->
                        <a
                            class="carousel-control-prev"
                            href="#carouselExampleControls"
                            role="button"
                            data-slide="prev"
                            >
                            <span
                                class="carousel-control-prev-icon"
                                aria-hidden="true"
                                ></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a
                            class="carousel-control-next"
                            href="#carouselExampleControls"
                            role="button"
                            data-slide="next"
                            >
                            <span
                                class="carousel-control-next-icon"
                                aria-hidden="true"
                                ></span>
                            <span class="sr-only">Next</span>
                        </a>
                        <!--End Carousel Controll (2 buttons Left And Right)-->
                    </div>
                </div>
            </section>
            <!-- End Carousel -->

            <!-- Search Event -->
            <%
                String error = (String) request.getAttribute("ERROR");
                if (error == null) {
                    error = "";
                }
                String searchKeyword = request.getParameter("searchKeyword");
                if (searchKeyword == null) {
                    searchKeyword = "";
                }

            %>
            <section class="portfolio">
                <header class="portfolio-header text-5m-center text-right text-lg-left">
                    <div class="container" contenteditable="true" spellcheck="false">
                        <h2>Event for you</h2>
                    </div>
                </header>
                <main class="portfolio-main">
                    <!-- Search -->
                    <div class="container">
                        <div class="nav">
                            <div class="nav_search">
                                <%-- Dong nay search o trang da login --%>
                                <form action="MainController" class="search-bar">
                                    <input type="text" name="searchKeyword" value="<%= searchKeyword%>" />                                   
                                    <button type="submit" name="action" value="SearchHome"><i class="fa fa-search"></i></button>
                                </form>
                            </div>
                            <div class="nav_btn">
                                <ul
                                    class="nav nav-pills mb-3 justify-content-center"
                                    role="tablist"
                                    >
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link active" data-toggle="pill" href="#all0">
                                            All
                                        </a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link" data-toggle="pill" href="#all">
                                            Happening
                                        </a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link" data-toggle="pill" href="#Illustration">
                                            Coming
                                        </a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link" data-toggle="pill" href="#Photography">
                                            Took place
                                        </a>
                                    </li>

                                    <%-- tab follow --%>                                  
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link" data-toggle="pill" href="#Webside">
                                            Followed
                                        </a>
                                    </li>                                  
                                </ul>
                            </div>
                        </div>



                        <!--Start Tab Content-->

                        <div class="tab-content">


                            <!---Start All Events Tab -->
                            <div class="tab-pane fade show active" id="all0">

                                <div class="row">
                                    <%
                                        List<EventDTO> listSearchEvents = (List<EventDTO>) request.getAttribute("LIST_SEARCH_EVENTS");
                                        if (listSearchEvents != null) {
                                            if (listSearchEvents.size() > 0) {
                                                for (EventDTO searchEvent : listSearchEvents) {

                                    %>
                                    <!--Start One Event-->
                                    <div class="col-12 col-sm-6 col-md-4">
                                        <div class="item shadow overflow-hidden mb-4">
                                            <a href="MainController?action=ShowDetailEventHome&eventID=<%= searchEvent.getEventID()%>" target="_blank">
                                                <img
                                                    src="<%=searchEvent.getPosterImage()%>"
                                                    alt="g1"
                                                    class="d-block w-100"
                                                    />
                                                <div class="info p-3 text-center">
                                                    <h3><%= searchEvent.getEventName()%></h3>
                                                    <p>Date: <%= searchEvent.getDate().toString()%></p>

                                                    <p>Location: <%= searchEvent.getLocationName()%></p>
                                                    <div class="content__detail">
                                                        <div class="content__detail-icon">
                                                            <i class="fa fa-heart"></i>
                                                            <span>100 followed</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <!--End One Event-->
                                    <%
                                            }
                                        }
                                    } else {
                                        for (EventDTO event : listAllEvents) {
                                    %>
                                    <div class="col-12 col-sm-6 col-md-4">
                                        <div class="item shadow overflow-hidden mb-4">
                                            <a href="MainController?action=ShowDetailEventHome&eventID=<%= event.getEventID()%>" target="_blank">
                                                <img
                                                    src="<%=event.getPosterImage()%>"
                                                    alt="g1"
                                                    class="d-block w-100"
                                                    />
                                                <div class="info p-3 text-center">
                                                    <h3><%=event.getEventName()%></h3>
                                                    <p>Date: <%=event.getDate().toString()%></p>

                                                    <p>Location: <%=event.getLocationName()%></p>
                                                    <div class="content__detail">
                                                        <div class="content__detail-icon">
                                                            <i class="fa fa-heart"></i>
                                                            <span>100 followed</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>

                                    <%
                                            }

                                        }
                                    %>
                                </div>
                            </div>

                            <!-- End All Events Tab -->


                            <!--Start Tab 2-->

                            <div class="tab-pane fade" id="all">
                                <!--Start List Of Event-->
                                <div class="row">
                                    <%
                                        for (EventDTO happeningEvent : listHappeningEvents) {
                                    %>
                                    <!--Start One Event-->
                                    <div class="col-12 col-sm-6 col-md-4">
                                        <div class="item shadow overflow-hidden mb-4">
                                            <a href="MainController?action=ShowDetailEventHome&eventID=<%= happeningEvent.getEventID()%>" target="_blank">
                                                <img
                                                    src="<%=happeningEvent.getPosterImage()%>"
                                                    alt="g1"
                                                    class="d-block w-100"
                                                    />
                                                <div class="info p-3 text-center">
                                                    <h3><%=happeningEvent.getEventName()%></h3>
                                                    <p>Date: <%=happeningEvent.getDate().toString()%></p>
                                                    <p>Location: <%=happeningEvent.getLocationName()%></p>
                                                    <div class="content__detail">
                                                        <div class="content__detail-icon">
                                                            <i class="fa fa-heart"></i>
                                                            <span>100 followed</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <!--End One Event-->
                                    <%
                                        }
                                    %>
                                </div>
                                <!-- End List Of Event -->
                            </div>

                            <!--End Tab 2-->

                            <!-- Start Tab 3-->
                            <div class="tab-pane fade" id="Illustration">
                                <div class="row">
                                    <%
                                        for (EventDTO comingEvent : listComingEvents) {
                                    %>
                                    <!--Start One Event-->
                                    <div class="col-12 col-sm-6 col-md-4">
                                        <div class="item shadow overflow-hidden mb-4">
                                            <a href="MainController?action=ShowDetailEventHome&eventID=<%= comingEvent.getEventID()%>" target="_blank">
                                                <img
                                                    src="<%=comingEvent.getPosterImage()%>"
                                                    alt="g1"
                                                    class="d-block w-100"
                                                    />
                                                <div class="info p-3 text-center">
                                                    <h3><%=comingEvent.getEventName()%></h3>
                                                    <p>Date: <%=comingEvent.getDate().toString()%></p>
                                                    <p>Location: <%=comingEvent.getLocationName()%></p>
                                                    <div class="content__detail">
                                                        <div class="content__detail-icon">
                                                            <i class="fa fa-heart"></i>
                                                            <span>100 followed</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                    <!-- End One Event-->
                                </div>
                            </div>
                            <!-- End Tab 3-->
                            <!-- Start Tab 4-->
                            <div class="tab-pane fade" id="Photography">
                                <div class="row">
                                    <%
                                        for (EventDTO tookPlaceEvent : listTookPlaceEvents) {
                                    %>
                                    <div class="col-12 col-sm-6 col-md-4">
                                        <div class="item shadow overflow-hidden mb-4">
                                            <a href="MainController?action=ShowDetailEventHome&eventID=<%= tookPlaceEvent.getEventID()%>" target="_blank">
                                                <img
                                                    src="<%=tookPlaceEvent.getPosterImage()%>"
                                                    alt="g1"
                                                    class="d-block w-100"
                                                    />
                                                <div class="info p-3 text-center">
                                                    <h3><%=tookPlaceEvent.getEventName()%></h3>
                                                    <p>Date: <%=tookPlaceEvent.getDate().toString()%></p>
                                                    <p>Location: <%=tookPlaceEvent.getLocationName()%></p>
                                                    <div class="content__detail">
                                                        <div class="content__detail-icon">
                                                            <i class="fa fa-heart"></i>
                                                            <span>100 followed</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                            <!-- End Tab 4-->


                            <%-- Fllow --%>
                            <!-- Start Tab 5-->
                            <div class="tab-pane fade" id="Webside">
                                <div class="row">
                                    <%
                                        FollowDAO followDAO = new FollowDAO();
                                        List<EventDTO> listFollowedEvents = followDAO.getListFollowedEvents(loginUser.getUserID());
                                        if (listFollowedEvents != null) {
                                            if (listFollowedEvents.size() > 0) {
                                                for (EventDTO followedEvent : listFollowedEvents) {
                                    %>

                                    <div class="col-12 col-sm-6 col-md-4">
                                        <div class="item shadow overflow-hidden mb-4">
                                            <a href="MainController?action=ShowDetailEventHome&eventID=<%= followedEvent.getEventID()%>" target="_blank">
                                                <img
                                                    src="<%=followedEvent.getPosterImage()%>"
                                                    alt="g1"
                                                    class="d-block w-100"
                                                    />
                                                <div class="info p-3 text-center">
                                                    <h3><%=followedEvent.getEventName()%></h3>
                                                    <p>Date: <%=followedEvent.getDate().toString()%></p>
                                                    <p>Location: <%=followedEvent.getLocationName()%></p>
                                                    <div class="content__detail">
                                                        <div class="content__detail-icon">
                                                            <i class="fa fa-heart"></i>
                                                            <span>100 followed</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>

                                    <%
                                                }
                                            }
                                        }
                                    %>

                                </div>
                            </div>
                            <!-- End Tab 5-->
                        </div>
                        <!--End Tab Content-->


                    </div>
                </main>
            </section>

            <div class="book">
                <span><i class="fa fa-book-open"></i></span>
            </div>
            <section id="about" class="about">
                <div class="container">
                    <div class="about_head">
                        <h2>About us</h2>
                    </div>
                    <div class="about_content">
                        <p>
                            Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                            Molestiae sit praesentium unde obcaecati ullam inventore quidem
                            sint non dolorem numquam velit nulla minima ipsa, voluptate harum
                            ex, neque atque totam ipsam quisquam accusamus itaque ducimus, ut
                            labore. Ut, asperiores ipsam? Expedita, perferendis porro facilis
                            temporibus magnam veritatis sint ipsum aliquam distinctio
                            inventore molestiae velit vero libero et saepe sunt culpa fuga
                            laboriosam nostrum quisquam. Tempore dolor voluptates tempora,
                            saepe unde suscipit necessitatibus facilis velit impedit tenetur
                            cupiditate, laboriosam corporis in deleniti asperiores pariatur
                            aperiam voluptatibus blanditiis dignissimos facere accusantium
                            provident. Quae, at. Qui delectus beatae minima praesentium
                            aperiam earum explicabo!
                        </p>
                    </div>
                </div>
            </section>

            <section id="contact" class="contact">
                <header>
                    <div class="container">
                        <h2>Contact us</h2>
                        <p>
                            Thank you for your interest in our website. Any questions please
                            email or call us immediately for support
                        </p>
                    </div>
                </header>
                <main>
                    <div class="container">
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.6100104981842!2d106.80769431474954!3d10.841127592277617!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgVFAuIEhDTQ!5e0!3m2!1svi!2s!4v1653822400724!5m2!1svi!2s"
                            width="800"
                            height="400"
                            style="border: 0;"
                            allowfullscreen=""
                            loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade"
                            ></iframe>
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
                                <p>
                                    Địa chỉ: Trường Đại học FPT TP. HCM Lô E2a-7, Đường D1, Đ. D1,
                                    Long Thạnh Mỹ, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh 700000
                                </p>
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
                                <p>© 2022 FPT Event Management</p>
                            </div>
                        </div>
                    </div>
                </main>
            </footer>

            <a class="button" href="#"><i class="icon fa fa-angle-up"></i></a>
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
