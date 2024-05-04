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
import model.ProductDAO;


@WebServlet(name = "UpdateCart", urlPatterns = {"/UpdateCart"})
public class UpdateCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initialization
        HttpSession session = request.getSession();
       

        // Retrieve cartItemList from session
        ArrayList<CartItem> cartItemList = (ArrayList<CartItem>) session.getAttribute("cartItemList");

        if (cartItemList == null) {
            cartItemList = new ArrayList<>();
        }

        // Update Item in the session
        String prodId = request.getParameter("prodId");
        int itemQty = Integer.parseInt(request.getParameter("qty"));

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

        if (cartItemList.isEmpty() == false) {
            for (CartItem cartItem : cartItemList) {
                if (cartItem.getCartId().equals(cartId) && cartItem.getProd().getProdId().equals(prodId)) {
                    cartItem.setItemQty(itemQty);
                    break;
                }
            }
        }

        // Update the cartItemList in the session after modification (adding)
        session.setAttribute("cartItemList", cartItemList);

        response.sendRedirect("Cart.jsp");
    }
}
