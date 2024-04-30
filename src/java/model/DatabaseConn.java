//package src.java.model;
package model;

import java.sql.*;

public class DatabaseConn {
    private String host = "jdbc:postgresql://c8lcd8bq1mia7p.cluster-czrs8kj4isg7.us-east-1.rds.amazonaws.com:5432/d1tskl6d9ofiqf?ssl=true&sslmode=require&sslfactory=org.postgresql.ssl.NonValidatingFactory [u360o6893j7kpa on public]";
    private String user = "u360o6893j7kpa";
    private String password = "p0875af3ec2b5e5331ed90fa98e5b014008f67d63411fa4ff661312557111c573";
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
