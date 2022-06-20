/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dao;

import sample.dto.RegisterDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author DELL
 */
public class RegisterDAO {
    
    private static final String ADD_REGISTER="INSERT INTO tblRegister(registerID, userID, eventID, registerStatus) VALUES (?,?,?,1)" ;
    private static final String LIST_REGISTER="SELECT registerID, tblRegister.eventID, registerStatus";
     
   
    
    
    
    public boolean addRegister(RegisterDTO register) throws SQLException, ClassNotFoundException{
        boolean check=false;
        Connection conn= null;
        PreparedStatement stm= null;
        try{
            conn=DBUtils.getConnection();
            if(conn != null){
                stm = conn.prepareStatement(ADD_REGISTER);
                stm.setInt(1, register.getRegisterID());
                stm.setInt(2, register.getUserID());
                stm.setInt(3, register.getEventID());
                stm.setInt(4, register.getRegisterStatus());
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
    
    public List<RegisterDTO> getListRegister (int userID) throws SQLException{
        List<RegisterDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null) {
                stm = conn.prepareStatement(LIST_REGISTER);
                stm.setInt(1, userID);
                rs = stm.executeQuery();
                while(rs.next()){
                    int registerID = rs.getInt("registerID");
                    int eventID = rs.getInt("eventID");
                    int registerStatus = rs.getInt("registerStatus");           
                    list.add(new RegisterDTO(registerID, eventID, eventID, registerStatus));
                    
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public boolean updateAttendee (int eventID) throws ClassNotFoundException, SQLException{
        boolean check=false;
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBUtils.getConnection();
            if(con !=null){
                String sql = "UPDATE tblEvent SET numberOfAttendees = numberOfAttendees - 1 WHERE eventID=?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, eventID);
                check = stm.executeUpdate() > 0;
            }
        }catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }
}