package controller;

import entity.Cart;
import entity.CartItem;
import java.io.IOException;
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

@WebServlet(name = "RetrieveCart", urlPatterns = {"/RetrieveCart"})
public class RetrieveCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setHeader("Content-Type", "text/html");

        
        // Initialization
        CartDAO cartDAO = new CartDAO();
        CartItemDAO cartItemDAO = new CartItemDAO();
        HttpSession session = request.getSession();
        String cartId = null;

        // Check if user has logged in
        String username = (String) session.getAttribute("username");

        // If user has logged in, get the cart id associated from DB
        if (username != null) {
            Cart cart = cartDAO.getCartIByUsername(username);
            cartId = cart.getCartId();
        } 
        // If user hasn't logged in, get cart id from cookie
        else {
            // Retrieve cartId from cookie
            Cookie[] cookies = request.getCookies();
            boolean cartExists = false;

            // Check if the cart ID cookie already exists (means user has created cart before)
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("cart_id".equals(cookie.getName())) {
                        cartId = cookie.getValue(); // cartId = cookie's value
                        System.out.println("Cookie existed is: " + cartId);
                        cartExists = true;
                        break;
                    }
                }
            }

            // If cart ID cookie doesn't exist (means user didn't create cart before, then create a new one) 
            if (!cartExists) {
                Cart cart = new Cart();
                cartId = cart.getCartId();
                System.out.println("Cookie newly added is: " + cartId);
                Cookie newCookie = new Cookie("cart_id", cartId); // Create a new one
                newCookie.setMaxAge(30 * 24 * 60 * 60); // Set to 30 days validity
                response.addCookie(newCookie); // Set the new one
            }
        }

        // Retrieve cart items from database by referring to the cartId
        ArrayList<CartItem> cartItemList = cartItemDAO.retrieveCartItem(cartId);

        // Put the cart items into the session
        session.setAttribute("cartItemList", cartItemList);

        // Put the cart id into the session
        session.setAttribute("cartId", cartId);

        cartDAO.closeConnection();
        cartItemDAO.closeConnection();
    }
}
