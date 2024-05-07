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

@WebServlet(name = "UpdateCart", urlPatterns = {"/UpdateCart"})
public class UpdateCart extends HttpServlet {

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

        // Update Item in the session
        String prodId = request.getParameter("prodId");
        int itemQty = Integer.parseInt(request.getParameter("qty"));

        if (cartItemList.isEmpty() == false) {
            for (CartItem cartItem : cartItemList) {
                if (cartItem.getCartId().equals(cartId) && cartItem.getProd().getProdId().equals(prodId)) {
                    cartItem.setItemQty(itemQty);
                    break;
                }
            }
        }

        // Update the cartItemList in the session after modification (adding or subtracting the qty)
        session.setAttribute("cartItemList", cartItemList);

        //response.setContentType("text/plain");
        //response.setCharacterEncoding("UTF-8");
        //response.getWriter().write("Item updated.");
        
        response.sendRedirect("Cart.jsp");
    }
}
