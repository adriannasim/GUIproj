package model;

import entity.CustOrder;
import entity.Address;
import entity.OrderItem;
import entity.Product;
import java.sql.*;
import java.time.LocalDate;
import java.util.*;

public class OrderItemDAO {

    private DatabaseConn dbConn;
    private PreparedStatement stmt;
    private String tableName = "public.orderItem";

    public OrderItemDAO() {
        dbConn = new DatabaseConn();
    }

    public ArrayList<OrderItem> retrieveOrderItem(String orderId) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE orderId = ?";
        ArrayList<OrderItem> orderItemList = new ArrayList<>();
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, orderId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ProductDAO prodDAO = new ProductDAO();
                Product prod = prodDAO.getProductById(rs.getString("prodId"));

                OrderItem orderItem = new OrderItem(
                        rs.getString("orderId"),
                        prod,
                        rs.getInt("itemQty"),
                        rs.getDouble("prodPrice"));

                orderItemList.add(orderItem);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return orderItemList;
    }

    // RETRIEVE RECORD BY ORDERID
    // public ArrayList<OrderItem> getRecord(String orderid) {
    //     String queryStr = "SELECT * FROM " + tableName + " WHERE orderid=?";

    //     ProductDAO productDAO = new ProductDAO();
    //     ArrayList<OrderItem> items = new ArrayList<OrderItem>();
    //     Product tempProd;

    //     try {
    //         stmt = dbConn.returnConnection().prepareStatement(queryStr);
    //         ResultSet rs = stmt.executeQuery();

    //         while (rs.next()) {
    //             tempProd = productDAO.getProductById(rs.getString(2));
    //             items.add(new OrderItem(tempProd, rs.getInt(3)));
    //         }
    //     } catch (SQLException ex) {
    //         ex.getMessage();
    //     }

    //     return items;
    // }

    // INSERTING RECORD
    public void insertRecord(String orderid, String prodid, int itemqty) {
        String queryStr = "INSERT INTO " + tableName + " VALUES (?,?,?)";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);

            stmt.setString(1, orderid);
            stmt.setString(2, prodid);
            stmt.setInt(3, itemqty);
            stmt.execute();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    // UPDATING RECORD
    public void updateRecord(String orderid, String prodid, int itemqty) {
        String queryStr = "UPDATE " + tableName + " SET itemqty=? WHERE orderid=? AND prodid=?";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setInt(1, itemqty);
            stmt.setString(2, orderid);
            stmt.setString(3, prodid);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    // DELETING RECORD
    public void deleteRecord(String orderid, String prodid) {
        String queryStr = "DELETE FROM " + tableName + " WHERE orderid=? AND prodid=?";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, orderid);
            stmt.setString(2, prodid);
            stmt.execute();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public void deleteEntireOrderRecord(String orderid) {
        String queryStr = "DELETE FROM " + tableName + " WHERE orderid=?";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, orderid);
            stmt.execute();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }
}
