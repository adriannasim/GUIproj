//package src.java.model;
package model;

import java.sql.*;

public class DatabaseConn {
    private String host = "jdbc:derby://localhost:1527/collegedb";
    private String user = "nbuser";
    private String password = "nbuser";
    private Connection conn;

    public DatabaseConn() {
        createConnection();
    }

    public Connection getConnection(){
        return this.conn;
    }

    private void createConnection() {
        try {
            conn = DriverManager.getConnection(host, user, password);
        } catch (SQLException ex) {
            System.err.println("Error occurred during connection to database: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    public void shutDown() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                System.err.println("Error occurred during closing connection: " + ex.getMessage());
                ex.printStackTrace();
            }
        }
    }
}
