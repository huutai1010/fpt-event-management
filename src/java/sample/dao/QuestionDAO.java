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
import sample.dto.ReplyDTO;
import sample.utils.DBUtils;

/**
 *
 * @author DELL
 */
public class QuestionDAO {

    private static final String LIST_QUESTION = "SELECT q.questionID, q.questionDetail, u.userName, u.avatar, u.userID FROM tblUsers u, tblQuestion q WHERE u.userID = q.userID AND eventID=?";

    private static final String DETAIL_QUESTION = "SELECT q.questionID, q.questionDetail, u.userName, u.avatar, u.userID "
            + "FROM tblUsers u, tblQuestion q WHERE u.userID = q.userID AND q.questionID=? ";

    private static final String LIST_REPLY="SELECT u.userID, u.userName, u.avatar , r.replyDetail , q.questionID "
            + "FROM tblQuestion q, tblReply r, tblUsers u "
            + "WHERE q.questionID = r.questionID AND r.userID = u.userID AND q.questionID=? ";
    
    private static final String CREATE_QUESTION = " INSERT INTO tblQuestion (userID, eventID, questionDetail) VALUES (?,?,?) ";
    
    /* Lấy hết danh sách câu hỏi trang ListQuestion.jsp*/
    public List<QuestionDTO> getAllQuestion(int eventID) throws SQLException {
        List<QuestionDTO> listAllQuestion = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_QUESTION);
                ptm.setInt(1, eventID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int questionID = rs.getInt("questionID");
                    String questionDetail = rs.getString("questionDetail");
                    String userName = rs.getString("userName");
                    String avatar = rs.getString("avatar");
                    int userID = rs.getInt("userID");
                    listAllQuestion.add(new QuestionDTO(eventID, questionID, userID, userName, avatar, questionDetail));
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

    /* Lấy 1 question*/
    public QuestionDTO getDetailQuestion(int questionID, int eventID) throws SQLException {
        QuestionDTO question = new QuestionDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(DETAIL_QUESTION);
            ptm.setInt(1, questionID);
            ptm.setInt(2, eventID);
            rs = ptm.executeQuery();
            if (rs.next()) {
                String questionDetail = rs.getString("questionDetail");
                String userName = rs.getString("userName");
                String avatar = rs.getString("avatar");
                int userID = rs.getInt("userID");
                question = new QuestionDTO(eventID, questionID, userID, userName, avatar, questionDetail);
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
        return question;
    }
    
    /* Lấy hết danh sách Reply*/
    public List<ReplyDTO> getAllReply(int questionID) throws SQLException{
        System.out.println("questionID DAO = " + questionID);
        List<ReplyDTO> listAllReply = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_REPLY);
                ptm.setInt(1, questionID);
                
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int userID = rs.getInt("userID");
                    String userName = rs.getString("userName");
                    String avatar = rs.getString("avatar");
                    String replyDetail = rs.getString("replyDetail");
                    listAllReply.add(new ReplyDTO(userID, userName, avatar, questionID, replyDetail));
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
        return  listAllReply;
    }
    
    public boolean createQuestion(int userID, int eventID, String questionDetail) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{
            conn=DBUtils.getConnection();
            if(conn != null){
                ptm= conn.prepareStatement(CREATE_QUESTION);
                ptm.setInt(1, userID);
                ptm.setInt(2, eventID);
                ptm.setString(3, questionDetail);
                check = ptm.executeUpdate() > 0 ? true : false ;
            }
        }finally{
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}