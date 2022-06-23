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
import sample.dto.FollowDTO;
import sample.utils.DBUtils;

/**
 *
 * @author DELL
 */
public class FollowDAO {

    private static final String CREATE_FOLLOW_EVENT = "INSERT INTO tblFollow(eventID, userID, status) VALUES (?,?,1)";
    private static final String CHECK_FOLLOW_EXISTENT = "SELECT eventID, userID FROM tblFollow WHERE eventID = ? AND userID =?";
    private static final String UPDATE_EVENT_FOLLOW_STATUS = "UPDATE tblFollow SET status=? WHERE eventID=? AND userID=?";
    private static final String CHECK_FOLLOW_EXISTENT_ACTIVE = "SELECT userID,eventID FROM tblFollow WHERE userID = ? AND eventID=? AND status = 1";

    private static final String GET_LIST_FOLLOWED_EVENT = "SELECT * FROM tblFollow f, tblEvent e, tblUsers u,tblCategory c, tblLocation l\n" +
"                                       WHERE f.userID = u.userID \n" +
"									   AND f.eventID = e.eventID \n" +
"									   AND e.categoryID = c.categoryID\n" +
"									   AND e.locationID = l.locationID\n" +
"									   AND u.userID = ? AND f.status=1";

    public boolean followEvent(int eventID, int userID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(CREATE_FOLLOW_EVENT);
                stm.setInt(1, eventID);
                stm.setInt(2, userID);
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean isEventFollowExistent(int eventID, int userID) throws ClassNotFoundException, SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_FOLLOW_EXISTENT);
                ptm.setInt(1, eventID);
                ptm.setInt(2, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
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

    public boolean isEventRegisterExistentActive(int userID, int eventID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_FOLLOW_EXISTENT_ACTIVE);
                ptm.setInt(1, userID);
                ptm.setInt(2, eventID);
                rs = ptm.executeQuery();
                if (rs.next()) {
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

    //-----------------------------------------------------------------------------------------------------------
    public boolean updateEventFollowStatus(int eventID, int userID, int status) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_EVENT_FOLLOW_STATUS);
                ptm.setInt(1, status);
                ptm.setInt(2, eventID);
                ptm.setInt(3, userID);
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

    public List<EventDTO> getListFollowedEvents(int userID) throws SQLException {
        List<EventDTO> listAllEvents = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_FOLLOWED_EVENT);
                ptm.setInt(1, userID);
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
}