//package src.java.entity;
package entity;

import java.util.ArrayList;
import java.util.UUID;

public class Cart {
    private String cartId;
    private String username;
    private ArrayList<CartItem> itemList = new ArrayList<CartItem>();

    public Cart() {
        this.cartId = UUID.randomUUID().toString();
    }
    
    public Cart(String cartId, String username){
        this.cartId = cartId;
        this.username = username;
    }

    public Cart(String cartId, String username, ArrayList<CartItem> itemList) {
        this.cartId = cartId;
        this.username = username;
        this.itemList = itemList;
    }

    // Getter methods
    public String getCartId() {
        return cartId;
    }

    public String getUsername() {
        return username;
    }

    public ArrayList<CartItem> getItemList() {
        return itemList;
    }

    // Setter methods
    public void setCartId(String cartId) {
        this.cartId = cartId;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setItemList(ArrayList<CartItem> itemList) {
        this.itemList = itemList;
    }

    public void addToCart(CartItem cartItem) {
        itemList.add(cartItem);
    }
    
    // Calculate total price
    //public double calculateTotalPrice(){
    //    double totalPrice = 0;
    //    for (CartItem item : itemList){
    //        totalPrice += item.calculatePrice();
    //    }
    //    return totalPrice;
    //}
}
