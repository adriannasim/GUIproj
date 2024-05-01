//package src.java.entity;
package entity;

public class PaymentInfo {
    private String paymentId;
    private String orderId;
    private String paymentType; // "cash" or "card"
    private PaymentCard paymentCard; // Optional, only if paymentType is "card"
    private double payAmount;
    
    public PaymentInfo() {

    }

    public PaymentInfo(String paymentId, String orderId, String paymentType, PaymentCard paymentCard, double payAmount) {
        this.paymentId = paymentId;
        this.orderId = orderId;
        this.paymentType = paymentType;
        this.payAmount = payAmount;
    }

    // Getter methods
    public String getPaymentId() {
        return paymentId;
    }

    public String getOrderId() {
        return orderId;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public PaymentCard getPaymentCard() {
        return paymentCard;
    }
    
    public double getPayAmount() {
        return payAmount;
    }

    // Setter methods
    public void setPaymentId(String paymentId) {
        this.paymentId = paymentId;
    }

    public void setUserId(String userId) {
        this.orderId = userId;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public void setPaymentCard(PaymentCard paymentCard) {
        this.paymentCard = paymentCard;
    }
    
    public void setPayAmount(double payAmount) {
        this.payAmount = payAmount;
    }
}

