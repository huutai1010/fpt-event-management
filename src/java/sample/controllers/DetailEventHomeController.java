/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.dao.EventDAO;
import sample.dto.EventDTO;

/**
 *
 * @author maihuutai
 */
@WebServlet(name = "DetailEventHomeController", urlPatterns = {"/DetailEventHomeController"})
public class DetailEventHomeController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "detailHome.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
              int eventID;
              HttpSession session = request.getSession();
              String strEventID = (String) session.getAttribute("eventID");
              if (strEventID != null && strEventID.length() > 0) {
                  eventID = Integer.parseInt(strEventID); // login from comment, if strEventID > 0 mean it equal 2 or 3 or any int number               
              } else {
                  eventID = Integer.parseInt(request.getParameter("eventID")); // if eventID = "", user click detail event to get new eventID,  use this case (login from login button)
              }
//            int eventID = 0;
//            String eventIDSession = (String) session.getAttribute("eventID");
//            if (eventIDSession != null) {
//            eventID = Integer.parseInt(eventIDSession);
//            } else {
//                eventID = Integer.parseInt(request.getParameter("eventID"));
//            }           
            System.out.println("DetailEventController strEventID = " + strEventID);
            
            session.removeAttribute("eventID");
            EventDAO dao = new EventDAO();
            EventDTO oneEvent = dao.getDetailEvent(eventID);  // Get detail event       
            if (oneEvent != null) {
                request.setAttribute("DETAIL_EVENT", oneEvent);
                
                url = SUCCESS;
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
