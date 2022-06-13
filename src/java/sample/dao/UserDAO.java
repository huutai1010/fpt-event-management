/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.dto.UserDTO;
import sample.utils.DBUtils;

/**
 *
 * @author Acer
 */
public class UserDAO {

    private static final String LOGIN = "SELECT u.userID, u.userName, u.address, u.phone, u.roleID, r.roleName, u.avatar FROM tblUsers u, tblRoles r WHERE u.roleID = r.roleID and u.email =? AND u.password =? AND u.status=1 ";

    private static final String CREATE_USER = "INSERT INTO tblUsers(email, password, userName, avatar, phone, address, roleID, status) VALUES(?,?,NULL,NULL,NULL,NULL,N'R1',1)";

    private static final String UPDATE_USER = "UPDATE tblUsers SET userName = ?, phone = ?, address = ? WHERE email = ? ";

    public UserDTO checkLogin(String userEmail, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userEmail);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int userID = Integer.parseInt(rs.getString("userID"));
                    String userName = rs.getString("userName");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    String roleName = rs.getString("roleName");
                    String urlAvatar = rs.getString("avatar");
                    user = new UserDTO(userID, userEmail, "", userName, urlAvatar, phone, address, roleName, 1);

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
        return user;
    }

    public boolean create(UserDTO user) throws ClassNotFoundException, SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_USER);
                ptm.setString(1, user.getEmail());
                ptm.setString(2, user.getPassword());
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

    public boolean updateUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_USER);
                ptm.setString(1, user.getUserName());
                ptm.setString(2, user.getPhone());
                ptm.setString(3, user.getAddress());
                ptm.setString(4, user.getEmail());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                ptm.close();
            }
        }
        return check;
    }

}
