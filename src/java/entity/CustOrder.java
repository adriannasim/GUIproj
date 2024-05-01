//package src.java.entity;
package entity;

import java.util.*;

public class CustOrder {
    private String orderId;
    private String custId;
    private Date date;
    private String status;
    private Cart cart;

    public CustOrder() {

    }

    public CustOrder(String orderId, String custId, Date date, String status, Cart cart) {
        this.orderId = orderId;
        this.custId = custId;
        this.date = date;
        this.status = status;
        this.cart = cart;
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

    public Cart getCart() {
        return cart;
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

    public void setCart(Cart cart) {
        this.cart = cart;
    }
}
