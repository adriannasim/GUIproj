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
            response.sendRedirect("404Error.jsp"); // Redirect to error page
            return;
        }
        // Retrieve customer orders details
        // Packaging status
        if (request.getParameter("status") != null && request.getParameter("status").equals("packaging")) {
            try {
                utx.begin();

                TypedQuery<Custorder> query = em.createQuery(
                        "SELECT co FROM Custorder co "
                        + "WHERE co.username = :username AND co.status = :status",
                        Custorder.class);
                query.setParameter("username", username);
                query.setParameter("status", "Packaging");

                List<Custorder> orderList = query.getResultList();

                // For each Custorder, retrieve associated Orderitems
                for (Custorder custorder : orderList) {
                    String orderId = custorder.getOrderid();

                    // Retrieve Orderitems for the current Custorder
                    TypedQuery<Orderitem> orderItemQuery = em.createQuery(
                            "SELECT oi FROM Orderitem oi WHERE oi.orderitemPK.orderid = :orderId",
                            Orderitem.class);
                    orderItemQuery.setParameter("orderId", orderId);
                    List<Orderitem> orderItems = orderItemQuery.getResultList();

                    // Set the retrieved Orderitems to the Custorder
                    custorder.setOrderitems(orderItems);
                }

                session.setAttribute("orderList", orderList);
                logger.info("Retrieved orderList in shipping: " + session.getAttribute("orderList"));

                utx.commit();

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
        } // Shipping status
        else if (request.getParameter("status") != null && request.getParameter("status").equals("shipping")) {
            try {
                utx.begin();

                TypedQuery<Custorder> query = em.createQuery(
                        "SELECT co FROM Custorder co "
                        + "WHERE co.username = :username AND co.status = :status",
                        Custorder.class);
                query.setParameter("username", username);
                query.setParameter("status", "Shipping");

                List<Custorder> orderList = query.getResultList();

                // For each Custorder, retrieve associated Orderitems
                for (Custorder custorder : orderList) {
                    String orderId = custorder.getOrderid();

                    // Retrieve Orderitems for the current Custorder
                    TypedQuery<Orderitem> orderItemQuery = em.createQuery(
                            "SELECT oi FROM Orderitem oi WHERE oi.orderitemPK.orderid = :orderId",
                            Orderitem.class);
                    orderItemQuery.setParameter("orderId", orderId);
                    List<Orderitem> orderItems = orderItemQuery.getResultList();

                    // Set the retrieved Orderitems to the Custorder
                    custorder.setOrderitems(orderItems);
                }

                session.setAttribute("orderList", orderList);
                logger.info("Retrieved orderList in shipping: " + session.getAttribute("orderList"));

                utx.commit();

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
        } // Delivery status
        else if (request.getParameter("status") != null && request.getParameter("status").equals("delivery")) {
            try {
                utx.begin();

                TypedQuery<Custorder> query = em.createQuery(
                        "SELECT co FROM Custorder co "
                        + "WHERE co.username = :username AND co.status = :status", Custorder.class);
                query.setParameter("username", username);
                query.setParameter("status", "Delivery");

                List<Custorder> orderList = query.getResultList();

                // For each Custorder, retrieve associated Orderitems
                for (Custorder custorder : orderList) {
                    String orderId = custorder.getOrderid();

                    // Retrieve Orderitems for the current Custorder
                    TypedQuery<Orderitem> orderItemQuery = em.createQuery(
                            "SELECT oi FROM Orderitem oi WHERE oi.orderitemPK.orderid = :orderId",
                            Orderitem.class);
                    orderItemQuery.setParameter("orderId", orderId);
                    List<Orderitem> orderItems = orderItemQuery.getResultList();

                    // Set the retrieved Orderitems to the Custorder
                    custorder.setOrderitems(orderItems);
                }

                session.setAttribute("orderList", orderList);
                logger.info("Retrieved orderList in shipping: " + session.getAttribute("orderList"));

                utx.commit();

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
        } // All
        else {
            try {
                utx.begin();

                TypedQuery<Custorder> query = em.createQuery(
                        "SELECT co FROM Custorder co WHERE co.username = :username",
                        Custorder.class);
                query.setParameter("username", username);
                List<Custorder> orderList = query.getResultList();

                System.out.println("Retrieved Custorder count: " + orderList.size()); // Log the number of Custorder objects retrieved

                // For each Custorder, retrieve associated Orderitems
                for (Custorder custorder : orderList) {
                    String orderId = custorder.getOrderid();

                    // Retrieve Orderitems for the current Custorder
                    TypedQuery<Orderitem> orderItemQuery = em.createQuery(
                            "SELECT oi FROM Orderitem oi WHERE oi.orderitemPK.orderid = :orderId",
                            Orderitem.class);
                    orderItemQuery.setParameter("orderId", orderId);
                    List<Orderitem> orderItems = orderItemQuery.getResultList();

                    // Set the retrieved Orderitems to the Custorder
                    custorder.setOrderitems(orderItems);
                    System.out.println("Custorder ID: " + orderId + ", Orderitems count: " + orderItems.size()); // Log the Orderitems count for each Custorder
                }

                session.setAttribute("orderList", orderList);
                System.out.println("Retrieved orderList in all: " + session.getAttribute("orderList")); // Log the orderList set in the session

                utx.commit();
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
