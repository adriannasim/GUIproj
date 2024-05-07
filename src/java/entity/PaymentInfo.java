//package src.java.entity;
package entity;

import java.time.LocalDate;

public class PaymentInfo {

    private String paymentId;
    private String orderId;
    private String username;
    private String paymentType; // "cash" or "card"
//    private PaymentCard paymentCard; // Optional, only if paymentType is "card"
    private LocalDate paymentDate;
    private double paymentAmount;

    public PaymentInfo() {

    }

    public PaymentInfo(String paymentId, String orderId, String username, String paymentType, LocalDate paymentDate, double paymentAmount) {
        this.paymentId = paymentId;
        this.orderId = orderId;
        this.username = username;
        this.paymentType = paymentType;
        this.paymentDate = paymentDate;
        this.paymentAmount = paymentAmount;
    }

//    public PaymentInfo(String paymentId, String orderId, String username, String paymentType, PaymentCard paymentCard, LocalDate paymentDate) {
//        this.paymentId = paymentId;
//        this.orderId = orderId;
//        this.username = username;
//        this.paymentType = paymentType;
//        this.paymentCard = paymentCard;
//        this.paymentDate = paymentDate;
//    }
    
//    Getter methods
    public String getPaymentId() {
        return paymentId;
    }

    public String getOrderId() {
        return orderId;
    }

    public String getusername() {
        return username;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public double getPaymentAmount() {
        return paymentAmount;
    }

//    public PaymentCard getPaymentCard() {
//        return paymentCard;
//    }
    
    public LocalDate getPaymentDate() {
        return paymentDate;
    }

//  Setter methods
    public void setPaymentId(String paymentId) {
        this.paymentId = paymentId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public void setusername(String username) {
        this.username = username;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

//    public void setPaymentCard(PaymentCard paymentCard) {
//        this.paymentCard = paymentCard;
//    }
    
    public void setPaymentDate(LocalDate paymentDate) {
        this.paymentDate = paymentDate;
    }
    
    public void setPaymentAmount(double paymentAmount) {
        this.paymentAmount = paymentAmount;
    }
}
