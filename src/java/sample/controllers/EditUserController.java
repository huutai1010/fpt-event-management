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
import sample.dao.UserDAO;
import sample.dto.UserDTO;

/**
 *
 * @author Acer
 */
@WebServlet(name = "EditUserController", urlPatterns = {"/EditUserController"})
public class EditUserController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "profile.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

            String loginUserAvatar = loginUser.getUrlAvatar();

            int userID = Integer.parseInt(request.getParameter("userID"));
            String roleName = request.getParameter("roleName");
            String userEmail = request.getParameter("userEmail");
            String password = request.getParameter("password");
            String userName = request.getParameter("userName");
            String urlAvatar = request.getParameter("urlAvatar");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            UserDAO dao = new UserDAO();
            UserDTO user = null;
            if (urlAvatar.equals("")) {
                user = new UserDTO(userID, userEmail, password, userName, loginUserAvatar, phone, address, roleName, 1);
            } else {
                user = new UserDTO(userID, userEmail, password, userName, "images/" + urlAvatar, phone, address, roleName, 1);
            }
            boolean check = dao.updateUser(user);
            if (check) {
                url = SUCCESS;
                session.removeAttribute("LOGIN_USER");
                session.setAttribute("LOGIN_USER", user);
            }
        } catch (Exception e) {
            log("Error at UpdateController: " + e.toString());
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
