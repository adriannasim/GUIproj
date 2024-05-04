package model;

import entity.CartItem;
import entity.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
import java.sql.ResultSet;

public class CartItemDAO {

    private DatabaseConn dbConn;
    private PreparedStatement stmt;
    private String tableName = "public.cartItem";

    public CartItemDAO() {
        dbConn = new DatabaseConn();
    }

    public boolean retrieveSpecificCartItem(String cartId, String prodId) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE cartId = ? AND productId=?";
        
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cartId);
            stmt.setString(2, prodId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()){
                return true;
            }
            

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    public ArrayList<CartItem> retrieveCartItem(String cartId) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE cartId = ?";
        ArrayList<CartItem> cartItemList = new ArrayList<>();
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cartId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ProductDAO prodDAO = new ProductDAO();
                Product prod = prodDAO.getProductById(rs.getString("productId"));
                
                CartItem cartItem = new CartItem(
                        rs.getString("cartId"),
                        prod,
                        rs.getInt("itemQty")
                );

                cartItemList.add(cartItem);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return cartItemList;
    }

    public void addItemToCart(String cartId, String prodId, int itemQty) {

        String queryStr = "INSERT INTO " + tableName + " (cartId, productId, itemQty) VALUES (?,?,?)";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cartId);
            stmt.setString(2, prodId);
            stmt.setInt(3, itemQty);
            stmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updateItemInCart(String cartId, String prodId, int itemQty) {
        String queryStr = "UPDATE " + tableName + " SET itemQty = ? WHERE cartId = ? AND productId = ?";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setInt(1, itemQty);
            stmt.setString(2, cartId);
            stmt.setString(3, prodId);
            stmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void deleteItemInCart(String cartId, String prodId) {
        String queryStr = "DELETE FROM " + tableName + " WHERE cartId=? AND productId=?";
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cartId);
            stmt.setString(2, prodId);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
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
