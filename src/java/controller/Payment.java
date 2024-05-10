package controller;

import java.io.IOException;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import javax.persistence.TypedQuery;
import jpaEntity.*;

@WebServlet(name = "Payment", urlPatterns = {"/Payment"})
public class Payment extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Initializations
        HttpSession session = request.getSession();

        // Check if user has logged in
        String username = (String) session.getAttribute("username");

        // If user has not logged in, then ask user to register an account
        if (username == null) {
            session.setAttribute("message", "Please sign up to continue.");
            response.sendRedirect("SignUp.jsp");
        } // If user has logged in, then redirect user to Payment.jsp
        else {
            doGet(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Initializations
        HttpSession session = request.getSession();

        // Retrieve username from session
        String username = (String) session.getAttribute("username");

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

            // Set the attributes
            request.setAttribute("cust-firstname", customer.getFirstname());
            request.setAttribute("cust-lastname", customer.getLastname());
            
            // Split the address into parts
            String address = customer.getAddress();
            String[] addressParts = address.split(", ");
            // Set address parts as attributes in the request
            if (addressParts.length >= 1) {
                request.setAttribute("cust-address-line1", addressParts[0]);
            }
            if (addressParts.length >= 2) {
                request.setAttribute("cust-address-line2", addressParts[1]);
            }
            
            request.setAttribute("cust-city", customer.getCity());
            request.setAttribute("cust-state", customer.getState());
            request.setAttribute("cust-postcode", customer.getPostalcode());
            request.setAttribute("cust-country", customer.getCountry());
            request.setAttribute("cust-contactNo", customer.getContactno());

            // Forward the request to the payment page
            RequestDispatcher dispatcher = request.getRequestDispatcher("Payment.jsp");
            dispatcher.forward(request, response);
            
            em.close();
            
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
}
