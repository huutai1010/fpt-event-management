<%-- 
    Document   : ListQuestion.jsp
    Created on : Jun 26, 2022, 9:48:15 PM
    Author     : DELL
--%>

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
                            <input type="text" name="searchKeyWordQuestion"  value="<%= searchKeyWordQuestion%>" placeholder="Nhập địa điểm">
                            <button type="submit" name="action" value="SearchQuestion"><i class=""></i></button>
                        </form>          
                    </div>
                </div>
            </header>

            <section class="section">
                <div class="container">
                    <div class="QA_header">
                        <h3>Hỏi đáp</h3>
                    </div>
                    <%
                        //QuestionDTO question = (QuestionDTO) request.getAttribute("DETAIL_QUESTION");
                        List<QuestionDTO> listQuestions = (List<QuestionDTO>) request.getAttribute("LIST_QUESTION");
                        if (listQuestions != null) {
                            if (listQuestions.size() > 0) {
                                for (QuestionDTO listQuestion : listQuestions) {

                    %>
                    <div class="main_QA">
                        <div class="QA_container">
                            <div class="QA_card">
                                <div class="QA_title">
                                    <a href="#">
                                        <div class="QA_title-img">
                                            <img src="<%= listQuestion.getAvatar()%>" style="width: 50px; height: 50px; border-radius: 50%;"
                                                 alt="avatar">
                                            <input type="hidden" name="<%= listQuestion.getQuestionID()%>" />
                                        </div>
                                        <div class="QA_title-name">
                                            <span style="font-size:15px;"><%= listQuestion.getUserName()%></span>
                                        </div>
                                    </a>
                                </div>
                                <div class="QA_comment">
                                    <div class="QA_content">
                                        <a href="MainController?action=ShowDetailQuestion&questionID=<%= listQuestion.getQuestionID()%>&userID=<%= listQuestion.getUserID()%>&userName=<%= listQuestion.getUserName()%>&avatar=<%= listQuestion.getAvatar()%>&questionDetail=<%= listQuestion.getQuestionDetail()%>">
                                            <div class="content"><%= listQuestion.getQuestionDetail()%></div>
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
                    } else if (listQuestions.size() == 0) {
                    %>
                    <div>There is no question here!!</div>
                    <%
                        }
                    } else {
                        List<QuestionDTO> SearchlistQuestions = (List<QuestionDTO>) request.getAttribute("LIST_SEARCH_QUESTIONS");
                        if (SearchlistQuestions != null) {
                            if (SearchlistQuestions.size() > 0) {
                                for (QuestionDTO searchListQuestion : SearchlistQuestions) {
                    %>
                    <div class="main_QA">
                        <div class="QA_container">
                            <div class="QA_card">
                                <div class="QA_title">
                                    <a href="MainController?action=ShowDetailQuestion&questionID=<%= searchListQuestion.getQuestionID()%>&userID=<%= searchListQuestion.getUserID()%>&userName=<%= searchListQuestion.getUserName()%>&avatar=<%= searchListQuestion.getAvatar()%>&questionDetail=<%= searchListQuestion.getQuestionDetail()%>">
                                        <div class="QA_title-img">
                                            <img src="<%= searchListQuestion.getAvatar()%>" style="width: 50px; height: 50px; border-radius: 50%;"
                                                 alt="avatar">
                                            <input type="hidden" name="<%= searchListQuestion.getQuestionID()%>" />
                                        </div>
                                        <div class="QA_title-name">
                                            <span style="font-size:15px;"><%= searchListQuestion.getUserName()%></span>
                                        </div>
                                    </a>
                                </div>
                                <div class="QA_comment">
                                    <div class="QA_content">
                                        <a href="#">
                                            <div class="content"><%= searchListQuestion.getQuestionDetail()%></div>
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
                        </div>
                    </div>
                    <%
                        }
                    } else if (SearchlistQuestions.size() == 0) {
                    %>
                    <div>There is no question here!!</div>
                    <%
                                }
                            }
                        }
                    %>
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
