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
import entity.CustOrder;
import model.*;

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

            // Initialization
            OrderItemDAO orderItemDAO = new OrderItemDAO();
            CustOrderDAO custOrderDAO = new CustOrderDAO();

            try {
                ArrayList<CustOrder> orderList = custOrderDAO.getCustOrderByUsernameAndStatus(username, "Packaging");
                for (CustOrder order : orderList) {
                    order.setOrderItems(orderItemDAO.retrieveOrderItem(order.getOrderId()));
                }

                session.setAttribute("orderList", orderList);
                logger.info("Retrieved orderList in packaging: "
                        + session.getAttribute("orderList"));

            } catch (Exception ex) {

                ex.printStackTrace();

            }
        } // Shipping status
        else if (request.getParameter("status") != null && request.getParameter("status").equals("shipping")) {
            // Initialization
            OrderItemDAO orderItemDAO = new OrderItemDAO();
            CustOrderDAO custOrderDAO = new CustOrderDAO();

            try {
                ArrayList<CustOrder> orderList = custOrderDAO.getCustOrderByUsernameAndStatus(username, "Shipping");
                for (CustOrder order : orderList) {
                    order.setOrderItems(orderItemDAO.retrieveOrderItem(order.getOrderId()));
                }

                session.setAttribute("orderList", orderList);
                logger.info("Retrieved orderList in shipping: "
                        + session.getAttribute("orderList"));

            } catch (Exception ex) {

                ex.printStackTrace();

            }
        } // Delivery status
        else if (request.getParameter("status") != null && request.getParameter("status").equals("delivery")) {
            // Initialization
            OrderItemDAO orderItemDAO = new OrderItemDAO();
            CustOrderDAO custOrderDAO = new CustOrderDAO();

            try {
                ArrayList<CustOrder> orderList = custOrderDAO.getCustOrderByUsernameAndStatus(username, "Delivery");
                for (CustOrder order : orderList) {
                    order.setOrderItems(orderItemDAO.retrieveOrderItem(order.getOrderId()));
                }

                session.setAttribute("orderList", orderList);
                logger.info("Retrieved orderList in packaging: "
                        + session.getAttribute("orderList"));

            } catch (Exception ex) {

                ex.printStackTrace();

            }
        } // All
        else {
            // Initialization
            OrderItemDAO orderItemDAO = new OrderItemDAO();
            CustOrderDAO custOrderDAO = new CustOrderDAO();

            try {
                ArrayList<CustOrder> orderList = custOrderDAO.getCustOrderByUsername(username);
                for (CustOrder order : orderList) {
                    order.setOrderItems(orderItemDAO.retrieveOrderItem(order.getOrderId()));
                }

                session.setAttribute("orderList", orderList);
                logger.info("Retrieved orderList in all: "
                        + session.getAttribute("orderList"));

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
