/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import sample.dto.FollowDTO;
import sample.utils.DBUtils;

/**
 *
 * @author DELL
 */
public class FollowDAO {
    
    private static final String FOLLOW_EVENT="INSERT INTO tblFollow(eventID, userID, status) VALUES (?,?,1)";
    
    
    public boolean FollowEvent(int userID, int eventID) throws SQLException, ClassNotFoundException{
        boolean check=false;
        Connection conn= null;
        PreparedStatement stm= null;
        try{
            conn=DBUtils.getConnection();
            if(conn != null){
                stm = conn.prepareStatement(FOLLOW_EVENT);
                stm.setInt(1, userID);
                stm.setInt(2, eventID);              
                check = stm.executeUpdate() >0 ? true : false;
            }    
        }finally{
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
