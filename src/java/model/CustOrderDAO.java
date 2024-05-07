package model;

import entity.CustOrder;
import entity.Address;
import entity.Product;
import entity.OrderItem;
import java.sql.*;
import java.time.LocalDate;
import java.util.*;

public class CustOrderDAO {

    private DatabaseConn dbConn;
    private PreparedStatement stmt;
    private String tableName = "public.custorder";

    public CustOrderDAO() {
        dbConn = new DatabaseConn();
    }

//  RETRIEVE RECORDS : ALL, BY ORDER ID, BY CUST ID
    public ArrayList<CustOrder> getAllRecord() {
        String queryStr = "SELECT * FROM " + tableName;
        
        Address address = new Address();
        ArrayList<CustOrder> orders = new ArrayList<CustOrder>();
        
        OrderItemDAO orderItemDao = new OrderItemDAO();
        ArrayList<OrderItem> orderItems = new ArrayList<OrderItem>();

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                address.setAddress(rs.getString(5));
                address.setCity(rs.getString(6));
                address.setState(rs.getString(7));
                address.setPostalCode(rs.getString(8));
                address.setCountry(rs.getString(9));

                orderItems = orderItemDao.getRecord(rs.getString(1));

                orders.add(new CustOrder(rs.getString(1), rs.getDate(2),
                        rs.getString(3), rs.getString(4), address, orderItems,
                        rs.getDate(10),
                        rs.getDate(11),
                        rs.getDate(12),
                        rs.getString(13), rs.getString(14), rs.getString(15)
                ));
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return orders;
    }

    public CustOrder getRecordByOrderId(String orderid) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE orderid=?";
        
        CustOrder custOrder = null;
        Address address = new Address();
        
        OrderItemDAO orderItemDao = new OrderItemDAO();
        ArrayList<OrderItem> orderItems = new ArrayList<OrderItem>();

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, orderid);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                address.setAddress(rs.getString(5));
                address.setCity(rs.getString(6));
                address.setState(rs.getString(7));
                address.setPostalCode(rs.getString(8));
                address.setCountry(rs.getString(9));

                orderItems = orderItemDao.getRecord(rs.getString(1));

                custOrder = new CustOrder(rs.getString(1), rs.getDate(2),
                        rs.getString(3), rs.getString(4), address, orderItems,
                        rs.getDate(10),
                        rs.getDate(11),
                        rs.getDate(12),
                        rs.getString(13), rs.getString(14), rs.getString(15)
                );
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return custOrder;
    }

//  FILTER RECORDS BY CUSTID
    public ArrayList<CustOrder> searchRecordByCustId(String custId) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE custid LIKE ?";
        
        Address address = new Address();
        ArrayList<CustOrder> orders = new ArrayList<CustOrder>();
        
        OrderItemDAO orderItemDao = new OrderItemDAO();
        ArrayList<OrderItem> orderItems = new ArrayList<OrderItem>();

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                address.setAddress(rs.getString(5));
                address.setCity(rs.getString(6));
                address.setState(rs.getString(7));
                address.setPostalCode(rs.getString(8));
                address.setCountry(rs.getString(9));
                
                orderItems = orderItemDao.getRecord(rs.getString(1));
                
                orders.add(new CustOrder(rs.getString(1), rs.getDate(2),
                        rs.getString(3), rs.getString(4), address, orderItems,
                        rs.getDate(10),
                        rs.getDate(11),
                        rs.getDate(12),
                        rs.getString(13), rs.getString(14), rs.getString(15)
                ));
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return orders;
    }

//  INSERTING RECORD   
    public void insertRecord(String orderId, LocalDate orderdate, String status, String custId, Address shippingAdd,
            ArrayList<Product> orderItems, LocalDate packaging, LocalDate shipping, LocalDate delivery) {
        String queryStr = "INSERT INTO " + tableName + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);

            stmt.setString(1, orderId);
            java.sql.Date orderSqlDate = java.sql.Date.valueOf(orderdate);
            stmt.setDate(2, orderSqlDate);
            stmt.setString(3, status);
            stmt.setString(4, custId);
            stmt.setString(5, shippingAdd.getAddress());
            stmt.setString(6, shippingAdd.getCity());
            stmt.setString(7, shippingAdd.getState());
            stmt.setString(8, shippingAdd.getPostalCode());
            stmt.setString(9, shippingAdd.getCountry());
            java.sql.Date packagingSqlDate = java.sql.Date.valueOf(packaging);
            stmt.setDate(10, packagingSqlDate);
            java.sql.Date shippingSqlDate = java.sql.Date.valueOf(shipping);
            stmt.setDate(11, shippingSqlDate);
            java.sql.Date deliverySqlDate = java.sql.Date.valueOf(delivery);
            stmt.setDate(12, deliverySqlDate);
            stmt.execute();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

//  UPDATING RECORD    
    public void updateRecord(String orderId, LocalDate orderdate, String status, String custId, Address shippingAdd,
            ArrayList<Product> orderItems, LocalDate packaging, LocalDate shipping, LocalDate delivery) {
        String queryStr = "UPDATE " + tableName
                + " SET orderid=?,orderdate=?,status=?,custid=?,address=?,city=?,state=?,postalcode=?,country=?,"
                + "packaging=?,shipping=?,delivery=?"
                + " WHERE username=?";

        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, orderId);
            java.sql.Date orderSqlDate = java.sql.Date.valueOf(orderdate);
            stmt.setDate(2, orderSqlDate);
            stmt.setString(3, status);
            stmt.setString(4, custId);
            stmt.setString(5, shippingAdd.getAddress());
            stmt.setString(6, shippingAdd.getCity());
            stmt.setString(7, shippingAdd.getState());
            stmt.setString(8, shippingAdd.getPostalCode());
            stmt.setString(9, shippingAdd.getCountry());
            java.sql.Date packagingSqlDate = java.sql.Date.valueOf(packaging);
            stmt.setDate(10, packagingSqlDate);
            java.sql.Date shippingSqlDate = java.sql.Date.valueOf(shipping);
            stmt.setDate(11, shippingSqlDate);
            java.sql.Date deliverySqlDate = java.sql.Date.valueOf(delivery);
            stmt.setDate(12, deliverySqlDate);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

//  DELETING RECORD    
    public void deleteRecord(String orderid) {
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
