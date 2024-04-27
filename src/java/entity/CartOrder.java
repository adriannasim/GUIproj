package da;

import java.util.*;

public class CartOrder {
    private String orderId;
    private String userId;
    private Date date;
    private String status;
    private Cart cart;

    public CartOrder() {

    }

    public CartOrder(String orderId, String userId, Date date, String status, Cart cart) {
        this.orderId = orderId;
        this.userId = userId;
        this.date = date;
        this.status = status;
        this.cart = cart;
    }

    // Getter methods
    public String getOrderId() {
        return orderId;
    }

    public String getUserId() {
        return userId;
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

    public void setUserId(String userId) {
        this.userId = userId;
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
