//package src.java.model;
package model;

//import src.java.entity.User;
import entity.Address;
import entity.Customer;
import entity.User;
import java.sql.*;
import java.util.*;

public class CustomerDAO {

    private DatabaseConn dbConn;
    private PreparedStatement stmt;
    private String tableName = "public.customer";

    public CustomerDAO() {
        dbConn = new DatabaseConn();
    }

//  RETRIEVE RECORD : ALL, BY USERNAME, BY EMAIL    
    public ArrayList<Customer> getAllRecord() {
        String queryStr = "SELECT * FROM " + tableName;

        Address address = new Address();
        ArrayList<Customer> custs = new ArrayList<Customer>();

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                address.setAddress(rs.getString(9));
                address.setCity(rs.getString(10));
                address.setState(rs.getString(11));
                address.setPostalCode(rs.getString(12));
                address.setCountry(rs.getString(13));

                custs.add(new Customer(rs.getString(1),
                        rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getDate(7), rs.getString(8), address)
                );
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return custs;
    }

    public Customer getRecordByUsername(String username, String userPwd) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE username=? AND userpwd=?";

        Address address = new Address();
        Customer cust = null;

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, username);
            stmt.setString(2, userPwd);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                address.setAddress(rs.getString(9));
                address.setCity(rs.getString(10));
                address.setState(rs.getString(11));
                address.setPostalCode(rs.getString(12));
                address.setCountry(rs.getString(13));

                cust = new Customer(rs.getString(1),
                        rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getDate(7), rs.getString(8), address);
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return cust;
    }

    public Customer getRecordByEmail(String email, String userPwd) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE userpwd=? AND email=?";

        Address address = new Address();
        Customer cust = null;

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, userPwd);
            stmt.setString(2, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                address.setAddress(rs.getString(9));
                address.setCity(rs.getString(10));
                address.setState(rs.getString(11));
                address.setPostalCode(rs.getString(12));
                address.setCountry(rs.getString(13));

                cust = new Customer(rs.getString(1),
                        rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getDate(7), rs.getString(8), address);
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return cust;
    }

//  FILTER RECORD : BY USERNAME, BY EMAIL    
    public Customer searchUsername(String username) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE username LIKE ?";

        Address address = new Address();
        Customer cust = null;

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, "%" + username + "%");
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                address.setAddress(rs.getString(9));
                address.setCity(rs.getString(10));
                address.setState(rs.getString(11));
                address.setPostalCode(rs.getString(12));
                address.setCountry(rs.getString(13));

                cust = new Customer(rs.getString(1),
                        rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getDate(7), rs.getString(8), address);
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return cust;
    }

    public Customer searchEmail(String email) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE email LIKE ?";

        Address address = new Address();
        Customer cust = null;

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(2, "%" + email + "%");
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                address.setAddress(rs.getString(9));
                address.setCity(rs.getString(10));
                address.setState(rs.getString(11));
                address.setPostalCode(rs.getString(12));
                address.setCountry(rs.getString(13));

                cust = new Customer(rs.getString(1),
                        rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getDate(7), rs.getString(8), address);
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return cust;
    }

//  INSERTING RECORD    
    public void insertRecord(String username, String userPwd, String email, String firstName, 
            String lastName, String contactNo, java.util.Date dateOfBirth, String gender, Address custAdd) {
        String queryStr = "INSERT INTO " + tableName + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);

            stmt.setString(1, username);
            stmt.setString(2, userPwd);
            stmt.setString(3, email);
            stmt.setString(4, firstName);
            stmt.setString(5, lastName);
            stmt.setString(6, contactNo);
            stmt.setDate(7, new java.sql.Date(dateOfBirth.getTime()));
            stmt.setString(8, gender);
            stmt.setString(9, custAdd.getAddress());
            stmt.setString(10, custAdd.getCity());
            stmt.setString(11, custAdd.getState());
            stmt.setString(12, custAdd.getPostalCode());
            stmt.setString(13, custAdd.getCountry());
            stmt.execute();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

//  UPDATING RECORD 
    public void updateRecord(String username, String userPwd, String email, String firstName, 
            String lastName, String contactNo, java.util.Date dateOfBirth, String gender, Address custAdd) {
        String queryStr = "UPDATE " + tableName + " SET userpwd=?,email=?,firstname=?,lastname=?,contactno=?,"
                + "dateofbirth=?,gender=?,address=?,city=?,state=?,postalcode=?,country=?"
                + " WHERE username=?";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, userPwd);
            stmt.setString(2, email);
            stmt.setString(3, firstName);
            stmt.setString(4, lastName);
            stmt.setString(5, contactNo);
            stmt.setDate(6, new java.sql.Date(dateOfBirth.getTime()));
            stmt.setString(7, gender);
            stmt.setString(8, custAdd.getCountry());
            stmt.setString(9, custAdd.getCountry());
            stmt.setString(10, custAdd.getCountry());
            stmt.setString(11, custAdd.getCountry());
            stmt.setString(12, custAdd.getCountry());
            stmt.setString(13, username);
            stmt.executeUpdate();
            
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

//  DELETING RECORD    
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
        CustomerDAO dao = new CustomerDAO();
    }

}
