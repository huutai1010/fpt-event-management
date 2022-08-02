<%-- 
    Document   : answerQuestion
    Created on : Jun 26, 2022, 9:50:51 PM
    Author     : DELL
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="sample.dto.ReplyDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.dto.QuestionDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Answer Question page</title>
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

        <link rel="stylesheet" href="CSS/answer.css">
    </head>
    <body>
        <%
            QuestionDTO question = (QuestionDTO) request.getAttribute("QUESTION_DETAIL");
            
        %>
        <div class="wrapper">
            <header class="header">
                <div class="header_container container">
                    <div class="header__logo">
                        <a href="home.jsp"><img src="./img/F Event.png" alt="..."></a>
                    </div>
                    <div class="header__search">
                        <input type="text" placeholder="Find Detail Question">
                    </div>
                </div>
            </header>

            <section class="section">
                <div class="container">
                    <div class="answer_header">
                        <h3 style="text-align: center;color: red" >Answer</h3>
                    </div>
                    <div class="answer">
                        <div class="answer_container">
                            <!-- Sidebar -->
                            <aside class="container__sidebar">
                                <a href="#">
                                    <div class="answer_title-img">
                                        <img src="<%= question.getAvatar()%>" style="width: 50px; height: 50px; border-radius: 50%;"
                                             alt="avatar">
                                    </div>
                                    <div class="answer_title-name">
                                        <span style="font-size:15px;"><%= question.getUserName()%></span>
                                    </div>
                                </a>
                            </aside>

                            <!-- Main -->
                            <main class="container__main">
                                <div class="content"><%= question.getQuestionDetail()%>
                                </div>
                            </main>
                        </div>
                        <div class="comment-text bg-line px-5 pt-2">
                            <div class="d-flex flex-row align-items-start">
                                <img src="./img/02-3.jpg" alt="" class="rounded-circle" width="45">
                                <textarea class="form-control ml-1 shadow-none textarea" placeholder="Type reply" ></textarea>
                            </div>
                            <div class="mt-2 text-right">
                                <!--<button class="btn btn-success btn-sm shadow-none" type="button">Post</button>-->
                                <a href="MainController?action=PostReply" class="btn btn-success btn-sm shadow-none">Post</a>
                            </div>
                        </div>
                        <%                            
                            List<ReplyDTO> listReplies = (List<ReplyDTO>)request.getAttribute("LIST_REPLIES");
                            if (listReplies != null) {
                                if (listReplies.size() >= 0) {
                                    for (ReplyDTO reply : listReplies) {

                        %>
                        <div class="QA_card">
                            <div class="QA_title">
                                <a href="#">
                                    <div class="QA_title-img">
                                        <img src="<%= reply.getAvatar() %>" style="width: 50px; height: 50px; border-radius: 50%;" alt="avatar">
                                    </div>
                                    <div class="QA_title-name">
                                        <span style="font-size:15px;"><%= reply.getUserName() %></span>
                                    </div>
                                </a>
                            </div>
                            <div class="QA_comment">
                                <div class="QA_content">
                                    <a href="#">
                                        <div class="content"><%= reply.getReplyDetail()%></div>
                                    </a>
                                </div>
                                <div class="QA_info">
                                    <div class="QA_info-time">
                                        <span><b>june 25, 2022</b></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        }
                    %>
                        <!-- 2 -->

                        <!-- 3 -->

                        <!-- 4 -->

                        <!-- 5 -->

                    </div>
                </div>
                        
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
