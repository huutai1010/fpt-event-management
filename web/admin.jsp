<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <link rel="stylesheet" href="./CSS/admin.css">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
</head>

<body>
    <div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="logo-tableau"></ion-icon>
                        </span>
                        <span class="title">Quản lý Event Organizer</span>
                    </a>
                </li>
                <li class="tab-item active">
                    <a href="#menu_1">
                        <span class="icon">
                            <ion-icon name="podium-outline"></ion-icon>
                        </span>
                        <span class="title">Sự kiện</span>
                    </a>
                </li>
                <li class="tab-item">
                    <a href="#menu_2">
                        <span class="icon">
                            <ion-icon name="people-outline"></ion-icon>
                        </span>
                        <span class="title">Câu lạc bộ/phòng ban</span>
                    </a>
                </li>
                <li class="tab-item">
                    <a href="#menu_3">
                        <span class="icon">
                            <ion-icon name="people-circle-outline"></ion-icon>
                        </span>
                        <span class="title">Sinh viên</span>
                    </a>
                </li>
            </ul>
        </div>

        <div class="main">
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>

                <div class="search">
                    <label>
                        <input type="text" placeholder="Tìm kiếm">
                        <ion-icon name="search-outline"></ion-icon>
                    </label>
                </div>

                <div class="button">
                    <button onclick="popupToggle();">Tạo tài khoản</button>
                </div>
            </div>

            <div class="details">
                <div id="menu_1" class="recentOrder">
                    <table>
                        <thead>
                            <tr>
                                <td>Email</td>
                                <td>Tên</td>
                                <td>SĐT</td>
                                <td>Chức vụ</td>
                                <td>Trạng thái</td>
                                <td>Số lượng SK</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>nguyenvana@gmail.com</td>
                                <td>Câu lạc bộ nhạc cụ</td>
                                <td>09090909</td>
                                <td>Câu lạc bộ</td>
                                <td>
                                    <span class="status">active</span>
                                </td>
                                <td>1</td>
                                <td>Kích</td>
                            </tr>
                            <tr>
                                <td>nguyenvana@gmail.com</td>
                                <td>Câu lạc bộ nhạc cụ</td>
                                <td>09090909</td>
                                <td>Câu lạc bộ</td>
                                <td>
                                    <span class="status">active</span>
                                </td>
                                <td>1</td>
                                <td>Kích</td>
                            </tr>
                            <tr>
                                <td>nguyenvana@gmail.com</td>
                                <td>Câu lạc bộ nhạc cụ</td>
                                <td>09090909</td>
                                <td>Câu lạc bộ</td>
                                <td>
                                    <span class="status">active</span>
                                </td>
                                <td>1</td>
                                <td>Kích</td>
                            </tr>
                            <tr>
                                <td>nguyenvana@gmail.com</td>
                                <td>Câu lạc bộ nhạc cụ</td>
                                <td>09090909</td>
                                <td>Câu lạc bộ</td>
                                <td>
                                    <span class="status">active</span>
                                </td>
                                <td>1</td>
                                <td>Kích</td>
                            </tr>
                            <tr>
                                <td>nguyenvana@gmail.com</td>
                                <td>Câu lạc bộ nhạc cụ</td>
                                <td>09090909</td>
                                <td>Câu lạc bộ</td>
                                <td>
                                    <span class="status">active</span>
                                </td>
                                <td>1</td>
                                <td>Kích</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="menu_2" class="recentOrder">
                    <table>
                        <thead>
                            <tr>
                                <td>Email</td>
                                <td>Tên</td>
                                <td>SĐT</td>
                                <td>Chức vụ</td>
                                <td>Trạng thái</td>
                                <td>Số lượng SK</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>nguyenvana@gmail.com</td>
                                <td>Câu lạc bộ nhạc cụ</td>
                                <td>09090909</td>
                                <td>Câu lạc bộ</td>
                                <td>
                                    <span class="status">active</span>
                                </td>
                                <td>1</td>
                                <td>Kích</td>
                            </tr>
                            <tr>
                                <td>nguyenvana@gmail.com</td>
                                <td>Câu lạc bộ nhạc cụ</td>
                                <td>09090909</td>
                                <td>Câu lạc bộ</td>
                                <td>
                                    <span class="status">active</span>
                                </td>
                                <td>1</td>
                                <td>Kích</td>
                            </tr>
                            <tr>
                                <td>nguyenvana@gmail.com</td>
                                <td>Câu lạc bộ nhạc cụ</td>
                                <td>09090909</td>
                                <td>Câu lạc bộ</td>
                                <td>
                                    <span class="status">active</span>
                                </td>
                                <td>1</td>
                                <td>Kích</td>
                            </tr>
                            <tr>
                                <td>nguyenvana@gmail.com</td>
                                <td>Câu lạc bộ nhạc cụ</td>
                                <td>09090909</td>
                                <td>Câu lạc bộ</td>
                                <td>
                                    <span class="status">active</span>
                                </td>
                                <td>1</td>
                                <td>Kích</td>
                            </tr>
                            <tr>
                                <td>nguyenvana@gmail.com</td>
                                <td>Câu lạc bộ nhạc cụ</td>
                                <td>09090909</td>
                                <td>Câu lạc bộ</td>
                                <td>
                                    <span class="status">active</span>
                                </td>
                                <td>1</td>
                                <td>Kích</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="menu_3" class="recentOrder">
                    <table>
                        <thead>
                            <tr>
                                <td>Email</td>
                                <td>Tên</td>
                                <td>SĐT</td>
                                <td>Chức vụ</td>
                                <td>Trạng thái</td>
                                <td>Số lượng SK</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>nguyenvana@gmail.com</td>
                                <td>Câu lạc bộ nhạc cụ</td>
                                <td>09090909</td>
                                <td>Câu lạc bộ</td>
                                <td>
                                    <span class="status">active</span>
                                </td>
                                <td>1</td>
                                <td>Kích</td>
                            </tr>
                            <tr>
                                <td>nguyenvana@gmail.com</td>
                                <td>Câu lạc bộ nhạc cụ</td>
                                <td>09090909</td>
                                <td>Câu lạc bộ</td>
                                <td>
                                    <span class="status">active</span>
                                </td>
                                <td>1</td>
                                <td>Kích</td>
                            </tr>
                            <tr>
                                <td>nguyenvana@gmail.com</td>
                                <td>Câu lạc bộ nhạc cụ</td>
                                <td>09090909</td>
                                <td>Câu lạc bộ</td>
                                <td>
                                    <span class="status">active</span>
                                </td>
                                <td>1</td>
                                <td>Kích</td>
                            </tr>
                            <tr>
                                <td>nguyenvana@gmail.com</td>
                                <td>Câu lạc bộ nhạc cụ</td>
                                <td>09090909</td>
                                <td>Câu lạc bộ</td>
                                <td>
                                    <span class="status">active</span>
                                </td>
                                <td>1</td>
                                <td>Kích</td>
                            </tr>
                            <tr>
                                <td>nguyenvana@gmail.com</td>
                                <td>Câu lạc bộ nhạc cụ</td>
                                <td>09090909</td>
                                <td>Câu lạc bộ</td>
                                <td>
                                    <span class="status">active</span>
                                </td>
                                <td>1</td>
                                <td>Kích</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="QA__button">
                <div id="QA-text" class="QA__button--text">
                    <div class="box">
                        <a href="" class="close"><img src="./img/icon_close.png" style="width: 22px;" alt=""></a>
                        <h3>Tạo tài khoản</h3>
                        <div class="text-box">
                            <div class="text">
                                <span>Loại tài khoản</span>
                                <input type="text">
                            </div>
                            <div class="text">
                                <span>Loại tài khoản</span>
                                <input type="text">
                            </div>
                            <div class="text">
                                <span>Loại tài khoản</span>
                                <input type="text">
                            </div>
                        </div>
                        <div class="inputbox">
                            <button>Ok</button>
                        </div>
                    </div>
                </div>
                <div class="QA__arrow"></div>
            </div>
        </div>
    </div>

    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>

        $(document).ready(function(){
            $('.recentOrder').hide();
            $('.recentOrder:first-child').fadeIn();
            $('.tab-item').click(function(){
                $('.tab-item').removeClass('active');
                $(this).addClass('active');

                let id_tab_content = $(this).children('a').attr('href');
                $('.recentOrder').hide();
                $(id_tab_content).fadeIn();
                
                return false;
            });
        });

        function popupToggle() {
            const text = document.getElementById('QA-text');
            text.classList.toggle('active');
        }

        // menuToggle
        let toggle = document.querySelector('.toggle');
        let navigation = document.querySelector('.navigation');
        let main = document.querySelector('.main');

        toggle.onclick = function () {
            navigation.classList.toggle('active');
            main.classList.toggle('active');
        }
        // 
        let list = document.querySelectorAll('.navigation li');
        function activeLink() {
            list.forEach((item) =>
                item.classList.remove('hovered'));
            this.classList.add('hovered');
        }
        list.forEach((item) =>
            item.addEventListener('mouseover', activeLink));
    </script>
</body>

</html>