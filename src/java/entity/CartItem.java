//package src.java.entity;
package entity;

public class CartItem {
    private String cartItemId;
	private int itemQty;
	private double itemPrice; 

    public CartItem(){

    }

    public CartItem(String cartItemId, int itemQty, double itemPrice) {
        this.cartItemId = cartItemId;
        this.itemQty = itemQty;
        this.itemPrice = itemPrice;
    }

    // Getter methods
    public String getCartItemId() {
        return cartItemId;
    }

    public int getItemQty() {
        return itemQty;
    }

    public double getItemPrice() {
        return itemPrice;
    }

    // Setter methods
    public void setCartItemId(String cartItemId) {
        this.cartItemId = cartItemId;
    }

    public void setItemQty(int itemQty) {
        this.itemQty = itemQty;
    }

    public void setItemPrice(double itemPrice) {
        this.itemPrice = itemPrice;
    }
}
