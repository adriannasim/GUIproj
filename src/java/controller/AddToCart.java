package controller;

import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import java.util.UUID;
import entity.CartItem;
import javax.servlet.http.HttpSession;
import entity.Cart;
import entity.CartItem;
import model.CartDAO;
import model.CartItemDAO;

@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    // Initialization
    CartDAO cartDAO = new CartDAO();
    CartItemDAO cartItemDAO = new CartItemDAO();
    HttpSession session = request.getSession();
    Cookie[] cookies = request.getCookies();
    String cookieName = "cart_id";
    String cartId = null;

    // Retrieve cartItemList from session
    ArrayList<CartItem> cartItemList = (ArrayList<CartItem>) session.getAttribute("cartItemList");

    if (cartItemList == null) {
        cartItemList = new ArrayList<>();
    }

    // Add Item into session
    String prodId = request.getParameter("prodId");
    int itemQty = Integer.parseInt(request.getParameter("itemQty"));

    boolean cartExists = false;
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("cart_id".equals(cookie.getName())) {
                // Cart ID found in cookie
                cartId = cookie.getValue();
                cartExists = true;
                break;
            }
        }
    }

    if (!cartExists) {
        // No cart ID found in cookies, create a new cart
        Cart cart = new Cart();
        cartId = cart.getCartId();
        Cookie newCookie = new Cookie("cart_id", cartId);
        newCookie.setMaxAge(30 * 24 * 60 * 60); // 30 days expiry
        response.addCookie(newCookie);
    }

    boolean found = false;
    if (cartItemList.isEmpty() == false) {
        for (CartItem cartItem : cartItemList) {
            if (cartItem.getCartId().equals(cartId) && cartItem.getProdId().equals(prodId)) {
                cartItem.setItemQty(itemQty);
                found = true;
                break;
            }
        }

    } 
    if (!found) {
        cartItemList.add(new CartItem(cartId, prodId, itemQty));
    }

    session.setAttribute("cartItemList", cartItemList);

    response.sendRedirect("Cart.jsp");
}

}
