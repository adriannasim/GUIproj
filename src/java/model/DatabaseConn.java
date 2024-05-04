//package src.java.model;
package model;

import java.sql.*;
import java.net.URISyntaxException;
import java.net.URI;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocket;

public class DatabaseConn {

    //private String host = "jdbc:postgresql://c8lcd8bq1mia7p.cluster-czrs8kj4isg7.us-east-1.rds.amazonaws.com:5432/d1tskl6d9ofiqf?ssl=true&sslmode=require&sslfactory=org.postgresql.ssl.NonValidatingFactory";
    //private String user = "u360o6893j7kpa";
    //private String password = "p0875af3ec2b5e5331ed90fa98e5b014008f67d63411fa4ff661312557111c573";

    private String host = "jdbc:derby://localhost:1527/artGallerydb";
    private String user = "nbuser";
    private String password = "nbuser";

    private Connection conn;

    public DatabaseConn() {
        createConnection();
    }

    public Connection returnConnection() {
        return this.conn;
    }

    private void createConnection() {
        //Load the postgre driver
        try {
            Class.forName("org.postgresql.Driver");
            System.out.println("PostgreSQL JDBC Driver loaded successfully");
        } catch (ClassNotFoundException e) {
            System.out.println("PostgreSQL JDBC Driver not found");
            e.printStackTrace();
        }

        try {
            conn = DriverManager.getConnection(host, user, password);
            System.out.println("Success: Connected to DB");
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

    public static void main(String[] args) {
        new DatabaseConn();
    }
}
