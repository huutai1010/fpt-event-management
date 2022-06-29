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
import sample.dto.CommentDTO;
import sample.utils.DBUtils;

/**
 *
 * @author maihuutai
 */
public class CommentDAO {
    private static final String GET_COMMENTS = "SELECT u.avatar, u.userName, c.commmentDetail, e.eventID FROM tblComment c, tblUsers u, tblEvent e WHERE c.userID = u.userID AND c.eventID = e.eventID AND e.eventID = ?";
    private static final String CREATE_COMMENT = "INSERT INTO tblComment (userID, eventID, commmentDetail) VALUES (?,?,?)";
    
    
    public boolean createComment(int userID, int eventID, String commentDetail) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{
            conn=DBUtils.getConnection();
            if(conn != null){
                ptm= conn.prepareStatement(CREATE_COMMENT);
                ptm.setInt(1, userID);
                ptm.setInt(2, eventID);
                ptm.setString(3, commentDetail);
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
    
    public List<CommentDTO> getListComments(int eventID) throws SQLException {
        List<CommentDTO> listComments = new ArrayList();
        CommentDTO comment = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_COMMENTS);
                ptm.setInt(1, eventID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String avatar = rs.getString("avatar");
                    String userName = rs.getString("userName");
                    String commentDetail = rs.getString("commmentDetail");
                    listComments.add(new CommentDTO(avatar, userName, commentDetail));
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
        return listComments;
    }
}
