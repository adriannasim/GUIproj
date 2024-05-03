//package src.java.entity;
package entity;

public class CartItem {
    private String cartId;
    private String prodId;
    private int itemQty;

    public CartItem() {

    }

    public CartItem(String cartId, String prodId, int itemQty) {
        this.cartId = cartId;
        this.prodId = prodId;
         this.itemQty = itemQty;
    }

    // Getter methods
    public String getCartId() {
        return cartId;
    }
    
    public String getProdId() {
        return prodId;
    }

    public int getItemQty() {
        return itemQty;
    }

    // Setter methods
    public void setCartId(String cartId) {
        this.cartId = cartId;
    }
    
    public void setProdId(String prodId) {
        this.prodId = prodId;
    }

    public void setItemQty(int itemQty) {
        this.itemQty = itemQty;
    }

   
    // Calculate price for the item
    //public double calculatePrice() {
    //    return itemQty * itemPrice;
    //}
}
