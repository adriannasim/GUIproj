//package src.java.entity;
package entity;

import java.time.LocalDate;

public class Product implements java.io.Serializable {

    private String prodId;
    private String prodName;
    private String prodDesc;
    private double prodPrice;
    private int qtyAvailable;
    private String[] prodImg;
    private String prodImgConcat;
    private String[] prodKeywords;
    private String prodKeywordsConcat;
    private LocalDate prodAddedDate;
    private String prodSlug;

    public Product() {

    }

    //Constructor without concat
    public Product(String prodId, String prodName, String prodDesc, double prodPrice, int qtyAvailable, String[] prodImg, String[] prodKeywords, LocalDate prodAddedDate, String prodSlug) {
        this.prodId = prodId;
        this.prodName = prodName;
        this.prodDesc = prodDesc;
        this.prodPrice = prodPrice;
        this.qtyAvailable = qtyAvailable;
        this.prodImg = prodImg;
        this.prodKeywords = prodKeywords;
        this.prodAddedDate = prodAddedDate;
        this.prodSlug = prodSlug; 
    }
    
    //Constructor with concat
    public Product(String prodId, String prodName, String prodDesc, double prodPrice, int qtyAvailable, String prodImgConcat, String prodKeywordsConcat, LocalDate prodAddedDate, String prodSlug) {
        this.prodId = prodId;
        this.prodName = prodName;
        this.prodDesc = prodDesc;
        this.prodPrice = prodPrice;
        this.qtyAvailable = qtyAvailable;
        this.prodImgConcat = prodImgConcat;
        this.prodKeywordsConcat = prodKeywordsConcat;
        this.prodAddedDate = prodAddedDate;
        this.prodSlug = prodSlug;
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

    public String get30WordsDesc() {
        int countWords = prodDesc.split("\\s").length;
        String desc = null;
        if (countWords <= 30) {
            desc = prodDesc;
        } else {
            int index = 0;
            for (int count = 0; count < 30; count++) {
                index = prodDesc.indexOf(' ', index + 1);
            }
            desc = prodDesc.substring(0, index) + " ...";
        }
        return desc;
    }

    public double getProdPrice() {
        return prodPrice;
    }

    public int getQtyAvailable() {
        return qtyAvailable;
    }
    
    //Get Img URL Array
    public String[] getProdImg() {
        return prodImg;
    }
    
    //Get Concatinated Img URL 
    public String getImgConcat() {
        return prodImgConcat;
    }

    //Get Keywords Array
    public String[] getProdKeywords() {
        return prodKeywords;
    }
    
    //Get Concatinated Keywords
    public String getKeywordsConcat() {
        return prodKeywordsConcat;
    }

    public LocalDate getProdAddedDate() {
        return prodAddedDate;
    }
    
    public String getProdSlug() {
        return prodSlug;
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
    
    //Image URL Array
    public void setProdImg(String[] prodImg) {
        this.prodImg = prodImg;
    }
    
    //Image URL Concatinated
    public void concatImg(String[] prodImg) {
        String urlAttached = "";
        if (prodImg != null)
        {
            for (int i = 0; i < prodImg.length; i++)
            {
                if (i == prodImg.length - 1)
                {
                    //Last keyword don't need the ;
                    urlAttached = urlAttached.concat(prodImg[i]);
                }
                else
                {
                    urlAttached = urlAttached.concat(prodImg[i] + ";");
                }
            }
        }
        this.prodImgConcat = urlAttached;
    }
    
    //Keyword array
    public void setProdKeywords(String[] prodKeywords) {
        this.prodKeywords = prodKeywords;
    }
    
    //Keywords to be concat
    public void concatKeywords(String[] prodKeywords) {
        String keywordsAttached = "";
        if (prodKeywords != null)
        {
            for (int i = 0; i < prodKeywords.length; i++)
            {
                if (i == prodKeywords.length - 1)
                {
                    //Last keyword don't need the ;
                    keywordsAttached = keywordsAttached.concat(prodKeywords[i]);
                }
                else
                {
                    keywordsAttached = keywordsAttached.concat(prodKeywords[i] + ";");
                }
            }
        }
        this.prodKeywordsConcat = keywordsAttached;
    }
    

    public void setProdAddedDate(LocalDate prodAddedDate) {
        this.prodAddedDate = prodAddedDate;
    }
    
    public void setProdSlug(String prodName) {
        String slug = prodName.replaceAll(" ", "-");
        this.prodSlug = slug;
    }
}