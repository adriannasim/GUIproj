package src.java.entity;

public class PaymentInfo {
    private String paymentId;
    private String userId;
    private String paymentType; // "cash" or "card"
    private PaymentCard paymentCard; // Optional, only if paymentType is "card"

    public PaymentInfo() {

    }

    public PaymentInfo(String paymentId, String userId, String paymentType, PaymentCard paymentCard) {
        this.paymentId = paymentId;
        this.userId = userId;
        this.paymentType = paymentType;
        this.paymentCard = paymentCard;
    }

    // Getter methods
    public String getPaymentId() {
        return paymentId;
    }

    public String getUserId() {
        return userId;
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

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public void setPaymentCard(PaymentCard paymentCard) {
        this.paymentCard = paymentCard;
    }
}

