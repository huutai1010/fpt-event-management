/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.dao.RegisterDAO;
import sample.dto.EventDTO;
import sample.dto.UserDTO;
import sample.mail.JavaMailUtil;

/**
 *
 * @author DELL
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "detailHome.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
              
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            
            int eventID = Integer.parseInt(request.getParameter("eventID"));
            int userID = Integer.parseInt(request.getParameter("userID"));
            String categoryName = request.getParameter("categoryName");
            String locationName = request.getParameter("locationName");
            String eventName = request.getParameter("eventName");
            String eventDetail = request.getParameter("eventDetail");
            String posterImage = request.getParameter("posterImage");
            String backgroundImage = request.getParameter("backgroundImage");
            Date date = Date.valueOf(request.getParameter("date"));
            int numberOfAttendees = Integer.parseInt(request.getParameter("numberOfAttendees"));
            String formality = request.getParameter("formality");
            float ticketPrice = Float.parseFloat(request.getParameter("ticketPrice"));
            //int price = Integer.parseInt(request.getParameter("price"));
            int status = Integer.parseInt(request.getParameter("status"));
            RegisterDAO registerDAO = new RegisterDAO(); 
            
            System.out.println("Before check");
            boolean check = false;
            boolean isEventRegisterExistent = registerDAO.isEventRegisterExistent(userID, eventID);
            if (isEventRegisterExistent) {
                check = registerDAO.updateEventRegisterStatus(userID, eventID, 1); // Update register status that status = 0 before udating
            }else{
                check = registerDAO.registerEvent(userID, eventID); // Add new register to tblRegister
            }           
            System.out.println("RegisterController check = " + check);
            String message = "";
            if(check){
                System.out.println("Current login user email = " + loginUser.getEmail());
                System.out.println("RegisterController check = " + check);
                JavaMailUtil.sendMail(loginUser.getEmail(), loginUser.getUserName(), eventName, posterImage); //Send email to current login user
                message = "Register successfully";
                url = SUCCESS;
            }
            EventDTO event = new EventDTO(eventID, categoryName, locationName, eventName, eventDetail, posterImage, backgroundImage, date, numberOfAttendees, formality, ticketPrice, status);
            request.setAttribute("DETAIL_EVENT", event);
            //request.setAttribute("REGISTER_CHECK", check);
            
            request.setAttribute("MESSAGE_REGISTER", message);      
        } catch (Exception e) {
            log("Error at RegisterController: " + e.toString());
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
