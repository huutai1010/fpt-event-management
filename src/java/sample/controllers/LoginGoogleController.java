/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import sample.dto.UserGoogleDTO;
import sample.constants.Constants;
import sample.dao.UserDAO;
import sample.dto.UserDTO;

/**
 *
 * @author maihuutai
 */
@WebServlet(name = "LoginGoogleController", urlPatterns = {"/LoginGoogleController"})
public class LoginGoogleController extends HttpServlet {
    
    private static final String ERROR = "error.jsp";
    private static final String DETAIL_EVENT_HOME_CONTROLLER = "DetailEventHomeController";
    private static final String HOME = "home.jsp";
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        System.out.println(request.getParameter("code"));
        String code = request.getParameter("code");
        //String eventID = (String) request.getAttribute("eventID"); // get eventID
        HttpSession session = request.getSession();
        String eventID = (String) session.getAttribute("eventID"); // get eventID from session
        System.out.println("LoginGoogleController eventID  ==================" + (eventID.equals("") ? "eventID not null but \"\"" : eventID)); // Đã có eventID
        String accessToken = getToken(code);
        System.out.println("accessToken = " + accessToken);
        UserGoogleDTO user = getUserInfo(accessToken);
        try {
            String email = user.getEmail();
            UserDAO userDAO = new UserDAO();
            UserDTO loginUser = userDAO.checkEmailAccountAlreadyExist(email);
            if (loginUser == null) {
                String name = user.getName();
                String picture = user.getPicture();
                loginUser = new UserDTO(1, email, "", name, picture, "", "", "US");
                boolean check = userDAO.registerNewUser(loginUser);
                if (check) {
                    System.out.println("create google user successfully");
                } else {
                    System.out.println("create google user fail!!!");
                }
                loginUser = userDAO.checkEmailAccountAlreadyExist(email); 
            } 
            // if loginUser google not in database => create in database and get login user dto again            
            // now we have loginuser
            // if eventID is not null and not = "" => login from detail event
            // if eventID = "" => login from login.jsp
                    
            
            if (eventID.equals("")) {
                url = HOME;
                System.out.println("Đăng nhập từ nút Login");
            } else if (eventID.length() > 0) {
                url = DETAIL_EVENT_HOME_CONTROLLER;
                System.out.println("Đăng nhập từ Comment");
            }
            
            
            session.setAttribute("LOGIN_USER", loginUser);
            //session.removeAttribute("eventID");
            request.setAttribute("eventID", eventID);
            
            System.out.println("eventID.equals(\"\") = " + eventID.equals(""));
            System.out.println("eventID = hahaha " + eventID);
        } catch (Exception e) {
            log("Error at LoginGoogleController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }

    public static String getToken(final String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        System.out.println("response = " + response);
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        System.out.println("accessToken = " + accessToken);
        return accessToken;
    }

    public static UserGoogleDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        System.out.println(response);
        UserGoogleDTO googlePojo = new Gson().fromJson(response, UserGoogleDTO.class);
        //System.out.println(googlePojo);
        return googlePojo;
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
