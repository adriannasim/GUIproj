//package src.java.entity;
package entity;

public class CartItem implements java.io.Serializable {
    private String cartId;
    private Product prod;
    private int itemQty;

    public CartItem() {

    }

    public CartItem(String cartId, Product prod, int itemQty) {
        this.cartId = cartId;
        this.prod = prod;
         this.itemQty = itemQty;
    }

    // Getter methods
    public String getCartId() {
        return cartId;
    }
    
    public Product getProd() {
        return prod;
    }

    public int getItemQty() {
        return itemQty;
    }

    // Setter methods
    public void setCartId(String cartId) {
        this.cartId = cartId;
    }
    
    public void setProdId(Product prod) {
        this.prod = prod;
    }

    public void setItemQty(int itemQty) {
        this.itemQty = itemQty;
    }

   
    // Calculate price for the item
    //public double calculatePrice() {
    //    return itemQty * itemPrice;
    //}
}
