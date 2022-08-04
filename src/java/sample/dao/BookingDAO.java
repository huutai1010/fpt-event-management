/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author maihuutai
 */
public class BookingDAO {
    private static String GET_SLOTS_CHOOSEN = "SELECT e.eventID, e.eventName, e.date, e.locationID, b.slotID, b.date, b.locationID FROM tblEvent e, tblBooking b WHERE e.locationID = b.locationID AND e.date = b.date AND e.eventID = b.eventID AND e.date = ? AND e.locationID = ?";
    
    public List<LocationDTO> getAllLocations() throws SQLException {
        List<LocationDTO> listLocations = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_LOCATIONS);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String questionID = rs.getString("locationID");
                    String questionDetail = rs.getString("locationName");
                    int locationCapcity = rs.getInt("locationCapacity");
                    listLocations.add(new LocationDTO(questionID, questionDetail, locationCapcity));
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
        return listLocations;
    }
}
