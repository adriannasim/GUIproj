package model;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CartItemDAO {
    private DatabaseConn dbConn;
    private PreparedStatement stmt;
    private String tableName = "public.cart";

    public CartItemDAO() {
        dbConn = new DatabaseConn();
    }
    
    public void addItemToCart(String cartId, String prodId, int itemQty) {
        String cartItemId = UUID.randomUUID().toString();
        String queryStr = "INSERT INTO " + tableName + " SET VALUES (?,?,?,?)";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cartItemId);
            stmt.setString(2, cartId);
            stmt.setString(3, prodId);
            stmt.setInt(4, itemQty);
            stmt.executeUpdate();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }
    
    public void updateItemInCart(String cartItemId, int itemQty) {
        String queryStr = "UPDATE " + tableName + " SET itemQty = ? WHERE cartItemId = ?";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setInt(1, itemQty);
            stmt.setString(2, cartItemId);
            stmt.executeUpdate();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }
    
    public void deleteItemInCart(String cartItemId) {
        String queryStr = "DELETE FROM " + tableName + " WHERE cartItemId=?";
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cartItemId);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    // Close DB conncetion
    public void closeConnection() {
        try {
            if (dbConn.returnConnection() != null) {
                dbConn.shutDown();
            }
        } catch (Exception ex) {
            Logger.getLogger(CartItemDAO.class.getName()).log(Level.WARNING, null, ex);
        }
    }
}
