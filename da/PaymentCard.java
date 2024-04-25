package da;

public class PaymentCard {
    private String cardName;
    private int dateMonth;
    private int dateYear;
    private String cardNumber;
    private int cvv;

    public PaymentCard() {

    }

    public PaymentCard(String cardName, int dateMonth, int dateYear, String cardNumber, int cvv) {
        this.cardName = cardName;
        this.dateMonth = dateMonth;
        this.dateYear = dateYear;
        this.cardNumber = cardNumber;
        this.cvv = cvv;
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

    public int getCvv() {
        return cvv;
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

    public void setCvv(int cvv) {
        this.cvv = cvv;
    }
}
