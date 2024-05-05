package model;

import entity.Cart;
import entity.CartItem;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CartDAO {

    private DatabaseConn dbConn;
    private PreparedStatement stmt;
    private String tableName = "public.cart";

    public CartDAO() {
        dbConn = new DatabaseConn();
    }

    public boolean getCart(String cartId) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE cartId = ?";
        ResultSet rs;
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cartId);
            rs = stmt.executeQuery();
            
            if (rs.next()){
                return true;
            }

        } catch (SQLException ex) {
            ex.getMessage();
        }
        return false;
    }
    
    public Cart getCartInfo(String cartId) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE cartId = ?";
        ResultSet rs;
        Cart cart = null;
        
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cartId);
            rs = stmt.executeQuery();
            
            if (rs.next()){
                cart = new Cart(rs.getString("cartId"),rs.getString("username"));
            }

        } catch (SQLException ex) {
            ex.getMessage();
        }
        return cart;
    }
    
    public Cart getCartIByUsername(String username) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE username = ?";
        ResultSet rs;
        Cart cart = null;
        
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, username);
            rs = stmt.executeQuery();
            
            if (rs.next()){
                cart = new Cart(rs.getString("cartId"),rs.getString("username"));
            }

        } catch (SQLException ex) {
            ex.getMessage();
        }
        return cart;
    }

    // Retrieve CartItems from CartItem table to CartItem ArrayList in Cart Object
    /*public ArrayList<CartItem> retrieveItemInCart(String cartId) {
        String queryStr = "SELECT * FROM " + "public.cartitem" + " WHERE cartId=?";
        ArrayList<CartItem> items = new ArrayList<CartItem>();
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cartId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                items.add(new CartItem(rs.getString(1), rs.getInt(4), rs.getString(3)));
            }

        } catch (SQLException ex) {
            ex.getMessage();
        }
        return items;
    }*/
    
    public void createCartWithoutUserId(String cartId) {
        String queryStr = "INSERT INTO " + tableName + " (cartId) VALUES (?)";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cartId);
            stmt.executeUpdate();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public void createCartWithUserId(String cartId, String userId) {
        String queryStr = "INSERT INTO " + tableName + " VALUES (?,?)";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cartId);
            stmt.setString(2, userId);
            stmt.executeUpdate();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public void assignCartToUser(String cartId, String username) {
        String queryStr = "UPDATE " + tableName + " SET username = ? WHERE cartId = ?";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, username);
            stmt.setString(2, cartId);
            stmt.executeUpdate();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public void deleteCart(String cartId) {
        String queryStr = "DELETE FROM " + tableName + " WHERE cartId=?";
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, cartId);
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
            Logger.getLogger(CartDAO.class.getName()).log(Level.WARNING, null, ex);
        }
    }
}
