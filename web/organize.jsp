<%-- 
    Document   : oganize
    Created on : Aug 4, 2022, 5:00:16 PM
    Author     : maihuutai
--%>

<%@page import="sample.dto.LocationDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.dao.LocationDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

    <head>
        <title>Title</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
              integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link rel="stylesheet" href="CSS/organize.css">


        <!-- textarea -->
        <script src="https://cdn.tiny.cloud/1/wjvuujhhtulmm2cdm5pqtpuqrvhr4voe48uda38rhx1uovb1/tinymce/6/tinymce.min.js"
        referrerpolicy="origin"></script>
        <script>
            tinymce.init({
                selector: '#mytextarea'
            });
        </script>

        <!-- image -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    </head>

    <body>
        <div id="blur" class="blur">
        </div>
        <div class="container">
            <div class="box">

                <form action="MainController">
                    <div class="form_container">
                        <h3>Organization</h3>
                        <div class="form-first">
                            <div class="form_left">


                                <form action="MainController">
                                    <div class="input-field">
                                        <label for="">Chọn phòng</label>
                                        <div>
                                            <select name="place" required onfocus="this.size = 10;" onblur="this.size = 10;"
                                                    onfocusout="this.size=null;" onchange="this.size = 10; this.blur();">
                                                <option disabled selected>Select room</option>
                                                <%
                                                    LocationDAO locationDAO = new LocationDAO();
                                                    List<LocationDTO> listLocations = locationDAO.getAllLocations();
                                                    for (LocationDTO location : listLocations) {
                                                %>
                                                <option value="<%=location.getLocationID()%>"><%=location.getLocationName()%></option>
                                                <%
                                                    }
                                                %>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="input-field">
                                        <label for="">Chọn ngày</label>
                                        <input type="date" name="date" id="" required>
                                    </div>
                                    <input class="submit-field" type="submit" name="action" value="FindSlot">
                                </form>


                            </div>
                            <div class="form_right">
                                <span>danh sách slot</span>
                                <div class="slot">
                                    <article class="feature1" <% if (true) {%> style="background-color: gray"<%}%>>
                                        <input type="checkbox" id="feature1" <% if (true) {%> disabled <%}%>/>
                                        <div>
                                            <span>
                                                slot 1: 7h-8h30
                                            </span>
                                        </div>
                                    </article>
                                    <article class="feature2">
                                        <input type="checkbox" id="feature1" />
                                        <div>
                                            <span>
                                                slot 2: 8h45-10h15
                                            </span>
                                        </div>
                                    </article>
                                    <article class="feature3">
                                        <input type="checkbox" id="feature1" />
                                        <div>
                                            <span>
                                                slot 3: 10h30-12h
                                            </span>
                                        </div>
                                    </article>
                                    <article class="feature4">
                                        <input type="checkbox" id="feature1" />
                                        <div>
                                            <span>
                                                slot 4: 12h30-14h
                                            </span>
                                        </div>
                                    </article>
                                    <article class="feature5">
                                        <input type="checkbox" id="feature1" />
                                        <div>
                                            <span>
                                                slot 5: 14h15-15h45
                                            </span>
                                        </div>
                                    </article>
                                    <article class="feature6">
                                        <input type="checkbox" id="feature6" />
                                        <div>
                                            <span>
                                                slot 6: 16h-17h30
                                            </span>
                                        </div>
                                    </article>
                                    <article class="feature7">
                                        <input type="checkbox" id="feature1" />
                                        <div>
                                            <span>
                                                slot 7: 17h30-19h
                                            </span>
                                        </div>
                                    </article>
                                    <article class="feature8">
                                        <input type="checkbox" id="feature1" />
                                        <div>
                                            <span>
                                                slot 8: 19h-20h30
                                            </span>
                                        </div>
                                    </article>
                                </div>
                            </div>
                        </div>
                        <div class="form-second">
                            <div class="title">
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Tên sự kiện</label>
                                    <input class="form-control" id="exampleFormControlTextarea1" rows="1"></input>
                                </div>
                            </div>
                            <div class="title_option">
                                <div class="option">
                                    <div class="form-group">
                                        <label for="exampleFormControlTextarea1">Loại sự kiện</label>
                                        <select required>
                                            <option disabled selected>Loại sự kiện</option>
                                            <option>Ngon ngu anh</option>
                                            <option>Thiet ke do hoa</option>
                                            <option>Kinh doanh quoc te</option>
                                            <option>Cong nghe thong tin</option>
                                            <option>Cac the loai khac</option>
                                            <option>Cac nganh khac</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="option">
                                    <div class="form-group">
                                        <label for="exampleFormControlTextarea1">Loại sự kiện</label>
                                        <select required>
                                            <option disabled selected>Hình thức</option>
                                            <option>Offline</option>
                                            <option>Online</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="tiket">
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Giá vé</label>
                                    <input type="text" name="Giá" id="" placeholder="Giá">
                                </div>
                            </div>

                            <div class="tiket">
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">So nguoi tham gia</label>
                                    <input type="text" name="Giá" id="" placeholder="Giá">
                                </div>
                            </div>

                            <div class="content_text">
                                <div class="form">
                                    <label for="exampleFormControlTextarea1">Nội dung sự kiện</label>
                                    <form class="" method="post">
                                        <input id="mytextarea"></input>
                                    </form>
                                </div>
                            </div>

                            <div class="Form">
                                <h4>chọn ảnh cho sự kiện</h4>
                                <div class="grid">
                                    <div class="form-element">
                                        <input type="file" id="file-1" accept="image/*">
                                        <label for="file-1" id="file-1-preview">
                                            <img src="https://bit.ly/3ubuq5o" alt="">
                                            <div>
                                                <span>+</span>
                                            </div>
                                        </label>
                                    </div>
                                    <div class="form-element">
                                        <input type="file" id="file-2" accept="image/*">
                                        <label for="file-2" id="file-2-preview">
                                            <img src="https://bit.ly/3ubuq5o" alt="">
                                            <div>
                                                <span>+</span>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="input">
                                <div class="box">
                                    <input id="input_submit" class="submit-field" type="submit" name="action" value="CreateEvent">
                                </div>
                                <div id="submit-success">
                                    <i class="fa fa-circle"></i>
                                    <span>Chúc mừng bạn đã tạo sự kiện thành công</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- Optional JavaScript -->
        <script src="./organize.js"></script>
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
