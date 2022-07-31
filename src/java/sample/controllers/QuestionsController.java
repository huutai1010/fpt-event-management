/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.dao.QuestionDAO;
import sample.dto.EventDTO;
import sample.dto.QuestionDTO;

/**
 *
 * @author Acer
 */
@WebServlet(name = "QuestionsController", urlPatterns = {"/QuestionsController"})
public class QuestionsController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "ListQuestion.jsp"; // ??

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
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
            String questionDetail = request.getParameter("questionDetail");
            int status = Integer.parseInt(request.getParameter("status"));

            QuestionDAO questionDAO = new QuestionDAO();
            boolean check = questionDAO.createQuestion(userID, eventID, questionDetail);
            if (check) {
                // QuestionDTO question = new QuestionDTO(eventID, userID, userID, eventName, image, questionDetail);
                //List<QuestionDTO> listQuestion = questionDAO.getAllQuestion(eventID);
                //request.setAttribute("LIST_QUESTION", question);
                EventDTO event = new EventDTO(eventID, categoryName, locationName, eventName, eventDetail, posterImage, backgroundImage, date, numberOfAttendees, formality, ticketPrice, status);
                request.setAttribute("DETAIL_EVENT", event);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at QuestionsController", e);
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
