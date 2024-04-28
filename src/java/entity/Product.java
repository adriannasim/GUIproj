package src.java.entity;

public class Product{
    private String prodId;
    private String prodName;
    private String prodDesc;
    private double prodPrice;
    private int qtyAvailable;

    public Product(){

    }

    public Product(String prodId, String prodName, String prodDesc, double prodPrice, int qtyAvailable){
        this.prodId = prodId;
        this.prodName = prodName;
        this.prodDesc = prodDesc;
        this.prodPrice = prodPrice;
        this.qtyAvailable = qtyAvailable;
    }

        // Getter methods
        public String getProdId() {
            return prodId;
        }
    
        public String getProdName() {
            return prodName;
        }
    
        public String getProdDesc() {
            return prodDesc;
        }
    
        public double getProdPrice() {
            return prodPrice;
        }
    
        public int getQtyAvailable() {
            return qtyAvailable;
        }

        // Setter methods
    public void setProdID(String prodId) {
        this.prodId = prodId;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public void setProdDesc(String prodDesc) {
        this.prodDesc = prodDesc;
    }

    public void setProdPrice(double prodPrice) {
        this.prodPrice = prodPrice;
    }

    public void setQtyAvailable(int qtyAvailable) {
        this.qtyAvailable = qtyAvailable;
    }

}