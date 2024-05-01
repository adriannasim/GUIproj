//package src.java.entity;
package entity;

public class PaymentInfo {
    private String paymentId;
    private String orderId;
    private String custId;
    private String paymentType; // "cash" or "card"
    private PaymentCard paymentCard; // Optional, only if paymentType is "card"
    
    public PaymentInfo() {

    }

    public PaymentInfo(String paymentId, String orderId, String custId, String paymentType) {
        this.paymentId = paymentId;
        this.orderId = orderId;
        this.custId = custId;
        this.paymentType = paymentType;
    }
    
    public PaymentInfo(String paymentId, String orderId, String custId, String paymentType, PaymentCard paymentCard) {
        this.paymentId = paymentId;
        this.orderId = orderId;
        this.custId = custId;
        this.paymentType = paymentType;
        this.paymentCard = paymentCard;
    }

    // Getter methods
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

    public PaymentCard getPaymentCard() {
        return paymentCard;
    }

    // Setter methods
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

    public void setPaymentCard(PaymentCard paymentCard) {
        this.paymentCard = paymentCard;
    }
}

