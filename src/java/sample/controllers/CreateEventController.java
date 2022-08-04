/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.dao.BookingDAO;
import sample.dao.EventDAO;
import sample.dto.EventDTO;
import sample.dto.UserDTO;

/**
 *
 * @author maihuutai
 */
@WebServlet(name = "CreateEventController", urlPatterns = {"/CreateEventController"})
public class CreateEventController extends HttpServlet {

    private static final String SUCCESS = "home.jsp";
    private static final String ERROR = "error.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    String url = ERROR;
    try {
        HttpSession session = request.getSession();
        UserDTO loginUser= (UserDTO) session.getAttribute("LOGIN_USER");
        float ticketPrice = Float.parseFloat(request.getParameter("ticketPrice"));
        int numberOfAttendees = Integer.parseInt(request.getParameter("numberOfAttendees"));
        String eventDetail = request.getParameter("eventDetail");
        String posterImage = request.getParameter("posterImage");
        String backgroundImage = request.getParameter("backgroundImage");
        String formality = request.getParameter("formality");
        String categoryID = request.getParameter("categoryID");
        String date = request.getParameter("date");
        String eventName = request.getParameter("eventName");
        String locationID = request.getParameter("place");
        List<String> listSlots = new ArrayList();
        
        for (int i = 1; i <= 8; i++) {
            String slotID = request.getParameter("slot" + i);
            if (slotID != null) {
                listSlots.add(slotID);
            };
        }
        
        EventDAO eventDAO = new EventDAO();
        eventDAO.createEvent(categoryID, locationID, loginUser.getUserID(), eventName, eventDetail, date, backgroundImage, posterImage, numberOfAttendees, formality, ticketPrice, 1);
        
        List<EventDTO> listAllEvents = eventDAO.getAllEvents();
        int eventID = listAllEvents.get(listAllEvents.size() - 1).getEventID();
        
        BookingDAO bookingDAO = new BookingDAO();
        for (String slotID: listSlots) {
            bookingDAO.createBooking(eventID, slotID, locationID, date);
        }
        
        url = SUCCESS;
    } catch (Exception e) {
        
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
