//package src.java.entity;
package entity;

public class CartItem {
    private String cartItemId;
    private int itemQty;
    private String prodId;

    public CartItem() {

    }

    public CartItem(String cartItemId, int itemQty, String prodId) {
        this.cartItemId = cartItemId;
        this.itemQty = itemQty;
        this.prodId = prodId;
    }

    // Getter methods
    public String getCartItemId() {
        return cartItemId;
    }

    public int getItemQty() {
        return itemQty;
    }

    public String getProdId() {
        return prodId;
    }

    // Setter methods
    public void setCartItemId(String cartItemId) {
        this.cartItemId = cartItemId;
    }

    public void setItemQty(int itemQty) {
        this.itemQty = itemQty;
    }

    public void setProdId(String prodId) {
        this.prodId = prodId;
    }

    // Calculate price for the item
    //public double calculatePrice() {
    //    return itemQty * itemPrice;
    //}
}
