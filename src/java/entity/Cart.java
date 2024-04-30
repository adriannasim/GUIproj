//package src.java.entity;
package entity;

import java.util.ArrayList;

public class Cart {
    private String cartId;
    private String userId;
    private ArrayList<CartItem> itemList = new ArrayList<CartItem>();
    private double totalAmount;

    public Cart() {

    }

    public Cart(String cartId, String userId, ArrayList<CartItem> itemList, double totalAmount) {
        this.cartId = cartId;
        this.userId = userId;
        this.itemList = itemList;
        this.totalAmount = totalAmount;
    }

    // Getter methods
    public String getCartId() {
        return cartId;
    }

    public String getUserId() {
        return userId;
    }

    public ArrayList<CartItem> getItemList() {
        return itemList;
    }

    public double getCartTotalPrice() {
        return totalAmount;
    }

    // Setter methods
    public void setCartId(String cartId) {
        this.cartId = cartId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setItemList(ArrayList<CartItem> itemList) {
        this.itemList = itemList;
    }

    public void setCartTotalPrice(double cartTotalPrice) {
        this.totalAmount = cartTotalPrice;
    }

    public void addToCart(CartItem cartItem) {
        itemList.add(cartItem);
    }
    
}
