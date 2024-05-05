package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
        
        // Retrieve cartId from session
        String cartId = (String) session.getAttribute("cartId");

        // Retrieve cartItemList from session
        ArrayList<CartItem> cartItemList = (ArrayList<CartItem>) session.getAttribute("cartItemList");

        if (cartItemList == null) {
            cartItemList = new ArrayList<>();
        }

        // Add Item into session
        String prodId = request.getParameter("prodId");
        int itemQty = Integer.parseInt(request.getParameter("itemQty"));

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

        // If the item not found, then just add the item to the cart
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
