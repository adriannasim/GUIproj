//package src.java.entity;
package entity;

import java.util.*;

public class CustOrder {
    private String orderId;
    private String custId;
    private Date date;
    private String status;
    private ArrayList<Product> orderItems = new ArrayList<Product>(); 

    public CustOrder() {

    }

    public CustOrder(String orderId, String custId, Date date, String status, ArrayList<Product> orderItems) {
        this.orderId = orderId;
        this.custId = custId;
        this.date = date;
        this.status = status;
        this.orderItems = orderItems;
    }

    // Getter methods
    public String getOrderId() {
        return orderId;
    }

    public String getCustId() {
        return custId;
    }

    public Date getDate() {
        return date;
    }

    public String getStatus() {
        return status;
    }

    public ArrayList<Product> getOrderItems() {
        return orderItems;
    }

    // Setter methods
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public void setCustId(String custId) {
        this.custId = custId;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setOrderItems(ArrayList<Product> orderItems) {
        this.orderItems = orderItems;
    }
}
