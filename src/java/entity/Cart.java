//package src.java.entity;
package entity;

import java.util.ArrayList;

public class Cart {
    private String cartId;
    private String userId;
    private ArrayList<CartItem> itemList = new ArrayList<CartItem>();

    public Cart() {

    }

    public Cart(String cartId, String userId, ArrayList<CartItem> itemList) {
        this.cartId = cartId;
        this.userId = userId;
        this.itemList = itemList;
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

    public void addToCart(CartItem cartItem) {
        itemList.add(cartItem);
    }
    
    // Calculate total price
    public double calculateTotalPrice(){
        double totalPrice = 0;
        for (CartItem item : itemList){
            totalPrice += item.calculatePrice();
        }
        return totalPrice;
    }
}
