//package src.java.entity;
package entity;

import java.time.LocalDate;

public class PaymentInfo {

    private String paymentId;
    private String orderId;
    private String custId;
    private String paymentType; // "cash" or "card"
//    private PaymentCard paymentCard; // Optional, only if paymentType is "card"
    private LocalDate paymentDate;
    private double paymentAmount;

    public PaymentInfo() {

    }

    public PaymentInfo(String paymentId, String orderId, String custId, String paymentType, LocalDate paymentDate, double paymentAmount) {
        this.paymentId = paymentId;
        this.orderId = orderId;
        this.custId = custId;
        this.paymentType = paymentType;
        this.paymentDate = paymentDate;
        this.paymentAmount = paymentAmount;
    }

//    public PaymentInfo(String paymentId, String orderId, String custId, String paymentType, PaymentCard paymentCard, LocalDate paymentDate) {
//        this.paymentId = paymentId;
//        this.orderId = orderId;
//        this.custId = custId;
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

    public String getCustId() {
        return custId;
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

    public void setCustId(String custId) {
        this.custId = custId;
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
