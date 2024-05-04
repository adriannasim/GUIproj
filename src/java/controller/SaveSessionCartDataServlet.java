package controller;

import entity.Cart;
import entity.CartItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
        ArrayList<CartItem> cartItemList = new ArrayList<CartItem>();
        CartItemDAO cartItemDAO = new CartItemDAO();
        HttpSession session = request.getSession();
        Cookie[] cookies = request.getCookies();
        String cartId = null;
        boolean cartExists = false;

        // Retrieve cartItemList from session
        if (session.getAttribute("cartItemList") != null) {
            cartItemList = (ArrayList<CartItem>) session.getAttribute("cartItemList");

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("cart_id".equals(cookie.getName())) {
                        cartId = cookie.getValue();
                        break;
                    }
                }
            }

            if (cartDAO.getCart(cartId) != true) {
                cartDAO.createCartWithoutUserId(cartId);
            }

            for (CartItem cartItem : cartItemList) {
                if (cartItemDAO.retrieveSpecificCartItem(cartId, cartItem.getProd().getProdId()) == true) {
                    cartItemDAO.updateItemInCart(cartId, cartItem.getProd().getProdId(), cartItem.getItemQty());
                } else {
                    cartItemDAO.addItemToCart(cartId, cartItem.getProd().getProdId(), cartItem.getItemQty());
                }
            }

            ArrayList<CartItem> oriCartItemList = cartItemDAO.retrieveCartItem(cartId);
            if (oriCartItemList != null) {
                for (CartItem oriCartItem : oriCartItemList) {
                    boolean found = false;
                    for (CartItem currentCartItem : cartItemList) {
                        if (oriCartItem.getProd().getProdId().equals(currentCartItem.getProd().getProdId())) {
                            // Item found in current cartItemList, mark as found and break inner loop
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

            cartDAO.closeConnection();
            cartItemDAO.closeConnection();
        }
    }

}
