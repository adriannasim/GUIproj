package src.java.model;

import src.java.entity.User;
import java.sql.*;

public class UserDAO {

    private DatabaseConn dbConn;
    private PreparedStatement stmt;
    private String tableName = "user";

    public UserDAO() {
        dbConn = new DatabaseConn();
    }

    public User getAllRecord() {
        String queryStr = "SELECT * FROM " + tableName;
        User user = null;
        try {
            stmt = dbConn.getConnection().prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User(rs.getString("username"), rs.getString("password"), rs.getString("email"));
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return user;
    }

    public User getRecordByUsername(String username, String userPwd) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE username=? AND password=?";
        User user = null;
        try {
            stmt = dbConn.getConnection.prepareStatement(queryStr);
            stmt.setString(1, username);
            stmt.setString(2, userPwd);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User(username, userPwd, rs.getString("email"));
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return user;
    }

    public User getRecordByEmail(String email, String userPwd) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE password=? AND email=?";
        User user = null;
        try {
            stmt = dbConn.getConnection.prepareStatement(queryStr);
            stmt.setString(1, userPwd);
            stmt.setString(2, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User(rs.getString("username"), userPwd, email);
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return user;
    }

    public void insertRecord(String username, String userPwd, String email) {
        String queryStr = "INSERT INTO " + tableName + " VALUES (?,?,?)";
        try {
            stmt = conn.prepareStatement(queryStr);

            stmt.setString(1, username);
            stmt.setString(2, userPwd);
            stmt.setString(3, email);
            stmt.execute();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public void updateRecord(String username, String userPwd, String email) {
        String queryStr = "UPDATE " + tableName + " SET password=?, email=? WHERE username=?";

        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setString(1, userPwd);
            stmt.setString(2, email);
            stmt.setString(3, username);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public void deleteRecord(String username) {
        String queryStr = "DELETE FROM " + tableName + " WHERE username=?";
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setString(1, username);
            stmt.execute();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }
}
