<%@page import="sample.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.dto.EventDTO"%>
<!doctype html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <title>Registered</title>
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
        <link rel="stylesheet" href="./CSS/showRegistered.css">
    </head>

    <body>
        <%
            String error = (String) request.getAttribute("SEARCH_RESGISTER_ERROR");
            if (error == null) {
                error = "";
            }
            String searchKeywordRegister = request.getParameter("searchKeywordRegister");
            if (searchKeywordRegister == null) {
                searchKeywordRegister = "";
            }

        %>
        <div class="wrapper">
            <header class="header">
                <div class="header_container container">
                    <div class="header__logo">
                        <a href="home.jsp"><img src="./img/F Event.png" alt="..."></a>
                    </div>
                    <div class="header__search">
                        <form action="MainController" class="search-bar">
                            <input type="text" name="searchKeywordRegister" value="<%= searchKeywordRegister%>" placeholder="Search..........." />                                   
                            <button type="submit" name="action" value="SearchRegister"><i class=""></i></button>
                        </form>
                    </div>
                </div>
            </header>

            <section class="card">
                <table class="table">
                    <h1 style="text-align: center;color: red"><%= error %></h1>
                    <h3>Registered Event</h3>
                    <thead>
                        <tr>
                            <th scope="col" style="padding-left: 11rem; font-size: 20px;">Event</th>
                            <th scope="col" style="font-size: 20px;padding-left: 3rem">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<EventDTO> listRegisteredEvents = (List<EventDTO>) request.getAttribute("LIST_REGISTERED_EVENTS");
                            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                            if (listRegisteredEvents != null) {
                                if (listRegisteredEvents.size() > 0) {
                                    for (EventDTO registeredEvent : listRegisteredEvents) {
                        %>
                        <tr class="tr">
                            <th scope="row" class="item">
                                <div class="item_img">
                                    <a href="MainController?action=ShowDetailEventHome&eventID=<%= registeredEvent.getEventID()%>"><img src="images/<%= registeredEvent.getPosterImage()%>" alt=""></a>
                                    <a href="MainController?action=ShowDetailEventHome&eventID=<%= registeredEvent.getEventID()%>"><span style="font-size: 20px; margin-left: 15px;"><%= registeredEvent.getEventName()%></span></a>
                                </div>
                            </th>
                            <td>
                                <div class="status_item">
                                    <i class="fa fa-circle"></i>
                                    <span>Registered</span>
                                    <button class="btn btn-danger"><a style="color: black;text-decoration: none" href="MainController?action=UnRegisterV2&userID=<%=loginUser.getUserID()%>&eventID=<%=registeredEvent.getEventID()%>">Unregistered</a></button>
                                </div>
                            </td>
                        </tr>
                        <%                                }
                            }
                        } else {
                            List<EventDTO> listSearchRegisteredEvents = (List<EventDTO>) request.getAttribute("LIST_SEARCH_REGISTERED");
                            if (listSearchRegisteredEvents != null) {
                                if (listSearchRegisteredEvents.size() > 0) {
                                    for (EventDTO searchRegisteredEvents : listSearchRegisteredEvents) {
                        %>
                        <tr class="tr">
                            <th scope="row" class="item">
                                <div class="item_img">
                                    <a href="MainController?action=ShowDetailEventHome&eventID=<%= searchRegisteredEvents.getEventID()%>"><img src="images/<%= searchRegisteredEvents.getPosterImage()%>" alt=""></a>
                                    <a href="MainController?action=ShowDetailEventHome&eventID=<%= searchRegisteredEvents.getEventID()%>"><span style="font-size: 20px; margin-left: 15px;"><%= searchRegisteredEvents.getEventName()%></span></a>
                                </div>
                            </th>
                            <td>
                                <div class="status_item">
                                    <i class="fa fa-circle"></i>
                                    <span>Registered</span>
                                    <button class="btn btn-danger"><a style="color: black;text-decoration: none" href="MainController?action=UnRegisterV2&userID=<%=loginUser.getUserID()%>&eventID=<%=searchRegisteredEvents.getEventID()%>">Unregistered</a></button>
                                </div>
                            </td>
                        </tr>
                        <%
                                        }
                                    }
                                }
                            }
                        %>
                    </tbody>
                </table>
            </section>
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
    </body>

</html>