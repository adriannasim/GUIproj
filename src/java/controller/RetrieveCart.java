package controller;

import entity.Cart;
import entity.CartItem;
import entity.Product;
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
import model.ProductDAO;

@WebServlet(name = "RetrieveCart", urlPatterns = {"/RetrieveCart"})
public class RetrieveCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initialization
        CartDAO cartDAO = new CartDAO();
        CartItemDAO cartItemDAO = new CartItemDAO();
        ArrayList<CartItem> cartItemList = new ArrayList<>();
        HttpSession session = request.getSession();
        Cookie[] cookies = request.getCookies();
        String cartId = null;
        boolean cartExists = false;

        // Check if the cart ID cookie already exists (means user has created cart before)
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("cart_id".equals(cookie.getName())) {
                    cartId = cookie.getValue();
                    cartExists = true;
                    break;
                }
            }
        }

        // If cart ID cookie doesn't exist (means user didn't create cart before, then create a new one 
        if (!cartExists) {
            Cart cart = new Cart();
            cartId = cart.getCartId();
            Cookie newCookie = new Cookie("cart_id", cartId);
            newCookie.setMaxAge(30 * 24 * 60 * 60); // Set to 30 days validity
            response.addCookie(newCookie);
            System.out.println("New cart created with ID: " + cartId);
        } else {
            System.out.println("Existing cart found with ID: " + cartId);
        }
        
        // Retrieve cart items from database by referring to the cart ID
        cartItemList = cartItemDAO.retrieveCartItem(cartId);
        
        // Put the cart items into the session
        session.setAttribute("cartItemList", cartItemList);
        
        cartDAO.closeConnection();
        cartItemDAO.closeConnection();
    }
}
