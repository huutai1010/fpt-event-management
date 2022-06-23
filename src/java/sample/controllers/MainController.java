/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author maihuutai
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_GOOGLE_ACCOUNT = "LoginGoogleAccount";
    private static final String LOGIN_GOOGLE_ACCOUNT_CONTROLLER = "LoginGoogleAccountController";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String SIGNUP = "signUp";
    private static final String SIGNUP_CONTROLLER = "SignUpController";
    private static final String LOGOUT="Logout";
    private static final String LOGOUT_CONTROLLER="LogOutController";
    private static final String SEARCH_HOME = "SearchHome";
    private static final String SEARCH_HOME_CONTROLLER="SearchHomeController";
    private static final String SEARCH_LOGIN = "SearchLogin";
    private static final String SEARCH_LOGIN_CONTROLLER ="SearchLoginController";
    private static final String EDITUSER = "Edit";
    private static final String EDITUSER_CONTROLLER = "EditUserController";
    private static final String DETAIL_EVENT_LOGIN="ShowDetailEventLogin";
    private static final String DETAIL_EVENT_LOGIN_CONTROLLER="DetailEventLoginController";
    private static final String DETAIL_EVENT_HOME="ShowDetailEventHome";
    private static final String DETAIL_EVENT_HOME_CONTROLLER="DetailEventHomeController";
    private static final String REGISTER ="Register";
    private static final String REGISTER_CONTROLLER="RegisterController";
    private static final String UNREGISTER ="UnRegister";
    private static final String UNREGISTER_CONTROLLER="UnRegisterController";
    private static final String FOLLOW ="Follow";
    private static final String FOLLOW_CONTROLLER="FollowController";
    private static final String UNFOLLOW ="UnFollow";
    private static final String UNFOLLOW_CONTROLLER ="UnFollowController";
    private static final String PUBLISH_COMMENT = "PublishComment";
    private static final String COMMENT_CONTROLLER = "CommentController";
    private static final String SHOW_FOLLOWED = "ShowFollowed";
    private static final String SHOW_FOLLOWED_CONTROLLER = "ShowFollowedController";
    private static final String SHOW_REGISTERED = "ShowRegistered";
    private static final String SHOW_REGISTERED_CONTROLLER = "ShowRegisteredController";
    private static final String UNREGISTERV2 = "UnRegisterV2";
    private static final String UNREGISTERV2_CONTROLLER = "UnRegisterControllerV2";
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (LOGIN_GOOGLE_ACCOUNT.equals(action)) {
                url = LOGIN_GOOGLE_ACCOUNT_CONTROLLER;
            } else if(SIGNUP.equals(action)) {
                url = SIGNUP_CONTROLLER;
            }else if(LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            }else if(SEARCH_HOME.equals(action)) {
                url =SEARCH_HOME_CONTROLLER;
            }else if(SEARCH_LOGIN.equals(action)) {
                url =SEARCH_LOGIN_CONTROLLER;
            }else if(EDITUSER.equals(action)) {
                url = EDITUSER_CONTROLLER;
            }else if(DETAIL_EVENT_LOGIN.equals(action)) {
                url = DETAIL_EVENT_LOGIN_CONTROLLER;
            } else if(DETAIL_EVENT_HOME.equals(action)) {
                url = DETAIL_EVENT_HOME_CONTROLLER;
            } else if(REGISTER.equals(action)) {
                url = REGISTER_CONTROLLER;
            } else if (PUBLISH_COMMENT.equals(action)) {
                url = COMMENT_CONTROLLER;
            } else if (FOLLOW.equals(action)){
                url = FOLLOW_CONTROLLER;
            } else if (UNFOLLOW.equals(action)){
                url = UNFOLLOW_CONTROLLER;       
            } else if(UNREGISTER.equals(action)) {
                url = UNREGISTER_CONTROLLER;
            }else if(SHOW_FOLLOWED.equals(action)) {
                url = SHOW_FOLLOWED_CONTROLLER;
            }else if(SHOW_REGISTERED.equals(action)) {
                url = SHOW_REGISTERED_CONTROLLER;
            }else if(UNREGISTERV2.equals(action)) {
                url = UNREGISTERV2_CONTROLLER;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
