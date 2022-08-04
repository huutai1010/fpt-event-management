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
                                            <select name="place" onfocus="this.size = 10;" onblur="this.size = 10;"
                                                    onfocusout="this.size=null;" onchange="this.size = 10; this.blur();">
                                                <!--<option disabled selected>Select room</option>-->
                                                <%
                                                    LocationDAO locationDAO = new LocationDAO();
                                                    List<LocationDTO> listLocations = locationDAO.getAllLocations();
                                                    for (LocationDTO location : listLocations) {
                                                %>
                                                <option value="<%=location.getLocationID()%>" 
                                                        <% if (request.getAttribute("PLACE") != null && request.getAttribute("PLACE").equals(location.getLocationID())) { 
                                                        %> 
                                                            selected 
                                                        <%
                                                            }
                                                        %>><%=location.getLocationName()%></option>
                                                <%
                                                    }
                                                %>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="input-field">
                                        <label for="">Chọn ngày</label>
                                        <input type="date" name="date" id="" value="<%=request.getAttribute("DATE") != null ? request.getAttribute("DATE") : ""%>">
                                    </div>
                                    <input class="submit-field" type="submit" name="action" value="FindSlot">
                                </form>


                            </div>
                            <div class="form_right">
                                <span>danh sách slot</span>
                                <div class="slot">

                                    <%
                                        List<String> listBooking = (List<String>) request.getAttribute("LIST_BOOKING");
                                        if (listBooking != null) {
                                            if (listBooking.size() >= 0) {
                                                for (int i = 1; i <= 8; i++) {
                                                
                                        
                                    %>

                                    <article class="feature1" 
                                             <% for (String slotID: listBooking) {
                                             if (slotID.equals("SL" + i)) {
                                             %> 
                                             style="background-color: gray"
                                             <% 
                                                 break;
                                                 }
                                               }
                                             %>>
                                        <input type="checkbox" id="feature1" name="slot<%=i%>" value="SL<%=i%>" 
                                             <% for (String slotID: listBooking) {
                                                if (slotID.equals("SL" + i)) {
                                             %>
                                               disabled 
                                               <%
                                                   break;
                                                   }
                                                }
                                               %>/>
                                        <div>
                                            <span>
                                                slot <%=i%>
                                            </span>
                                        </div>
                                    </article>

                                    <%
                                                }
                                            }
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                        <div class="form-second">
                            <div class="title">
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Tên sự kiện</label>
                                    <input class="form-control" id="exampleFormControlTextarea1" rows="1" name="eventName"></input>
                                </div>
                            </div>
                            <div class="title_option">
                                <div class="option">
                                    <div class="form-group">
                                        <label for="exampleFormControlTextarea1">Loại sự kiện</label>
                                        <select required name="categoryID">
                                            <option disabled selected>Loại sự kiện</option>
                                            <option value="EL">Ngon ngu anh</option>
                                            <option value="GD">Thiet ke do hoa</option>
                                            <option value="IB">Kinh doanh quoc te</option>
                                            <option value="IT">Cong nghe thong tin</option>
                                            <option value="OG">Cac the loai khac</option>
                                            <option value="IT">Cac nganh khac</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="option">
                                    <div class="form-group">
                                        <label for="exampleFormControlTextarea1">Hình thức</label>
                                        <select required name="formality">
                                            <option disabled selected>Hình thức</option>
                                            <option value="Offline">Offline</option>
                                            <option value="Online">Online</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="tiket">
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Giá vé</label>
                                    <input type="text" name="ticketPrice" id="" placeholder="Giá">
                                </div>
                            </div>

                            <div class="tiket">
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">So nguoi tham gia</label>
                                    <input type="text" name="numberOfAttendees" id="" placeholder="So nguoi tham du">
                                </div>
                            </div>

                            <div class="content_text">
                                <div class="form">
                                    <label for="exampleFormControlTextarea1">Nội dung sự kiện</label>
                                    <!--<form class="" method="post">-->
                                        <input id="mytextarea" name="eventDetail"></input>
                                    <!--</form>-->
                                </div>
                            </div>

                            <div class="Form">
                                <h4>chọn ảnh cho sự kiện</h4>
                                <div class="grid">
                                    <div class="form-element">
                                        <input type="file" id="file-1" accept="image/*" name="posterImage">
                                        <label for="file-1" id="file-1-preview">
                                            <img src="https://bit.ly/3ubuq5o" alt="">
                                            <div>
                                                <span>+</span>
                                            </div>
                                        </label>
                                    </div>
                                    <div class="form-element">
                                        <input type="file" id="file-2" accept="image/*" name="backgroundImage">
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
