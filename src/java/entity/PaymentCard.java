//package src.java.entity;
package entity;

public class PaymentCard {
    private String cardName;
    private int dateMonth;
    private int dateYear;
    private String cardNumber;
    private String cvv;
    private String username;

    public PaymentCard() {

    }

    public PaymentCard(String cardName, int dateMonth, int dateYear, String cardNumber, String cvv, String username) {
        this.cardName = cardName;
        this.dateMonth = dateMonth;
        this.dateYear = dateYear;
        this.cardNumber = cardNumber;
        this.username = username;
    }

    // Getter methods
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

    public String getCvv() {
        return cvv;
    }
    
    public String getUsername() {
        return username;
    }

    // Setter methods
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

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
}
