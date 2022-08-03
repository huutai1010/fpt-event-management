/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import sample.utils.DBUtils;

/**
 *
 * @author maihuutai
 */
public class ReplyDAO {
    
    private static final String CREATE_REPLY = "INSERT INTO tblReply (userID, questionID, replyDetail, date) VALUES (?,?,?,?)";

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
    
}
