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
import javax.servlet.http.HttpSession;
import sample.UserError;
import sample.dao.UserDAO;
import sample.dto.UserDTO;
import sample.regex.ValidateAnEmail;

/**
 *
 * @author Acer
 */
@WebServlet(name = "SignUpController", urlPatterns = {"/SignUpController"})
public class SignUpController extends HttpServlet {

    private static final String ERROR = "sign.jsp";
    private static final String SUCCESS = "home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ValidateAnEmail regex = new ValidateAnEmail();
        UserError userError = new UserError();
        try {         
            String userEmail = request.getParameter("userEmail");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            UserDAO dao = new UserDAO();
            boolean checkValidation = true;
            if (regex.valEmail(userEmail) == false) {
                checkValidation = false;
                userError.setEmailError("Email need to type format Ex:ThanhTran@gmail.com");
            }
            if (!password.equals(confirm)) {
                checkValidation = false;
                userError.setConfirmError("Two passwords are not the same!!");
            }
            //
            if (checkValidation) {
                UserDTO user = new UserDTO(0,userEmail, password, "", "", "", "", "", 1);
                // UserDTO user1 = new UserDTO(0, email, password, "", "", "US", 1);
                boolean checkCreate = dao.create(user);
                if (checkCreate) {
                    url = SUCCESS;
                    UserDTO loginUser = dao.checkLogin(userEmail, password);
                    String roleName = loginUser.getRoleName();
                    HttpSession session = request.getSession();
                    session.setAttribute("LOGIN_USER", loginUser);
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            if (e.toString().contains("duplicate")) {
                userError.setEmailError("The duplicate Email Please type again!!");
                request.setAttribute("USER_ERROR", userError);
            }
            log("Error at CreateUserController: " + e.toString());
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
