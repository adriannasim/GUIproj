package model;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
import entity.CartItem;
import java.sql.ResultSet;

public class CartItemDAO {

    private DatabaseConn dbConn;
    private PreparedStatement stmt;
    private String tableName = "public.cart";

    public CartItemDAO() {
        dbConn = new DatabaseConn();
    }

    public boolean retrieveSpecificCartItem(String cartId, String prodId) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE cartId = ? AND prodId=?";
        boolean cartItemExistence = false;
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cartId);
            stmt.setString(1, prodId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                cartItemExistence = true;
            }

        } catch (SQLException ex) {
            ex.getMessage();
        }

        return cartItemExistence;
    }

    public ArrayList<CartItem> retrieveCartItem(String cartId) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE cartId = ?";
        ArrayList<CartItem> cartItemList = new ArrayList<>();
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cartId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                CartItem cartItem = new CartItem(
                        rs.getString("cartId"),
                        rs.getString("prodId"),
                        rs.getInt("itemQty")
                );

                cartItemList.add(cartItem);
            }

        } catch (SQLException ex) {
            ex.getMessage();
        }

        return cartItemList;
    }

    public void addItemToCart(String cartId, String prodId, int itemQty) {

        String queryStr = "INSERT INTO " + tableName + " SET VALUES (?,?,?)";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cartId);
            stmt.setString(2, prodId);
            stmt.setInt(3, itemQty);
            stmt.executeUpdate();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public void updateItemInCart(String cartId, String prodId, int itemQty) {
        String queryStr = "UPDATE " + tableName + " SET itemQty = ? WHERE cartId = ? AND prodId = ?";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setInt(1, itemQty);
            stmt.setString(2, cartId);
            stmt.setString(3, prodId);
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
