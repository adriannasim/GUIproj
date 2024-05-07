//package src.java.entity;
package entity;

import java.util.Date;
import java.util.*;

public class CustOrder {

    private String orderId;
    private String username;
    private Date orderdate;
    private String status;
    private ArrayList<OrderItem> orderItems = new ArrayList<OrderItem>();
    Address shippingAdd;
    private Date packaging;
    private Date shipping;
    private Date delivery;
    private String name;
    private String contactno;
    private String remark;

    public CustOrder() {

    }

    public CustOrder(String orderId, Date orderdate, String status, String username, Address shippingAdd, 
            ArrayList<OrderItem> orderItems, Date packaging, Date shipping, Date delivery, String name, 
            String contactno, String remark) {
        this.orderId = orderId;
        this.username = username;
        this.orderdate = orderdate;
        this.status = status;
        this.orderItems = orderItems;
        this.shippingAdd = shippingAdd;
        this.packaging = packaging;
        this.shipping = shipping;
        this.delivery = delivery;
        this.name = name;
        this.contactno = contactno;
        this.remark = remark;
    }

//    public CustOrder(String orderId, Date orderdate, String status, String username, Address shippingAdd, 
//            Date packaging, Date shipping, Date delivery) {
//        this.orderId = orderId;
//        this.username = username;
//        this.orderdate = orderdate;
//        this.status = status;
//        this.shippingAdd = shippingAdd;
//        this.packaging = packaging;
//        this.shipping = shipping;
//        this.delivery = delivery;
//    }

//  Getter methods
    public String getOrderId() {
        return orderId;
    }

    public String getUsername() {
        return username;
    }

    public Date getOrderDate() {
        return orderdate;
    }

    public String getStatus() {
        return status;
    }

    public ArrayList<OrderItem> getOrderItems() {
        return orderItems;
    }

    public Address getAddress() {
        return shippingAdd;
    }
    
    public Date getPackaging() {
        return packaging;
    }
    
    public Date getShipping() {
        return shipping;
    }
    
    public Date getDelivery() {
        return delivery;
    }
    
    public String getName(){
        return name;
    }
    
    public String getContactno(){
        return contactno;
    }
    
    public String getRemark(){
        return remark;
    }

//  Setter methods
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setOrderDate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setOrderItems(ArrayList<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public void setAddress(Address shippingAdd) {
        this.shippingAdd = shippingAdd;
    }
    
    public void addOrderItem(OrderItem orderItem) {
        orderItems.add(orderItem);
    }
    
    public void setPackaging(Date packaging) {
        this.packaging = packaging;
    }
    
    public void setShipping(Date shipping) {
        this.shipping = shipping;
    }
    
    public void setDelivery(Date delivery) {
        this.delivery = delivery;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public void setContactno(String contactno) {
        this.contactno = contactno;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }
}
