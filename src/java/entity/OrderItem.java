package entity;

public class OrderItem {
    private String orderId;
    private Product orderItem;
    private int itemQty;
    private double prodPrice;


    public OrderItem() {

    }

    public OrderItem(String orderId, Product orderItem, int itemQty, double prodPrice) {
        this.orderId = orderId;
        this.orderItem = orderItem;
        this.itemQty = itemQty;
        this.prodPrice = prodPrice;
    }

    // getter

    public String getOrderId() {
        return orderId;
    }

    public Product getOrderItem() {
        return orderItem;
    }

    public int getItemQty() {
        return itemQty;
    }

    public double getProdPrice() {
        return prodPrice;
    }

    // setter

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public void setOrderItem(Product orderItem) {
        this.orderItem = orderItem;
    }

    public void setItemQty(int itemQty) {
        this.itemQty = itemQty;
    }

    public void setProdPrice(double prodPrice) {
        this.prodPrice = prodPrice;
    }

}
