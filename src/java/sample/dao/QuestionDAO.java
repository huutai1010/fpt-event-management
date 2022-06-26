/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.dto.QuestionDTO;
import sample.utils.DBUtils;

/**
 *
 * @author DELL
 */
public class QuestionDAO {  

    private static final String LIST_QUESTION= "SELECT questionDetail, userName, avatar, eventName "
            + "FROM tblUsers u, tblQuestion q, tblEvent e WHERE u.userID = q.userID AND q.eventID = e.eventID";
    
        private static final String SEARCH_LIST_QUESTION= "SELECT questionDetail, userName, avatar, eventName "
            + "FROM tblUsers u, tblQuestion q, tblEvent e WHERE u.userID = q.userID AND q.eventID = e.eventID AND questionDetail LIKE ?";
    
    public List<QuestionDTO> getAllQuestion() throws SQLException {
        List<QuestionDTO> listAllQuestion = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                ptm = conn.prepareStatement(LIST_QUESTION);
                //ptm.setString(1, string);
                rs = ptm.executeQuery();
                while(rs.next()){
                    String questionDetail = rs.getString("questionDetail");
                    String userName = rs.getString("userName");
                    String avatar = rs.getString("avatar");
                    String eventName = rs.getString("eventName");
                    listAllQuestion.add(new QuestionDTO(userName, eventName, avatar, questionDetail));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listAllQuestion;
    }
    
    public List<QuestionDTO> getSearchQuestion(String searchQuestion) throws SQLException {
        List<QuestionDTO> listAllQuestion = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                ptm = conn.prepareStatement(SEARCH_LIST_QUESTION);
                ptm.setString(1, "%" + searchQuestion + "%");
                rs = ptm.executeQuery();
                while(rs.next()){
                    String questionDetail = rs.getString("questionDetail");
                    String userName = rs.getString("userName");
                    String avatar = rs.getString("avatar");
                    String eventName = rs.getString("eventName");
                    listAllQuestion.add(new QuestionDTO(userName, eventName, avatar, questionDetail));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listAllQuestion;
    }
    
}
