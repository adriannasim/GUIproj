//package src.java.model;
package model;

//import src.java.entity.User;
import entity.User;
import java.sql.*;
import java.util.*;

/*
1. Username must be unique. 
2. Retrieve all users' record.
3. Retrieve user record by username.
4. Retrieve user record by email.
5. Insert user record.
6. Update user email.
7. Update user password.
8. Delete user record.
*/
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

            if (rs.next()) {
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

    public void updateRecordEmail(String username, String email) {
        String queryStr = "UPDATE " + tableName + " SET email=? WHERE username=?";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, email);
            stmt.setString(2, username);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public void updateRecordPassword(String username, String userPwd) {
        String queryStr = "UPDATE " + tableName + " SET password=? WHERE username=?";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, userPwd);
            stmt.setString(2, username);
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

        // Inserting records: can run
        //userDAO.insertRecord("user1", "pwd1", "user1@gmail.com");
        //userDAO.insertRecord("user2", "pwd2", "user2@gmail.com");
        
        // Get record : can run
        /*
        ArrayList<User> users = userDAO.getAllRecord();
        for (User user:users){
            System.out.println(user.getUsername());
        }
        User usertest1 = userDAO.getRecordByEmail("user1@gmail.com", "pwd1");
        System.out.println(usertest1.getUsername());
        User usertest2 = userDAO.getRecordByUsername("user2", "pwd2");
        System.out.println(usertest2.getUsername());
         */
        
        // Updating record : can run
        /*
        userDAO.updateRecordEmail("user1", "user1Change@gmail.com");
        userDAO.updateRecordPassword("user2", "pwdChange");
        User usertest1 = userDAO.getRecordByEmail("user1Change@gmail.com", "pwd1");
        System.out.println(usertest1.getEmail());
        User usertest2 = userDAO.getRecordByUsername("user2", "pwdChange");
        System.out.println(usertest2.getUserPwd());
         */
        
        // Deleting records : can run
        //userDAO.deleteRecord("user2");
    }

}
