/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import sample.dto.ReplyDTO;
import sample.utils.DBUtils;

/**
 *
 * @author maihuutai
 */
public class ReplyDAO {
    
    private static final String CREATE_REPLY = "INSERT INTO tblReply (userID, questionID, replyDetail, date) VALUES (?,?,?,?)";
    private static final String LIST_REPLY="SELECT u.userID, u.userName, u.avatar , r.replyDetail , q.questionID, FORMAT(r.date, 'yyyy-MM-dd') AS date "
            + "FROM tblQuestion q, tblReply r, tblUsers u "
            + "WHERE q.questionID = r.questionID AND r.userID = u.userID AND q.questionID=?";
    private static final String COUNT_REPLIES = "SELECT q.questionID, COUNT(r.replyID) AS replies FROM tblQuestion q FULL JOIN tblReply r ON q.questionID = r.questionID WHERE q.eventID = ? GROUP BY q.questionID";
    
    public boolean createReply(int loginUserID, int questionID, String reply, Date date) throws SQLException, ClassNotFoundException {
       boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{
            conn=DBUtils.getConnection();
            if(conn != null){
                ptm= conn.prepareStatement(CREATE_REPLY);
                ptm.setInt(1, loginUserID);
                ptm.setInt(2, questionID);
                ptm.setString(3, reply);
                ptm.setDate(4, date);
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
    
    
    /* Lấy hết danh sách Reply*/
    public List<ReplyDTO> getAllReply(int questionID) throws SQLException{
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
                    Date date = rs.getDate("date");
                    listAllReply.add(new ReplyDTO(userID, userName, avatar, questionID, replyDetail, date));
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
    
    
    public List<Integer> countReply(int eventID) throws SQLException{
        System.out.println("eventID = " + eventID);
        List<Integer> listCountReplies = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNT_REPLIES);
                ptm.setInt(1, eventID);
                
                rs = ptm.executeQuery();
                while (rs.next()) {                
                    int count = rs.getInt("replies");
                    listCountReplies.add(count);
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
        return listCountReplies;
    }
}
