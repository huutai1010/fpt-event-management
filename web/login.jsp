<%-- 
    Document   : login.jsp
    Created on : May 29, 2022, 11:31:49 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <link rel="stylesheet" href="./CSS/style.css">
        <title>Login Page</title>
    </head>
    <body>
        <div class="wrapper">
            <header id="header" class="header">               
                    <div class="header_container container">
                    <div class="header_logo">
                        <a href="#"><img src="./img/F Event.png" alt="..."></a>
                    </div>
                    <div class="header_nav">
                        <a class="active" href="#">Home</a>
                        <a href="#">About us</a>
                        <a href="#">Contact us</a>
                    </div>
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
                <section class="carousel">
                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="./img/1.png" alt="First slide">
                                <div class="carousel_info">
                                    <h1>Sự kiện nhạc cụ dân tộc FPTU</h1>
                                    <!-- timer -->
                                    <div class="carousel_timer">
                                        <p id="demo"></p>
                                    </div>
                                    <button class="btn btn-drak btn-carousel wow animate__animated animate__delay-1s"><a href="#">Register</a></button>

                                </div>
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="./img/2.jpg" alt="Second slide">
                                <div class="carousel_info">
                                    <h1>Sự kiện nhạc cụ dân tộc FPTU</h1>
                                    <!-- timer -->
                                    <div class="carousel_timer">
                                        <p id="demo2"></p>
                                    </div>
                                    <button class="btn btn-drak btn-carousel wow animate__animated  animate__delay-1s"><a href="#">Register</a></button>

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
                                    <button class="btn btn-drak btn-carousel wow animate__animated animate__delay-1s"><a href="#">Register</a></button>

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
                </section>
                <div class="book"><span><i class="fa fa-book-open"></i></span></div>
                <section class="about">
                    <div class="container">
                        <div class="about_head">
                            <h1>ABOUT US</h1>
                        </div>
                        <div class="about_content">
                            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Molestiae sit praesentium unde
                                obcaecati ullam inventore quidem sint non dolorem numquam velit nulla minima ipsa, voluptate
                                harum ex, neque atque totam ipsam quisquam accusamus itaque ducimus, ut labore. Ut,
                                asperiores ipsam? Expedita, perferendis porro facilis temporibus magnam veritatis sint ipsum
                                aliquam distinctio inventore molestiae velit vero libero et saepe sunt culpa fuga laboriosam
                                nostrum quisquam.
                                Tempore dolor voluptates tempora, saepe unde suscipit necessitatibus facilis velit impedit
                                tenetur cupiditate, laboriosam corporis in deleniti asperiores pariatur aperiam voluptatibus
                                blanditiis dignissimos facere accusantium provident. Quae, at. Qui delectus beatae minima
                                praesentium aperiam earum explicabo!</p>
                        </div>
                    </div>
                </section>

                <section class="feature">
                    <header>
                        <div class="container">
                            <h1>EVENTS</h1>
                            <p>Follow and subscribe to the hottest upcoming and happening events here </p>
                        </div>
                    </header>
                    <main>
                        <div class="list">
                            <div class="item item-1">
                                <img src="./img/grid-metro-1.jpg"  alt="">
                                <div class="infor">
                                    <div class="heart">
                                        <button><i class="fa fa-heart"></i></button>
                                    </div>
                                    <div class="detail">
                                        <h3>Sự kiện nhạc cụ dân tộc FPTU</h3>
                                        <p>Sunday, 1/6/2022 - Phòng 202</p>
                                        <p>Câu lạc bộ nhạc cụ dân tộc</p>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <img src="./img/grid-metro-2.jpg" alt="">
                                <div class="infor">
                                    <div class="heart">
                                        <button><i class="fa fa-heart"></i></button>
                                    </div>
                                    <div class="detail">
                                        <h3>Sự kiện nhạc cụ dân tộc FPTU</h3>
                                        <p>Sunday, 1/6/2022 - Phòng 202</p>
                                        <p>Câu lạc bộ nhạc cụ dân tộc</p>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <img src="./img/grid-metro-3.jpg" alt="">
                                <div class="infor">
                                    <div class="heart">
                                        <button><i class="fa fa-heart"></i></button>
                                    </div>
                                    <div class="detail">
                                        <h3>Sự kiện nhạc cụ dân tộc FPTU</h3>
                                        <p>Sunday, 1/6/2022 - Phòng 202</p>
                                        <p>Câu lạc bộ nhạc cụ dân tộc</p>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <img src="./img/grid-metro-4.jpg" alt="">
                                <div class="infor">
                                    <div class="heart">
                                        <button><i class="fa fa-heart"></i></button>
                                    </div>
                                    <div class="detail">
                                        <h3>Sự kiện nhạc cụ dân tộc FPTU</h3>
                                        <p>Sunday, 1/6/2022 - Phòng 202</p>
                                        <p>Câu lạc bộ nhạc cụ dân tộc</p>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <img src="./img/grid-metro-5.jpg" alt="">
                                <div class="infor">
                                    <div class="heart">
                                        <button><i class="fa fa-heart"></i></button>
                                    </div>
                                    <div class="detail">
                                        <h3>Sự kiện nhạc cụ dân tộc FPTU</h3>
                                        <p>Sunday, 1/6/2022 - Phòng 202</p>
                                        <p>Câu lạc bộ nhạc cụ dân tộc</p>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <img src="./img/grid-metro-6.jpg" alt="">
                                <div class="infor">
                                    <div class="heart">
                                        <button><i class="fa fa-heart"></i></button>
                                    </div>
                                    <div class="detail">
                                        <h3>Sự kiện nhạc cụ dân tộc FPTU</h3>
                                        <p>Sunday, 1/6/2022 - Phòng 202</p>
                                        <p>Câu lạc bộ nhạc cụ dân tộc</p>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <img src="./img/grid-metro-7.jpg" alt="">
                                <div class="infor">
                                    <div class="heart">
                                        <button><i class="fa fa-heart"></i></button>
                                    </div>
                                    <div class="detail">
                                        <h3>Sự kiện nhạc cụ dân tộc FPTU</h3>
                                        <p>Sunday, 1/6/2022 - Phòng 202</p>
                                        <p>Câu lạc bộ nhạc cụ dân tộc</p>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <img src="./img/grid-metro-8.jpg" alt="">
                                <div class="infor">
                                    <div class="heart">
                                        <button><i class="fa fa-heart"></i></button>
                                    </div>
                                    <div class="detail">
                                        <h3>Sự kiện nhạc cụ dân tộc FPTU</h3>
                                        <p>Sunday, 1/6/2022 - Phòng 202</p>
                                        <p>Câu lạc bộ nhạc cụ dân tộc</p>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <img src="./img/grid-metro-9.jpg" alt="">
                                <div class="infor">
                                    <div class="heart">
                                        <button><i class="fa fa-heart"></i></button>
                                    </div>
                                    <div class="detail">
                                        <h3>Sự kiện nhạc cụ dân tộc FPTU</h3>
                                        <p>Sunday, 1/6/2022 - Phòng 202</p>
                                        <p>Câu lạc bộ nhạc cụ dân tộc</p>
                                    </div>
                                </div>
                            </div>
                            <div class="item item-10">
                                <img src="./img/grid-metro-10.jpg" alt="">
                                <div class="infor">
                                    <div class="heart">
                                        <button><i class="fa fa-heart"></i></button>
                                    </div>
                                    <div class="detail">
                                        <h3>Sự kiện nhạc cụ dân tộc FPTU</h3>
                                        <p>Sunday, 1/6/2022 - Phòng 202</p>
                                        <p>Câu lạc bộ nhạc cụ dân tộc</p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </main>
                </section>
                <section class="contact">
                    <header>
                        <div class="container">
                            <h1>CONTACT US</h1>
                            <P>Thank you for your interest in our website. 
                                Any questions please email or call us immediately for support</P>
                        </div>
                    </header>
                    <main>
                        <div class="container">
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.6100104981842!2d106.80769431474954!3d10.841127592277617!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgVFAuIEhDTQ!5e0!3m2!1svi!2s!4v1653822400724!5m2!1svi!2s" 
                                width="800" height="400" 
                                style="border:0;" allowfullscreen="" 
                                loading="lazy" referrerpolicy="no-referrer-when-downgrade">
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
                                        Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh 700000</p>
                                </div>
                            </div>
                        </div>
                    </main>
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
                            <div class="item">
                                <img src="./img/0001.jpg" width="260" alt="">
                            </div>
                        </div>
                    </div>
                </main>
            </footer>

            <a class="btn" href="#header"><i class="icon fa fa-angle-up"></i></a>
        </div>

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

        <!-- countdown timer -->
        <script src="./js/index.js"></script>
    </body>
</html>
