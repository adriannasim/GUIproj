//package src.java.model;
package model;

//import src.java.entity.User;
import entity.Employee;
import entity.User;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EmployeeDAO {

    private DatabaseConn dbConn;
    private PreparedStatement stmt;
    private String tableName = "public.employee";

    public EmployeeDAO() {
        dbConn = new DatabaseConn();
    }

//  RETRIEVE RECORD : ALL, BY USERNAME, BY EMAIL, BY EMPID   
    public ArrayList<Employee> getAllRecord() {
        String queryStr = "SELECT * FROM " + tableName;

//        Address address = new Address();
        ArrayList<Employee> emps = new ArrayList<Employee>();

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
//                address.setAddress(rs.getString(9));
//                address.setCity(rs.getString(10));
//                address.setState(rs.getString(11));
//                address.setPostalCode(rs.getString(12));
//                address.setCountry(rs.getString(13));

                emps.add(new Employee(rs.getString(1),
                        rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9))
                );
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return emps;
    }

    public Employee getRecordByUsername(String username) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE username=?";

//        Address address = new Address();
        Employee emp = null;

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
//                address.setAddress(rs.getString(9));
//                address.setCity(rs.getString(10));
//                address.setState(rs.getString(11));
//                address.setPostalCode(rs.getString(12));
//                address.setCountry(rs.getString(13));

                emp = new Employee(rs.getString(1),
                        rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9));
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return emp;
    }

    public Employee getRecordByEmail(String email) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE email=?";

//        Address address = new Address();
        Employee emp = null;

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
//                address.setAddress(rs.getString(9));
//                address.setCity(rs.getString(10));
//                address.setState(rs.getString(11));
//                address.setPostalCode(rs.getString(12));
//                address.setCountry(rs.getString(13));

                emp = new Employee(rs.getString(1),
                        rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9));
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return emp;
    }

    public Employee getRecordByEmpId(String empid) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE empid=?";

//        Address address = new Address();
        Employee emp = null;

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, empid);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
//                address.setAddress(rs.getString(9));
//                address.setCity(rs.getString(10));
//                address.setState(rs.getString(11));
//                address.setPostalCode(rs.getString(12));
//                address.setCountry(rs.getString(13));

                emp = new Employee(rs.getString(1),
                        rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9));
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return emp;
    }

//  FILTER RECORD : BY USERNAME, BY EMAIL    
    public Employee searchUsername(String username) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE username LIKE ?";

//        Address address = new Address();
        Employee emp = null;

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, "%" + username + "%");
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
//                address.setAddress(rs.getString(9));
//                address.setCity(rs.getString(10));
//                address.setState(rs.getString(11));
//                address.setPostalCode(rs.getString(12));
//                address.setCountry(rs.getString(13));

                emp = new Employee(rs.getString(1),
                        rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9));
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return emp;
    }

    public Employee searchEmail(String email) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE email LIKE ?";

//        Address address = new Address();
        Employee emp = null;

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(2, "%" + email + "%");
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
//                address.setAddress(rs.getString(9));
//                address.setCity(rs.getString(10));
//                address.setState(rs.getString(11));
//                address.setPostalCode(rs.getString(12));
//                address.setCountry(rs.getString(13));

                emp = new Employee(rs.getString(1),
                        rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9));
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return emp;
    }

//  INSERTING RECORD    
    public void insertRecord(String username, String userPwd, String email, String empid, String firstName,
            String lastName, String contactNo, String gender, String emprole) {
        String queryStr = "INSERT INTO " + tableName + " VALUES (?,?,?,?,?,?,?,?,?)";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);

            stmt.setString(1, username);
            stmt.setString(2, userPwd);
            stmt.setString(3, email);
            stmt.setString(4, empid);
            stmt.setString(5, firstName);
            stmt.setString(6, lastName);
            stmt.setString(7, contactNo);
            stmt.setString(8, gender);
            stmt.setString(9, emprole);
            stmt.execute();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

//  UPDATING RECORD 
    public void updateRecord(String username, String userPwd, String email, String empid, String firstName,
            String lastName, String contactNo, String gender, String emprole) {
        String queryStr = "UPDATE " + tableName + " SET userpwd=?,email=?,empid=?,firstname=?,lastname=?,contactno=?,"
                + "gender=?,emprole=?"
                + " WHERE username=?";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, userPwd);
            stmt.setString(2, email);
            stmt.setString(3, empid);
            stmt.setString(4, firstName);
            stmt.setString(5, lastName);
            stmt.setString(6, contactNo);
            stmt.setString(7, gender);
            stmt.setString(8, emprole);
            stmt.setString(9, username);
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
        EmployeeDAO dao = new EmployeeDAO();
    }
    
    // Close DB conncetion
    public void closeConnection() {
        try {
            if (dbConn.returnConnection() != null) {
                dbConn.shutDown();
            }
        } catch (Exception ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.WARNING, null, ex);
        }
    }
}