package controller;

import java.io.IOException;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
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
import java.util.logging.Logger;

@WebServlet(name = "RetrieveCustomerProfile", urlPatterns = {"/RetrieveCustomerProfile"})
public class RetrieveCustomerProfile extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    private static final Logger logger = Logger.getLogger(RetrieveCustomerProfile.class.getName());
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initialization
        HttpSession session = request.getSession();

        // Retrieve username from session
        String username = (String) session.getAttribute("username");

        // Check if the username is present in the session
        if (username == null) {
            response.sendRedirect("SignIn.jsp"); // Redirect to signin page 
            return;
        }

        // Retrieve Customer Details
        try {
            // Use a JPQL query to retrieve the customer based on the username
            TypedQuery<Customer> query = em.createNamedQuery("Customer.findByUsername", Customer.class);
            query.setParameter("username", username);

            // Execute the query and get the result
            Customer customer = query.getSingleResult();

            // Save the customer details into the session
            session.setAttribute("customer", customer);

        } catch (Exception ex) {
            try {
                if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                    utx.rollback();
                }
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            ex.printStackTrace();
            response.sendRedirect("ErrorPage.jsp"); // Redirect to error page 
            return;
        }

        // Retrieve customer orders details
        // Packaging status
        if (request.getParameter("status") != null && request.getParameter("status").equals("packaging")) {
            try {
                TypedQuery<Custorder> query = em.createNamedQuery("Custorder.findByUsernameAndStatus", Custorder.class);
                query.setParameter("username", username);
                query.setParameter("status", "Packaging");

                ArrayList<Custorder> orderList = new ArrayList<>(query.getResultList());

                // For each order, retrieve its associated order items
                for (Custorder order : orderList) {
                    TypedQuery<Orderitem> orderItemQuery = em.createNamedQuery("Orderitem.findByOrderid", Orderitem.class);
                    orderItemQuery.setParameter("orderid", order.getOrderid());
                    List<Orderitem> orderItemList = orderItemQuery.getResultList();
                    ArrayList<Orderitem> orderitems = new ArrayList<>(orderItemList);

                    order.setOrderitems(orderitems);
                }

                session.setAttribute("orderList", orderList);
                
                logger.info("Retrieved orderList in packaging: " + orderList);

            } catch (Exception ex) {
                try {
                    if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                        utx.rollback();
                    }
                } catch (Exception rollbackEx) {
                    rollbackEx.printStackTrace();
                }
                ex.printStackTrace();

                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing payment.");
            }
        } 
        // Shipping status
        else if (request.getParameter("status") != null && request.getParameter("status").equals("shipping")) {
            try {

                TypedQuery<Custorder> query = em.createNamedQuery("Custorder.findByUsernameAndStatus", Custorder.class);
                query.setParameter("username", username);
                query.setParameter("status", "Shipping");

                ArrayList<Custorder> orderList = new ArrayList<>(query.getResultList());

                // For each order, retrieve its associated order items
                for (Custorder order : orderList) {
                    TypedQuery<Orderitem> orderItemQuery = em.createNamedQuery("Orderitem.findByOrderid", Orderitem.class);
                    orderItemQuery.setParameter("orderid", order.getOrderid());
                    List<Orderitem> orderItemList = orderItemQuery.getResultList();
                    ArrayList<Orderitem> orderitems = new ArrayList<>(orderItemList);

                    order.setOrderitems(orderitems);
                }
                
                session.setAttribute("orderList", orderList);
                
                logger.info("Retrieved orderList in shipping: " + orderList);

            } catch (Exception ex) {
                try {
                    if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                        utx.rollback();
                    }
                } catch (Exception rollbackEx) {
                    rollbackEx.printStackTrace();
                }
                ex.printStackTrace();

                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing payment.");
            }
        } 
        // Delivery status
        else if (request.getParameter("status") != null && request.getParameter("status").equals("delivery")) {
            try {

                TypedQuery<Custorder> query = em.createNamedQuery("Custorder.findByUsernameAndStatus", Custorder.class);
                query.setParameter("username", username);
                query.setParameter("status", "Delivery");

                ArrayList<Custorder> orderList = new ArrayList<>(query.getResultList());

                // For each order, retrieve its associated order items
                for (Custorder order : orderList) {
                    TypedQuery<Orderitem> orderItemQuery = em.createNamedQuery("Orderitem.findByOrderid", Orderitem.class);
                    orderItemQuery.setParameter("orderid", order.getOrderid());
                    List<Orderitem> orderItemList = orderItemQuery.getResultList();
                    ArrayList<Orderitem> orderitems = new ArrayList<>(orderItemList);

                    order.setOrderitems(orderitems);
                }

                session.setAttribute("orderList", orderList);
                
                logger.info("Retrieved orderList in delivery: " + orderList);

            } catch (Exception ex) {
                try {
                    if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                        utx.rollback();
                    }
                } catch (Exception rollbackEx) {
                    rollbackEx.printStackTrace();
                }
                ex.printStackTrace();

                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing payment.");
            }
        } 
        // All
        else {
            try {

                TypedQuery<Custorder> query = em.createNamedQuery("Custorder.findByUsername", Custorder.class);
                query.setParameter("username", username);

                ArrayList<Custorder> orderList = new ArrayList<>(query.getResultList());

                // For each order, retrieve its associated order items
                for (Custorder order : orderList) {
                    TypedQuery<Orderitem> orderItemQuery = em.createNamedQuery("Orderitem.findByOrderid", Orderitem.class);
                    orderItemQuery.setParameter("orderid", order.getOrderid());
                    List<Orderitem> orderItemList = orderItemQuery.getResultList();
                    ArrayList<Orderitem> orderitems = new ArrayList<>(orderItemList);

                    order.setOrderitems(orderitems);
                }

                session.setAttribute("orderList", orderList);
                
                logger.info("Retrieved orderList in all: " + orderList);

            } catch (Exception ex) {
                try {
                    if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                        utx.rollback();
                    }
                } catch (Exception rollbackEx) {
                    rollbackEx.printStackTrace();
                }
                ex.printStackTrace();

                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing payment.");
            }
        }

        // Response redirect to customer profile page
        response.sendRedirect("CustomerProfile.jsp");
    }
}
