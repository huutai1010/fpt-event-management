/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import sample.dto.LocationDTO;
import java.util.ArrayList;
import sample.utils.DBUtils;

/**
 *
 * @author maihuutai
 */
public class LocationDAO {
    
    private static String LIST_LOCATIONS = "SELECT locationID, locationName, locationCapacity FROM tblLocation";
    
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
