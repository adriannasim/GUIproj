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

@WebServlet(name = "AddToCart", urlPatterns = { "/AddToCart" })
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
        if (!cartItemList.isEmpty()) {
            for (CartItem cartItem : cartItemList) {
                if (cartItem.getCartId().equals(cartId) && cartItem.getProd().getProdId().equals(prodId)) {
                    // Calculate the total quantity after adding the new quantity
                    int totalQuantity = cartItem.getItemQty() + itemQty;

                    // Check if the total quantity exceeds the available quantity
                    if (totalQuantity > cartItem.getProd().getQtyAvailable()) {
                        // Notify the customer that they can only purchase up to the available quantity
                        response.setContentType("text/plain");
                        response.setCharacterEncoding("UTF-8");
                        response.getWriter().write("Exceeded quantity available.");
                    } else {
                        // Update the quantity normally
                        cartItem.setItemQty(totalQuantity);
                        // Set the success message to the user
                        response.setContentType("text/plain");
                        response.setCharacterEncoding("UTF-8");
                        response.getWriter().write("Item(s) added successfully.");
                    }

                    found = true;
                    break;
                }
            }
        }

        // If the item not found, then just add the item to the cart
        if (!found) {
            cartItemList.add(new CartItem(cartId, prodDAO.getProductById(prodId), itemQty));
            // Set the success message to the user
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("Item(s) added successfully.");
        }

        // Update the cartItemList in the session after modification (adding)
        session.setAttribute("cartItemList", cartItemList);

    }
}
