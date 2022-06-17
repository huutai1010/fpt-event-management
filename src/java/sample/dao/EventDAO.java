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
import sample.utils.DBUtils;

/**
 *
 * @author maihuutai
 */
public class EventDAO {
    private static final String SEARCH_ALL_EVENTS = "SELECT eventID, categoryName, locationName, eventName, eventDetail, image, FORMAT(startTime, 'yyyy-MM-dd') AS startTime, FORMAT(endTime, 'yyyy-MM-dd') AS endTime, numberOfAttendees, formality, ticketPrice FROM tblEvent e, tblLocation l, tblCategory c WHERE e.locationID = l.locationID AND e.categoryID = c.categoryID";

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
                    String eventID = rs.getString("eventID");
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
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return listAllEvents;
    }
}

