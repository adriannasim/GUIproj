package model;

import entity.PaymentCard;
import java.sql.*;
import java.util.ArrayList;

public class PaymentCardDAO {

    private DatabaseConn dbConn;
    private PreparedStatement stmt;
    private String tableName = "public.paymentcard";

//  RETRIEVE RECORD : ALL, BY CARD NUMBER & CARD NAME, BY CUSTID    
    public ArrayList<PaymentCard> getAllRecord() {
        String queryStr = "SELECT * FROM " + tableName;
        ArrayList<PaymentCard> paymentcard = new ArrayList<PaymentCard>();

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                paymentcard.add(new PaymentCard(rs.getString(1), rs.getInt(2),
                        rs.getInt(3), rs.getString(4), rs.getString(5),
                        rs.getString(6)));
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return paymentcard;
    }

    public PaymentCard getRecordByCardnameCardnumber(String cardname, String cardnumber) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE cardname=? AND cardnumber=?";
        PaymentCard paymentcard = null;

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cardname);
            stmt.setString(2, cardnumber);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                paymentcard = new PaymentCard(rs.getString(1), rs.getInt(2),
                        rs.getInt(3), rs.getString(4), rs.getString(5),
                        rs.getString(6));
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return paymentcard;
    }

    public ArrayList<PaymentCard> getRecordByCustId(String custid) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE custid=?";
        ArrayList<PaymentCard> paymentcard = new ArrayList<PaymentCard>();

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                paymentcard.add(new PaymentCard(rs.getString(1), rs.getInt(2),
                        rs.getInt(3), rs.getString(4), rs.getString(5),
                        rs.getString(6)));
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return paymentcard;
    }

//  INSERTING RECORD    
    public void insertRecord(String cardName, int dateMonth, int dateYear, String cardNumber, String cvv, String custId) {
        String queryStr = "INSERT INTO " + tableName + " VALUES (?,?,?,?,?,?)";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);

            stmt.setString(1, cardName);
            stmt.setInt(2, dateMonth);
            stmt.setInt(3, dateYear);
            stmt.setString(4, cardNumber);
            stmt.setString(5, cvv);
            stmt.setString(6, custId);
            stmt.execute();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

//  UPDATING RECORD    
    public void updateRecord(String cardName, int dateMonth, int dateYear, String cardNumber, String cvv, String custId) {
        String queryStr = "UPDATE " + tableName 
                + " SET datemonth=?,dateyear=?,cvv=?,custid=? WHERE cardname=? AND cardnumber=?";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setInt(1, dateMonth);
            stmt.setInt(2, dateYear);
            stmt.setString(3, cvv);
            stmt.setString(4, custId);
            stmt.setString(5, cardName);
            stmt.setString(6, cardNumber);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

//  DELETING RECORD    
    public void deleteRecord(String cardname, String cardnumber) {
        String queryStr = "DELETE FROM " + tableName + " WHERE cardname=? AND cardnumber=?";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cardname);
            stmt.setString(2, cardnumber);
            stmt.execute();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

}
