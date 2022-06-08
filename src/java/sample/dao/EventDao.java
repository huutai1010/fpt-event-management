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
 * @author Acer
 */
public class EventDao {

    
    private static final String SEARCH = "SELECT * FROM tblEvent WHERE eventName LIKE ? AND status = N'1' ";

    public List<EventDTO> getListEvents(String searchEve) throws SQLException {
        List<EventDTO> listEvent = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + searchEve + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String eventID = rs.getString("eventID");
                    int categoryID = Integer.parseInt(rs.getString("categoryID"));
                    int locationID = Integer.parseInt(rs.getString("locationID"));
                    String eventName = rs.getString("eventName");
                    String eventDetail = rs.getString("eventDetail");
                    String image = rs.getString("image");
                    Date startTime =  rs.getDate("startTime");
                    Date endTime = rs.getDate("endTime");
                    int numberOfSeats = Integer.parseInt(rs.getString("numberOfSeats"));
                    String fomality = rs.getString("fomality");
                    int status = Integer.parseInt(rs.getString("status")) ;
                    listEvent.add(new EventDTO(eventID, categoryID, locationID, eventName, eventDetail, image, startTime, endTime, numberOfSeats, fomality, status));

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

}
