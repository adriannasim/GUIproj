package model;

import entity.PaymentCard;
import java.sql.*;
import java.util.ArrayList;

public class PaymentCardDAO {

    private DatabaseConn dbConn;
    private PreparedStatement stmt;
    private String tableName = "public.paymentcard";

    public ArrayList<PaymentCard> getAllRecord() {
        String queryStr = "SELECT * FROM " + tableName;
        ArrayList<PaymentCard> paymentcard = new ArrayList<PaymentCard>();
        
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                paymentcard.add(new PaymentCard(rs.getString(1), rs.getString(2),
                        rs.getInt(3), rs.getInt(4), rs.getString(5),
                        rs.getString(6), rs.getString(7)));
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return paymentcard;
    }

    public PaymentCard getRecordByCardId(String cardId) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE cardid=?";
        PaymentCard paymentcard = null;
        
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cardId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                paymentcard = new PaymentCard(rs.getString(1), rs.getString(2),
                        rs.getInt(3), rs.getInt(4), rs.getString(5),
                        rs.getString(6), rs.getString(7));
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
                paymentcard.add(new PaymentCard(rs.getString(1), rs.getString(2),
                        rs.getInt(3), rs.getInt(4), rs.getString(5),
                        rs.getString(6), rs.getString(7)));
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return paymentcard;
    }
    
    public void insertRecord(String cardId, String cardName, int dateMonth, int dateYear, String cardNumber, 
            String cvv, String custId) {
        String queryStr = "INSERT INTO " + tableName + " VALUES (?,?,?,?,?,?,?)";
        
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);

            stmt.setString(1, cardId);
            stmt.setString(2, cardName);
            stmt.setInt(3, dateMonth);
            stmt.setInt(4, dateYear);
            stmt.setString(5, cardNumber);
            stmt.setString(6, cvv);
            stmt.setString(7, custId);
            stmt.execute();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public void updateRecord(String cardId, String cardName, int dateMonth, int dateYear, String cardNumber, 
            String cvv, String custId) {
        String queryStr = "UPDATE " + tableName 
                + " SET cardname=?,datemonth=?,dateyear=?,cardnumber=?,cvv=?,custid=? WHERE cardid=?";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cardName);
            stmt.setInt(2, dateMonth);
            stmt.setInt(3, dateYear);
            stmt.setString(4, cardNumber);
            stmt.setString(5, cvv);
            stmt.setString(6, custId);
            stmt.setString(7, cardId);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public void deleteRecord(String cardId) {
        String queryStr = "DELETE FROM " + tableName + " WHERE cardid=?";
        
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cardId);
            stmt.execute();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

}
