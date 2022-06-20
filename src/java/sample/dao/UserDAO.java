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

    private static final String LOGIN = "SELECT u.userID, u.userName, u.address, u.phone, u.roleID, r.roleName, u.avatar, u.password FROM tblUsers u, tblRoles r WHERE u.roleID = r.roleID and u.email =? AND u.password =? AND u.status=1 ";

    private static final String CREATE_USER = "INSERT INTO tblUsers(email, password, userName, avatar, phone, address, roleID, status) VALUES(?,?,NULL,NULL,NULL,NULL,N'R1',1)";

    private static final String UPDATE_USER = "UPDATE tblUsers SET userName = ?, phone = ?, address = ?, avatar = ?, password = ?  WHERE userID = ? ";

    private static final String CREATE_GOOGLE_USER = "INSERT INTO tblUsers(email, password, userName, avatar, phone, address, roleID, status) VALUES(?,'****',?,?,NULL,NULL,N'R1',1)";

    private static final String LOGIN_GOOGLE = "SELECT u.userID, u.userName, u.address, u.phone, u.roleID, r.roleName, u.avatar, u.password FROM tblUsers u, tblRoles r WHERE u.roleID = r.roleID AND u.email =? AND u.status=1";

    private static final String CHECK_DUPLICATE_EMAIL = "SELECT * FROM tblUsers WHERE email=? ";

    //private static final String CREATE_GOOGLE_USER_2 = "INSERT ";
    public boolean registerNewUser(UserDTO user) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_GOOGLE_USER);
                ptm.setString(1, user.getEmail());
                ptm.setString(2, user.getUserName());
                ptm.setString(3, user.getUrlAvatar());
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

    public UserDTO checkEmailAccountAlreadyExist(String email) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN_GOOGLE);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int userID = Integer.parseInt(rs.getString("userID"));
                    String userName = rs.getString("userName");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    String roleName = rs.getString("roleName");
                    String urlAvatar = rs.getString("avatar");
                    user = new UserDTO(userID, email, "***", userName, urlAvatar, phone, address, roleName);

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
                    user = new UserDTO(userID, userEmail, password, userName, urlAvatar, phone, address, roleName);

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

    public boolean checkDuplicateEmailCreate(String userEmail) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE_EMAIL);
                ptm.setString(1, userEmail);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
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
        return check;
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
                ptm.setString(4, user.getUrlAvatar());
                ptm.setString(5, user.getPassword());
                ptm.setInt(6, user.getUserID());
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
