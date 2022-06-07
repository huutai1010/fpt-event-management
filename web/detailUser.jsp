<!doctype html>
<html lang="en">

    <head>
        <title>Detail Page</title>
        <!-- Required meta tags -->
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta charset="UTF-8">
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
        <link rel="stylesheet" href="./CSS/detailUser.css">
    </head>

    <body>
        <header class="header">
            <div class="header_container container">
                <div class="header__logo">
                    <a href="home.jsp"><img src="./img/F Event.png" alt=""></a>
                </div>
                <div class="header__nav">
                    <div class="action">
                        <a href="#">
                            <img src="./img/02-3.jpg" alt="">
                            <span>Nguyen van  A</span>
                        </a>
                    </div>

                    <div class="notification">
                        <a href="#"><i class="fa fa-bell"></i></a>
                    </div>

                    <div id="navbars" class="navbar">
                        <div class="Bar__fa">
                            <a href=""><i class="fa fa-bars"></i></a>
                        </div>

                        <div id="menu" class="bar__child">
                            <ul>
                                <li><i class="fa fa-user"></i><a href="#">Profile</a></li>
                                <li><i class="fa fa-sign-out-alt"></i><a href="MainController?action=Logout">Logout</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <section>
            <div class="container">
                <div class="detail">
                    <div class="detail_left">
                        <div class="img">
                            <img src="./img/g1.jpg" width="100%" alt="">
                        </div>
                        <div class="item">
                            <div class="item_timer">
                                <p>SÁWp x?y ra</p>
                            </div>
                            <div class="item_content">
                                <a href="#"><button>Tham Gia</button></a>
                                <a href="#"><button>Quan Tâm</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="detail_right">
                        <div class="detail_info">
                            <h3>Ngày  tieng nh?t FPT</h3>
                            <div class="info">
                                <h5>Ngày t? ch?c:</h5>
                                <p>Tuesday,28/6/2022 </p>
                            </div>
                            <div class="info">
                                <h5>Th?i gian:</h5>
                                <p>9:00 AM - 10:30AM</p>
                            </div>
                            <div class="info">
                                <h5>Ng??i t? ch?c:</h5>
                                <p>Câu l?c b? ti?ng Nh?t</p>
                            </div>
                            <div class="info">
                                <h5>gi?ng viên tham d?:</h5>
                                <p>Nguy?n Th? Hoàng</p>
                            </div>
                            <div class="info">
                                <h5>S? ???c ng??i tham d?:</h5>
                                <p>100 ng??i</p>
                            </div>
                        </div>
                        <div class="detail_about">
                            <h5>N?i dung:</h5>
                            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quo maiores deleniti delectus ipsum
                                nulla sed provident ad et totam ipsam, magni sequi nemo blanditiis officiis obcaecati quae
                                facilis sit, fuga fugit quis laudantium. Pariatur necessitatibus, fuga minus ea, facere id
                                reprehenderit porro quidem et dicta voluptate dolorem. Illum, quaerat adipisci.</p>
                        </div>
                    </div>
                </div>
            </div>
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