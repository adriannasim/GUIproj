//package src.java.model;
package model;

//import src.java.entity.User;
import entity.User;
import java.sql.*;
import java.util.*;

public class UserDAO {

    private DatabaseConn dbConn;
    private PreparedStatement stmt;
    private String tableName = "public.user";

    public UserDAO() {
        dbConn = new DatabaseConn();
    }

    public ArrayList<User> getAllRecord() {
        String queryStr = "SELECT * FROM " + tableName;
        ArrayList<User> user = new ArrayList<User>();

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                user.add(new User(rs.getString("username"), rs.getString("password"), rs.getString("email")));
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
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
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
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
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

    public User searchUsername(String username) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE username LIKE ?";
        User user = null;

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, "%" + username + "%");
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User(username, rs.getString("password"), rs.getString("email"));
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return user;
    }

    public User searchEmail(String email) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE email LIKE ?";
        User user = null;

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(2, "%" + email +"%");
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User(rs.getString("username"), rs.getString("password"), email);
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return user;
    }

    public void insertRecord(String username, String userPwd, String email) {
        String queryStr = "INSERT INTO " + tableName + " VALUES (?,?,?)";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);

            stmt.setString(1, username);
            stmt.setString(2, userPwd);
            stmt.setString(3, email);
            stmt.execute();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public void updateRecord(String username, String password, String email) {
        String queryStr = "UPDATE " + tableName + " SET password=?,email=? WHERE username=?";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, password);
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
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, username);
            stmt.execute();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();

//        // Inserting records: can run
//        userDAO.insertRecord("user1", "pwd1", "user1@gmail.com");
//        userDAO.insertRecord("user2", "pwd2", "user2@gmail.com");
        // Get record : can run
//        ArrayList<User> users = userDAO.getAllRecord();
//        for (User user:users){
//            System.out.println(user.getUsername());
//        }
//        User usertest1 = userDAO.getRecordByEmail("user1@gmail.com", "pwd1");
//        System.out.println(usertest1.getUsername());
//        User usertest2 = userDAO.getRecordByUsername("user2", "pwd2");
//        System.out.println(usertest2.getUsername());
        // Updating record : can run
//        userDAO.updateRecord("user1", "user1Change@gmail.com", "pwdChange");
//        User usertest1 = userDAO.getRecordByEmail("user1Change@gmail.com", "pwd1");
//        System.out.println(usertest1.getEmail());
        // Deleting records : can run
//        userDAO.deleteRecord("user1");
//        userDAO.deleteRecord("user2");
    }

}
