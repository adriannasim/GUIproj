package entity;

public class OrderItem {
//    private String orderid;
    private Product orderItems;
    private int orderItemQty;
    
    public OrderItem(){
        
    }
    
    public OrderItem(Product orderItems, int orderItemQty){
//        this.orderid = orderid;
        this.orderItems = orderItems;
        this.orderItemQty = orderItemQty;
    }

    // getter
//    public String getOrderId() {
//        return orderid;
//    }
    
    public Product getOrderItems() {
        return orderItems;
    }
    
    public int getOrderItemQty() {
        return orderItemQty;
    }

    // setter
//    public void setOrderId(String orderId) {
//        this.orderid = orderId;
//    }

    public void setOrderItems(Product orderItems) {
        this.orderItems = orderItems;
    }

    public void setOrderItemQty(int orderItemQty) {
        this.orderItemQty = orderItemQty;
    }
}

