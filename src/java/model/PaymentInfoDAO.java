package model;

import entity.PaymentInfo;
import java.sql.*;
import java.time.LocalDate;
import java.util.*;

public class PaymentInfoDAO {

    private DatabaseConn dbConn;
    private PreparedStatement stmt;
    private String tableName = "public.paymentinfo";

    public PaymentInfoDAO() {
        dbConn = new DatabaseConn();
    }

//  RETRIEVE RECORDS : ALL, BY PAYMENT ID    
    public ArrayList<PaymentInfo> getAllRecord() {
        String queryStr = "SELECT * FROM " + tableName;
        ArrayList<PaymentInfo> paymentInfo = new ArrayList<PaymentInfo>();
        
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                paymentInfo.add(new PaymentInfo(rs.getString(1), 
                        rs.getString(2), rs.getString(3), rs.getString(4),  
                        rs.getDate(5), rs.getDouble(6)
                ));
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return paymentInfo;
    }

    public PaymentInfo getRecordByPaymentId(String paymentid) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE paymentid=?";
        PaymentInfo paymentInfo = null;
        
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, paymentid);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                paymentInfo = new PaymentInfo(rs.getString(1), 
                        rs.getString(2), rs.getString(3), rs.getString(4),  
                        rs.getDate(5), rs.getDouble(6)
                );
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return paymentInfo;
    }

//  FILTER RECORDS BY PAYMENT METHOD    
    public ArrayList<PaymentInfo> searchRecordByPaymentType(String paymentType) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE paymenttype LIKE ?";
        ArrayList<PaymentInfo> paymentInfo = null;
        
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, "%" + paymentType +"%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                paymentInfo.add(new PaymentInfo(rs.getString(1), rs.getString(2), 
                        rs.getString(3), rs.getString(4), 
                        rs.getDate(5), rs.getDouble(6)
                ));
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return paymentInfo;
    }

//  INSERTING RECORD    
    public void insertRecord(String paymentId, String orderId, String custId, String paymentType, 
            LocalDate paymentDate, double paymentAmount) {
        String queryStr = "INSERT INTO " + tableName + " VALUES (?,?,?,?,?,?)";
        
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);

            stmt.setString(1, paymentId);
            stmt.setString(2, orderId);
            stmt.setString(3, custId);
            stmt.setString(4, paymentType);
            java.sql.Date sqlDate = java.sql.Date.valueOf(paymentDate);
            stmt.setDate(5, sqlDate);
            stmt.setDouble(6, paymentAmount);
            stmt.execute();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

//  UPDATING RECORD    
    public void updateRecord(String paymentId, String orderId, String custId, String paymentType, 
            LocalDate paymentDate, double paymentAmount) {
        String queryStr = "UPDATE " + tableName + " SET orderid=?,custid=?,paymenttype=?,paymentdate=?,paymentamount=?"
                + " WHERE paymentid=?";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, orderId);
            stmt.setString(2, custId);
            stmt.setString(3, paymentType);
            java.sql.Date sqlDate = java.sql.Date.valueOf(paymentDate);
            stmt.setDate(4, sqlDate);
            stmt.setDouble(5, paymentAmount);
            stmt.setString(6, paymentId);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

//  DELETING RECORD    
    public void deleteRecord(String paymentId) {
        String queryStr = "DELETE FROM " + tableName + " WHERE paymentId=?";
        
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, paymentId);
            stmt.execute();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public static void main(String[] args) {
        PaymentInfoDAO dao = new PaymentInfoDAO();

//      Insert record 
//        dao.insertRecord("pid", "oid", "cid", "card", LocalDate.now(), 10.5);
//      Get record 
//        ArrayList<PaymentInfo> infos = dao.getAllRecord();
//        for (PaymentInfo info : infos) {
//            System.out.println(info.getPaymentDate());
//        }
//      Delete record 
//      dao.deleteRecord("pid");
    }

}
