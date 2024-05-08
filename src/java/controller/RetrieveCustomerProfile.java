package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import jpaEntity.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "RetrieveCustomerProfile", urlPatterns = {"/RetrieveCustomerProfile"})
public class RetrieveCustomerProfile extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initialization
        HttpSession session = request.getSession();

        // Retrieve username from session
        String username = (String) session.getAttribute("username");

        // Check if the username is present in the session
        if (username == null) {
            // Handle case where username is not available in session
            response.sendRedirect("SignIn.jsp"); // Redirect to signin page 
            return;
        }

        // Retrieve Customer Details
        try {
            // Begin transaction
            utx.begin();

            // Use a JPQL query to retrieve the customer based on the username
            TypedQuery<Customer> query = em.createNamedQuery("Customer.findByUsername", Customer.class);
            query.setParameter("username", username);

            // Execute the query and get the result
            Customer customer = query.getSingleResult();

            // Commit transaction
            utx.commit();

            // Save the customer details into the session
            session.setAttribute("customer", customer);

        } catch (Exception ex) {
            // Rollback transaction if an exception occurs
            try {
                if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                    utx.rollback();
                }
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            ex.printStackTrace();
            response.sendRedirect("ErrorPage.jsp"); // Redirect to error page or handle appropriately
            return;
        }

        // Retrieve customer orders details
        // Packaging status
        if (request.getParameter("status") != null && !request.getParameter("status").equals("packaging")) {

        } // Shipping status
        else if (request.getParameter("status") != null && !request.getParameter("status").equals("shipping")) {

        } // Delivery status
        else if (request.getParameter("status") != null && !request.getParameter("status").equals("delivery")) {

        } // All
        else {
            try {
                // Begin transaction
                utx.begin();

                // Use a JPQL query to retrieve the customer based on the username
                TypedQuery<Custorder> query = em.createNamedQuery("Custorder.findByUsername", Custorder.class);
                query.setParameter("username", username);
                
                // Execute the query and get the result
                ArrayList<Custorder> allOrderList = new ArrayList<>(query.getResultList());

                // For each order, retrieve its associated order items
                for (Custorder order : allOrderList) {
                    // Use a JPQL query to retrieve the order items for the current order
                    TypedQuery<Orderitem> orderItemQuery = em.createNamedQuery("Orderitem.findByOrderid", Orderitem.class);
                    orderItemQuery.setParameter("orderid", order.getOrderid()); // Set the orderId parameter
                    List<Orderitem> orderItemList = orderItemQuery.getResultList(); // Execute the query and get the result list
                    ArrayList<Orderitem> orderitems = new ArrayList<>(orderItemList);

                    // Set the list of order items for the current order
                    order.setOrderitems(orderitems);
                }

                // Commit transaction
                utx.commit();

                // Save the list in orderList
                session.setAttribute("orderList", allOrderList);

            } catch (Exception ex) {
                // Rollback transaction if an exception occurs
                try {
                    if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                        utx.rollback();
                    }
                } catch (Exception rollbackEx) {
                    rollbackEx.printStackTrace();
                }
                ex.printStackTrace();
                // Handle exception
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing payment.");
            }
        }

        // Response redirect to customer profile page
        response.sendRedirect("CustomerProfile.jsp");
    }
}
