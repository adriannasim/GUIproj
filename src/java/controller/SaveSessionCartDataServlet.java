package controller;

import entity.CartItem;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartDAO;
import model.CartItemDAO;

@WebServlet(name = "SaveSessionCartDataServlet", urlPatterns = {"/SaveSessionCartDataServlet"})
public class SaveSessionCartDataServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initialization
        CartDAO cartDAO = new CartDAO();
        CartItemDAO cartItemDAO = new CartItemDAO();
        HttpSession session = request.getSession();

        // Retrieve cartItemList from session
        if (session.getAttribute("cartItemList") != null) {
            ArrayList<CartItem> cartItemList = (ArrayList<CartItem>) session.getAttribute("cartItemList");

            // Retrieve cartId from session
            String cartId = (String) session.getAttribute("cartId");

            if (cartDAO.getCart(cartId) != true) {
                cartDAO.createCartWithoutUserId(cartId);
            }

            // Update cart item qty if necessary (Update Cart Item Qty // Add Cart Item)
            for (CartItem cartItem : cartItemList) {
                if (cartItemDAO.retrieveSpecificCartItem(cartId, cartItem.getProd().getProdId()) == true) {
                    cartItemDAO.updateItemInCart(cartId, cartItem.getProd().getProdId(), cartItem.getItemQty());
                } else {
                    cartItemDAO.addItemToCart(cartId, cartItem.getProd().getProdId(), cartItem.getItemQty());
                }
            }

            // Delete those cart item that no longer exist
            ArrayList<CartItem> oriCartItemList = cartItemDAO.retrieveCartItem(cartId);
            if (oriCartItemList != null) {
                for (CartItem oriCartItem : oriCartItemList) {
                    boolean found = false;
                    for (CartItem currentCartItem : cartItemList) {
                        if (oriCartItem.getProd().getProdId().equals(currentCartItem.getProd().getProdId())) {
                            // Item found in current cartItemList
                            found = true;
                            break;
                        }
                    }
                    // If item not found in current cartItemList, remove it from the database
                    if (!found) {
                        cartItemDAO.deleteItemInCart(cartId,oriCartItem.getProd().getProdId());
                    }
                }
            }

            // Close DB connection
            cartDAO.closeConnection();
            cartItemDAO.closeConnection();
        }
    }
}
