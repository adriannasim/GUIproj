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

    // Check if the cart ID cookie already exists
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

    // If cart ID cookie doesn't exist, create a new one
    if (!cartExists) {
        // No cart ID found in cookies, create a new cart
        Cart cart = new Cart();
        cartId = cart.getCartId();
        Cookie newCookie = new Cookie("cart_id", cartId);
        newCookie.setMaxAge(30 * 24 * 60 * 60);
        response.addCookie(newCookie);
        System.out.println("New cart created with ID: " + cartId);
    } else {
        System.out.println("Existing cart found with ID: " + cartId);
    }

    // Retrieve cart items for the cart ID
    //cartItemList = cartItemDAO.retrieveCartItem(cartId);
    // Add test item only if the cart is newly created
    /*if (!cartExists) {
        CartItem test = new CartItem("a8c228ec-d0c2-45c3-a0d6-3946a08af8e6", "L0001", 1);
        cartItemList.add(test);
    }*/

    //session.setAttribute("cartItemList", cartItemList);

    cartDAO.closeConnection();
    cartItemDAO.closeConnection();

    response.sendRedirect("Cart.jsp");
}

}
