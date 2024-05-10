package model;

import entity.CustOrder;
import entity.Address;
import entity.OrderItem;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CustOrderDAO {

    private DatabaseConn dbConn;
    private PreparedStatement stmt;
    private String tableName = "public.custorder";

    public CustOrderDAO() {
        dbConn = new DatabaseConn();
    }

    // RETRIEVE RECORDS BY USERNAME
    public ArrayList<CustOrder> getCustOrderByUsername(String username) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE username = ?";
        Address address = new Address();
        ArrayList<CustOrder> orders = new ArrayList<>();
        OrderItemDAO orderItemDao = new OrderItemDAO();
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String orderId = rs.getString(1);
                address.setAddress(rs.getString(5));
                address.setCity(rs.getString(6));
                address.setState(rs.getString(7));
                address.setPostalCode(rs.getString(8));
                address.setCountry(rs.getString(9));
                ArrayList<OrderItem> orderItems = orderItemDao.retrieveOrderItem(orderId);
                CustOrder order = new CustOrder(
                        orderId,
                        rs.getDate(2),
                        rs.getString(3),
                        rs.getString(4),
                        address,
                        rs.getDate(10),
                        rs.getDate(11),
                        rs.getDate(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        orderItems
                );
                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    // RETRIEVE RECORDS BY USERNAME AND STATUS
    public ArrayList<CustOrder> getCustOrderByUsernameAndStatus(String username, String status) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE username = ? AND status = ?";
        Address address = new Address();
        ArrayList<CustOrder> orders = new ArrayList<>();
        OrderItemDAO orderItemDao = new OrderItemDAO();
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, username);
            stmt.setString(2, status);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String orderId = rs.getString(1);
                address.setAddress(rs.getString(5));
                address.setCity(rs.getString(6));
                address.setState(rs.getString(7));
                address.setPostalCode(rs.getString(8));
                address.setCountry(rs.getString(9));
                ArrayList<OrderItem> orderItems = orderItemDao.retrieveOrderItem(orderId);
                CustOrder order = new CustOrder(
                        orderId,
                        rs.getDate(2),
                        rs.getString(3),
                        rs.getString(4),
                        address,
                        rs.getDate(10),
                        rs.getDate(11),
                        rs.getDate(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        orderItems
                );
                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    // CLOSE DATABASE CONNECTION
    public void closeConnection() {
        try {
            if (dbConn.returnConnection() != null) {
                dbConn.shutDown();
            }
        } catch (Exception ex) {
            Logger.getLogger(CustOrderDAO.class.getName()).log(Level.WARNING, null, ex);
        }
    }
}
