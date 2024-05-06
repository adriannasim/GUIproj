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

@WebServlet(name = "DeleteCartItem", urlPatterns = {"/DeleteCartItem"})
public class DeleteCartItem extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initialization
        HttpSession session = request.getSession();

        // Retrieve cartId from session
        String cartId = (String) session.getAttribute("cartId");

        // Retrieve cartItemList from session
        ArrayList<CartItem> cartItemList = (ArrayList<CartItem>) session.getAttribute("cartItemList");

        if (cartItemList == null) {
            cartItemList = new ArrayList<>();
        }

        // Delete Item in the session
        String prodId = request.getParameter("prodId");

        if (cartItemList.isEmpty() == false) {
            for (CartItem cartItem : cartItemList) {
                if (cartItem.getCartId().equals(cartId) && cartItem.getProd().getProdId().equals(prodId)) {
                    cartItemList.remove(cartItem); // remove cart item specified
                    break;
                }
            }
        }

        // Update the cartItemList in the session after modification (deletion)
        session.setAttribute("cartItemList", cartItemList);

        response.sendRedirect("Cart.jsp");
    }
}
