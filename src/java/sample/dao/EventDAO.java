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
import java.util.Date;
import java.util.List;
import sample.dto.EventDTO;
import sample.dto.RegisterDTO;
import sample.utils.DBUtils;

/**
 *
 * @author maihuutai
 */
public class EventDAO {

    private static final String SEARCH_ALL_EVENTS = "SELECT eventID, categoryName, locationName, eventName, eventDetail, image, FORMAT(startTime, 'yyyy-MM-dd') AS startTime, FORMAT(endTime, 'yyyy-MM-dd') AS endTime, numberOfAttendees, formality, ticketPrice FROM tblEvent e, tblLocation l, tblCategory c WHERE e.locationID = l.locationID AND e.categoryID = c.categoryID";
    private static final String SEARCH_EVENTS = "SELECT eventID, categoryName, locationName, eventName, eventDetail, image, FORMAT(startTime, 'yyyy-MM-dd') AS startTime, FORMAT(endTime, 'yyyy-MM-dd') AS endTime, numberOfAttendees, formality, ticketPrice FROM tblEvent e, tblLocation l, tblCategory c WHERE e.locationID = l.locationID AND e.categoryID = c.categoryID AND e.eventName LIKE ? AND status = '1'";
    private static final String DETAIL_EVENT = "SELECT categoryName, locationName, eventName, eventDetail, image, FORMAT(startTime, 'yyyy-MM-dd') AS startTime, FORMAT(endTime, 'yyyy-MM-dd') AS endTime, numberOfAttendees, formality, ticketPrice FROM tblEvent e, tblLocation l, tblCategory c WHERE e.locationID = l.locationID AND e.categoryID = c.categoryID AND eventID=? AND status = '1'";
    private static final String EVENT_REGISTER = "INSERT INTO tblRegister(userID, eventID, registerStatus) VALUES (?,?,1)";

    public int checkTimeOfEvent(EventDTO event) {
        Date today = new Date();
        System.out.println("TODAY" + today.toString());
        int ans = -1;
        if (event.getStartTime().before(today) && event.getEndTime().before(today)) {
            ans = -1;
        } else if (event.getStartTime().before(today) && event.getEndTime().after(today)) {
            ans = 0;
        } else if (event.getStartTime().after(today) && event.getEndTime().after(today)) {
            ans = 1;
        }
        return ans;
    }

    public List<EventDTO> getAllEvents() throws SQLException {
        List<EventDTO> listAllEvents = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_ALL_EVENTS);
                //ptm.setString(1, "%"+"%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int eventID = rs.getInt("eventID");
                    String categoryName = rs.getString("categoryName");
                    String locationName = rs.getString("locationName");
                    String eventName = rs.getString("eventName");
                    String eventDetail = rs.getString("eventDetail");
                    String image = rs.getString("image");
                    Date startTime = rs.getDate("startTime");
                    Date endTime = rs.getDate("endTime");
                    int numberOfAttendees = rs.getInt("numberOfAttendees");
                    String formality = rs.getString("formality");
                    float ticketPrice = rs.getFloat("ticketPrice");
                    listAllEvents.add(new EventDTO(eventID, categoryName, locationName, eventName, eventDetail, image, startTime, endTime, numberOfAttendees, formality, ticketPrice));
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
        return listAllEvents;
    }

    public List<EventDTO> getSearchEvents(String searchKeyword) throws SQLException {
        List<EventDTO> listEvent = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_EVENTS);
                ptm.setString(1, "%" + searchKeyword + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int eventID = rs.getInt("eventID");
                    String categoryName = rs.getString("categoryName");
                    String locationName = rs.getString("locationName");
                    String eventName = rs.getString("eventName");
                    String eventDetail = rs.getString("eventDetail");
                    String image = rs.getString("image");
                    Date startTime = rs.getDate("startTime");
                    Date endTime = rs.getDate("endTime");
                    int numberOfAttendees = rs.getInt("numberOfAttendees");
                    String formality = rs.getString("formality");
                    float ticketPrice = rs.getFloat("ticketPrice");

                    listEvent.add(new EventDTO(eventID, categoryName, locationName, eventName, eventDetail, image, startTime, endTime, numberOfAttendees, formality, ticketPrice));
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
        return listEvent;
    }

    public EventDTO getDetailEvent(int eventID) throws SQLException {
        EventDTO event = new EventDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(DETAIL_EVENT);
            ptm.setInt(1, eventID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                String categoryName = rs.getString("categoryName");
                String locationName = rs.getString("locationName");
                String eventName = rs.getString("eventName");
                String eventDetail = rs.getString("eventDetail");
                String image = rs.getString("image");
                Date startTime = rs.getDate("startTime");
                Date endTime = rs.getDate("endTime");
                int numberOfAttendees = rs.getInt("numberOfAttendees");
                String formality = rs.getString("formality");
                float ticketPrice = rs.getFloat("ticketPrice");

                event = new EventDTO(eventID, categoryName, locationName, eventName, eventDetail, image, startTime, endTime, numberOfAttendees, formality, ticketPrice);
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
        return event;
    }
    
    public boolean registerEvent(int userID, int eventID) throws ClassNotFoundException, SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{
            conn=DBUtils.getConnection();
            if(conn != null){
                ptm= conn.prepareStatement(EVENT_REGISTER);
                ptm.setInt(1, userID);
                ptm.setInt(2, eventID);
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
