//package src.java.entity;
package entity;

public class Product {

    private String prodId;
    private String prodName;
    private String prodDesc;
    private double prodPrice;
    private int qtyAvailable;
    private String[] prodImg;
    private String[] prodKeywords;

    public Product() {

    }

    public Product(String prodId, String prodName, String prodDesc, double prodPrice, int qtyAvailable, String[] prodImg, String[] prodKeywords) {
        this.prodId = prodId;
        this.prodName = prodName;
        this.prodDesc = prodDesc;
        this.prodPrice = prodPrice;
        this.qtyAvailable = qtyAvailable;
        this.prodImg = prodImg;
        this.prodKeywords = prodKeywords;
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

    public String[] getProdImg() {
        return prodImg;
    }

    public String[] getProdKeywords() {
        return prodKeywords;
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
    
    public void setProdImg(String[] prodImg) {
        this.prodImg = prodImg;
    }
    
    public void setProdKewords(String[] prodKeywords) {
        this.prodKeywords = prodKeywords;
    }

}
