<%-- 
    Document   : ListQuestion.jsp
    Created on : Jun 26, 2022, 9:48:15 PM
    Author     : DELL
--%>

<%@page import="sample.dao.QuestionDAO"%>
<%@page import="sample.dto.UserDTO"%>
<%@page import="sample.dto.EventDTO"%>
<%@page import="sample.dto.QuestionDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>List Question Page</title>
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

        <link rel="stylesheet" href="CSS/questionAndAnswer.css">
    </head>
    <body>
        <%
            EventDTO event = (EventDTO) request.getAttribute("DETAIL_EVENT");
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

            String error = (String) request.getAttribute("SEARCH_QUESTIONS_ERROR");
            if (error == null) {
                error = "";
            }
            String searchKeyWordQuestion = request.getParameter("searchKeyWordQuestion");
            if (searchKeyWordQuestion == null) {
                searchKeyWordQuestion = "";
            }

        %>
        <div class="wrapper">
            <header class="header">
                <div class="header_container container">
                    <div class="header__logo">
                        <a href="MainController?action=SearchHome"><img src="./img/F Event.png" alt="..."></a>
                    </div>
                    <div class="header__search">
                        <form action="MainController">
                            <input type="text" placeholder="Find question you need to want">
                            <button type="submit" name="action" value="SearchQuestion"><i class=""></i></button>
                        </form>          
                    </div>
                </div>
            </header>

            <section class="section">
                <div class="container">
                    <div class="QA">
                        <div class="QA_header">
                            <h3 style="text-align: center ;color: red" >Question And Answer</h3>
                        </div>
                        <div class="QA__button">
                            <div class="QA__button--click">
                                <button id="QA-btn" class="btn btn-success" onclick="popupToggle();">
                                    Make a question
                                </button>
                            </div>
                            <div id="QA-text" class="QA__button--text">
                                <form action="MainController">

                                    <div class="box">
                                        <a href="#" class="close"><img src="./img/icon_close.png" style="width: 25px;" alt=""></a>
                                        <h3>Đặt câu hỏi</h3>
                                        <div class="text">
                                            <textarea  cols="50" rows="7" name="questionDetail" ></textarea>
                                        </div>
                                        <div class="inputbox">
                                            <input type="hidden" name="action" value="PublishQuestions"/>
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

                                            <input class="btn btn-success btn-sm shadow-none" type="submit" value="Gửi"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="QA__arrow"></div>
                        </div>
                    </div>


                    <div class="send-Question">
                        <%
                            QuestionDAO questionDAO = new QuestionDAO();
                            List<QuestionDTO> listQuestions = questionDAO.getListQuestion(event.getEventID());
                            //QuestionDTO question = (QuestionDTO) request.getAttribute("DETAIL_QUESTION");
                            //  List<QuestionDTO> listQuestions = (List<QuestionDTO>) request.getAttribute("LIST_QUESTION");
                            for (int i = 0; i < listQuestions.size(); i++) {
                                QuestionDTO question = listQuestions.get(i);
                                //                        
                                //                        if (listQuestions != null) {
                                //                            if (listQuestions.size() > 0) {
                                //                                for (QuestionDTO question : listQuestions) {
                        %>
                        <div class="main_QA">
                            <div class="QA_container">
                                <div class="QA_card">
                                    <div class="QA_title">
                                        <a href="#">
                                            <div class="QA_title-img">
                                                <img src="<%= question.getAvatar()%>" style="width: 50px; height: 50px; border-radius: 50%;"
                                                     alt="avatar">
                                                <input type="hidden" name="<%= question.getQuestionID()%>" />
                                            </div>
                                            <div class="QA_title-name">
                                                <span style="font-size:15px;"><%= question.getUserName()%></span>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="QA_comment">
                                        <div class="QA_content">
                                            <a href="MainController?action=ShowDetailQuestion&questionID=<%= question.getQuestionID()%>&userID=<%= question.getUserID()%>&userName=<%= question.getUserName()%>&avatar=<%= question.getAvatar()%>&questionDetail=<%= question.getQuestionDetail()%>&eventID=<%=question.getEventID()%>">
                                                <div class="content"><%= question.getQuestionDetail()%></div>
                                            </a>
                                        </div>
                                        <div class="QA_info">
                                            <div class="QA_info-reply">
                                                <span><b>Repies:</b></span>
                                                <span>10</span>
                                            </div>
                                            <div class="QA_info-time">
                                                <span><b>june 25, 2022</b></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- 2 -->

                                <!-- 3 -->

                                <!-- 4 -->

                                <!-- 5 -->

                            </div>
                        </div>
                        <%
                            }

                        %>     

                    </div>  
                    <%-- 
                    <%
                        }
                    } else if (listQuestions.size() == 0) {
                    %>
                    <div>There is no question here!!</div>
                    <%
                            }
                        }
                    %>
                    --%>
                </div>
            </section>
        </div>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script>
            function popupToggle() {
                const text = document.getElementById('QA-text');
                text.classList.toggle('active');
            }
        </script>
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
