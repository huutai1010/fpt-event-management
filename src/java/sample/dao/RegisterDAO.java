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
import java.util.Date;
import java.util.List;
import sample.dto.EventDTO;
import sample.utils.DBUtils;

/**
 *
 * @author DELL
 */
public class RegisterDAO {
    
    //private static final String ADD_REGISTER="INSERT INTO tblRegister(registerID, userID, eventID, registerStatus) VALUES (?,?,?,1)" ;
    private static final String LIST_REGISTER="SELECT registerID, tblRegister.eventID, registerStatus";
    private static final String CREATE_REGISTER_EVENT = "INSERT INTO tblRegister(userID, eventID, registerStatus) VALUES (?,?,1)";
    //private static final String UNREGISTER_EVENT = "UPDATE tblRegister SET registerStatus=? WHERE eventID=? AND userID=? ";
    private static final String UPDATE_EVENT_REGISTER_STATUS="UPDATE tblRegister SET registerStatus=? WHERE eventID=? AND userID=?";
    private static final String CHECK_REGISTER_EXISTENT = "SELECT userID,eventID FROM tblRegister WHERE userID = ? AND eventID=?";
    private static final String CHECK_REGISTER_EXISTENT_ACTIVE = "SELECT userID,eventID FROM tblRegister WHERE userID = ? AND eventID=? AND registerStatus = 1";
    private static final String SHOW_REGISTERED_EVENT="SELECT *\n" +
"FROM tblEvent e, tblLocation l, tblCategory c, tblRegister r\n" +
"WHERE e.categoryID = c.categoryID AND e.locationID = l.locationID AND r.eventID = e.eventID AND r.registerStatus = 1 AND r.userID = ?";
      
    //search su kien o trang show list su kien
    private static final String SEARCH_REGISTERED = "SELECT * FROM tblEvent e, tblLocation l, tblCategory c, tblRegister r\n" +
"         WHERE e.categoryID = c.categoryID \n" +
"		 AND e.locationID = l.locationID \n" +
"		 AND r.eventID = e.eventID\n" +
"		 AND e.eventName LIKE ?\n" +
"		 AND r.registerStatus = 1 ";
    
//    public boolean addRegister(RegisterDTO register) throws SQLException, ClassNotFoundException{
//        boolean check=false;
//        Connection conn= null;
//        PreparedStatement stm= null;
//        try{
//            conn=DBUtils.getConnection();
//            if(conn != null){
//                stm = conn.prepareStatement(ADD_REGISTER);
//                stm.setInt(1, register.getRegisterID());
//                stm.setInt(2, register.getUserID());
//                stm.setInt(3, register.getEventID());
//                stm.setInt(4, register.getRegisterStatus());
//                check = stm.executeUpdate() >0 ? true : false;
//            }    
//        }finally{
//            if (stm != null) {
//                stm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return check;
//    }
    
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
    //--------------------------------------------------------------------------------------------
    public List<EventDTO> getListRegistered (int userID) throws SQLException{
        List<EventDTO> listRegisteredEvents = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null) {
                stm = conn.prepareStatement(SHOW_REGISTERED_EVENT);
                stm.setInt(1, userID);
                rs = stm.executeQuery();
                while(rs.next()){
                    int eventID = rs.getInt("eventID");
                    String categoryName = rs.getString("categoryName");
                    String locationName = rs.getString("locationName");
                    String eventName = rs.getString("eventName");
                    String eventDetail = rs.getString("eventDetail");
                    String posterImage = rs.getString("posterImage");
                    String backgroundImage = rs.getString("backgroundImage");
                    Date date = rs.getDate("date");
                    int numberOfAttendees = rs.getInt("numberOfAttendees");
                    String formality = rs.getString("formality");
                    float ticketPrice = rs.getFloat("ticketPrice");
                    int status = rs.getInt("status");
                    listRegisteredEvents.add(new EventDTO(eventID, categoryName, locationName, eventName, eventDetail, posterImage, backgroundImage, date, numberOfAttendees, formality, ticketPrice, status));                 
                
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
        return listRegisteredEvents;
    }
    
    //-------------------------------------------------------------
    
    public List<EventDTO> getSearchRegistered (String searchKeywordRegister) throws SQLException{
        List<EventDTO> listSearchRegistered = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null) {
                stm = conn.prepareStatement(SEARCH_REGISTERED);
                stm.setString(1, "%" + searchKeywordRegister + "%");
                rs = stm.executeQuery();
                while(rs.next()){
                    int eventID = rs.getInt("eventID");
                    String categoryName = rs.getString("categoryName");
                    String locationName = rs.getString("locationName");
                    String eventName = rs.getString("eventName");
                    String eventDetail = rs.getString("eventDetail");
                    String posterImage = rs.getString("posterImage");
                    String backgroundImage = rs.getString("backgroundImage");
                    Date date = rs.getDate("date");
                    int numberOfAttendees = rs.getInt("numberOfAttendees");
                    String formality = rs.getString("formality");
                    float ticketPrice = rs.getFloat("ticketPrice");
                    int status = rs.getInt("status");
                    listSearchRegistered.add(new EventDTO(eventID, categoryName, locationName, eventName, eventDetail, posterImage, backgroundImage, date, numberOfAttendees, formality, ticketPrice, status));
                    
                    
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
        return listSearchRegistered;
    }
    
    //------------------------------------------------------------------------------------------
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
    
     public boolean registerEvent(int userID, int eventID) throws ClassNotFoundException, SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_REGISTER_EVENT);
                ptm.setInt(1, userID);
                ptm.setInt(2, eventID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    /* check Register tồn tại chưa */
    public boolean isEventRegisterExistent(int userID, int eventID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_REGISTER_EXISTENT);
                ptm.setInt(1, userID);
                ptm.setInt(2, eventID);
                rs = ptm.executeQuery();
                if(rs.next()){
                    check = true;
                }
            }
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
        return check;
    }
    
    /* */
     public boolean isEventRegisterExistentActive(int userID, int eventID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_REGISTER_EXISTENT_ACTIVE);
                ptm.setInt(1, userID);
                ptm.setInt(2, eventID);
                rs = ptm.executeQuery();
                if(rs.next()){
                    check = true;
                }
            }
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
        return check;
    }
    
    
    
    
    /* */
    
    /* */
    public boolean updateEventRegisterStatus(int userID, int eventID, int registerStatus) throws SQLException, ClassNotFoundException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null){
                ptm = conn.prepareStatement(UPDATE_EVENT_REGISTER_STATUS);
                ptm.setInt(1, registerStatus);
                ptm.setInt(2, eventID);
                ptm.setInt(3, userID);
                check = ptm.executeUpdate() > 0 ? true : false;
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
