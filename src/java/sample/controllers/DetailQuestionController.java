/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.dao.QuestionDAO;
import sample.dao.ReplyDAO;
import sample.dto.QuestionDTO;
import sample.dto.ReplyDTO;

/**
 *
 * @author DELL
 */
@WebServlet(name = "DetailQuestionController", urlPatterns = {"/DetailQuestionController"})
public class DetailQuestionController extends HttpServlet {
    
    private static final String ERROR="error.jsp";
    private static final String SUCCESS="DetailQuestion.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        try{      
            HttpSession session = request.getSession();
            int eventID = Integer.parseInt(request.getParameter("eventID"));
            int questionID = Integer.parseInt(request.getParameter("questionID"));
            int userID = Integer.parseInt(request.getParameter("userID"));
            String userName = request.getParameter("userName");
            String avatar = request.getParameter("avatar");
            String questionDetail = request.getParameter("questionDetail");
            String strDate = request.getParameter("date");
            
            ReplyDAO replyDAO = new ReplyDAO();           
            QuestionDTO question = new QuestionDTO(eventID, questionID, userID, userName, avatar, questionDetail, new SimpleDateFormat("yyyy-MM-dd").parse(strDate));
            List<ReplyDTO> listReplies = replyDAO.getAllReply(questionID);
            request.setAttribute("LIST_REPLIES", listReplies);
            request.setAttribute("QUESTION_DETAIL", question);
            if(listReplies.size() >=0){
                url = SUCCESS; 
            }       
        }catch(Exception e){
            log("Error at DetailQuestionController", e);
        }finally{
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
