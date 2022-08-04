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
import java.sql.Date;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author maihuutai
 */
public class BookingDAO {
    private static String GET_SLOTS_CHOOSEN = "SELECT e.eventID, e.eventName, e.date, e.locationID, b.slotID, b.date, b.locationID FROM tblEvent e, tblBooking b WHERE e.locationID = b.locationID AND e.date = b.date AND e.eventID = b.eventID AND e.date = ? AND e.locationID = ?";
    private static String CREATE_BOOKING = "INSERT INTO tblBooking VALUES(?, ?, ?, ?)";
    
    
    public List<String> getListBooking(Date date, String locationID) throws SQLException {
        List<String> listSlots = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {          
                ptm = conn.prepareStatement(GET_SLOTS_CHOOSEN);
                ptm.setDate(1, date);
                ptm.setString(2, locationID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String slotID = rs.getString("slotID");
                    listSlots.add(slotID);
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
        return listSlots;
    }

    public boolean createBooking(int eventID, String slotID, String locationID, String date) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_BOOKING);
                ptm.setInt(1, eventID);
                ptm.setString(2, slotID);
                ptm.setString(3, locationID);
                ptm.setString(4, date);
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
}
