//package src.java.entity;
package entity;

public class PaymentCard {
    private String cardId;
    private String cardName;
    private int dateMonth;
    private int dateYear;
    private String cardNumber;
    private int cvv;
    private String custId;

    public PaymentCard() {

    }

    public PaymentCard(String cardId, String cardName, int dateMonth, int dateYear, String cardNumber, int cvv, String custId) {
        this.cardId = cardId;
        this.cardName = cardName;
        this.dateMonth = dateMonth;
        this.dateYear = dateYear;
        this.cardNumber = cardNumber;
        this.custId = custId;
    }

    // Getter methods
    public String getCardId() {
        return cardId;
    }
    
    public String getCardName() {
        return cardName;
    }

    public int getDateMonth() {
        return dateMonth;
    }

    public int getDateYear() {
        return dateYear;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public int getCvv() {
        return cvv;
    }
    
    public String getCustId() {
        return custId;
    }

    // Setter methods
    public void setCardId(String cardId) {
        this.cardId = cardId;
    }
    
    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    public void setDateMonth(int dateMonth) {
        this.dateMonth = dateMonth;
    }

    public void setDateYear(int dateYear) {
        this.dateYear = dateYear;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public void setCvv(int cvv) {
        this.cvv = cvv;
    }
    
    public void setCustId(String custId) {
        this.custId = custId;
    }
}
