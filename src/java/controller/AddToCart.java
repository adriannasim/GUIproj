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
import model.ProductDAO;

@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initialization
        CartDAO cartDAO = new CartDAO();
        CartItemDAO cartItemDAO = new CartItemDAO();
        ProductDAO prodDAO = new ProductDAO();
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

        // If the cart id cookie exists, then get the cart id
        boolean cartExists = false;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("cart_id".equals(cookie.getName())) {
                    cartId = cookie.getValue();
                    cartExists = true;
                    break;
                }
            }
        }

        // If the cartid cookie does not exist, then create a cart
        if (!cartExists) {
            Cart cart = new Cart();
            cartId = cart.getCartId();
            Cookie newCookie = new Cookie("cart_id", cartId);
            newCookie.setMaxAge(30 * 24 * 60 * 60); // 30 days validity
            response.addCookie(newCookie);
        }

        // If the same item found in the same cart, then we add the quantity
        boolean found = false;
        if (cartItemList.isEmpty() == false) {
            for (CartItem cartItem : cartItemList) {
                if (cartItem.getCartId().equals(cartId) && cartItem.getProd().getProdId().equals(prodId)) {
                    cartItem.setItemQty(cartItem.getItemQty() + itemQty);
                    found = true;
                    break;
                }
            }

        }

        // If the item not found, then just add to the cart
        if (!found) {
            cartItemList.add(new CartItem(cartId, prodDAO.getProductById(prodId), itemQty));
        }

        // Update the cartItemList in the session after modification (adding)
        session.setAttribute("cartItemList", cartItemList);

        // Set the success message to the user
        String message = "Item(s) added successfully.";
        session.setAttribute("message", message);

        response.sendRedirect("ProductDetail.jsp?id=" + prodId);
    }
}
