package controller;

import java.io.IOException;
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
import jpaEntity.Customer;


@WebServlet(name = "EditCustAddress", urlPatterns = {"/EditCustAddress"})
public class EditCustAddress extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initializations
        HttpSession session = request.getSession();

        // Retrieve user details from session
        Customer customer = (Customer) session.getAttribute("customer");

        // Set request attributes
        String[] parts = customer.getAddress().split(",");
        String address1 = parts[0].trim(); 
        String address2 = (parts.length > 1) ? parts[1].trim() : ""; 
        
        request.setAttribute("address1", address1);
        request.setAttribute("address2", address2);
        request.setAttribute("postcode", customer.getPostalcode());
        request.setAttribute("city", customer.getCity());
        request.setAttribute("country", customer.getCountry());
        request.setAttribute("state", customer.getState());

        // Forward the request to the JSP with request parameters
        RequestDispatcher dispatcher = request.getRequestDispatcher("CustAddressBook.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initializations
        HttpSession session = request.getSession();

        String username = (String) session.getAttribute("username");
        String address1 = request.getParameter("ship-address");
        String address2 = request.getParameter("address2");
        String city = request.getParameter("locality");
        String postcode = request.getParameter("postcode");
        String state = request.getParameter("state");
        String country = request.getParameter("country");

        // Update Address Details
        try {
            utx.begin();

            TypedQuery<Customer> query = em.createNamedQuery("Customer.findByUsername", Customer.class);
            query.setParameter("username", username);

            Customer customer = query.getSingleResult();
            
            String addressLine;
            if (address2 != null && !address2.isEmpty()) {
                addressLine = address1 + ", " + address2;
            } else {
                addressLine = address1;
            }
            // Update the customer details
            customer.setAddress(addressLine);
            customer.setCity(city);
            customer.setPostalcode(postcode);
            customer.setState(state);
            customer.setCountry(country);
            
            // Merge the updated customer object back into the database
            em.merge(customer);

            utx.commit();

            response.sendRedirect("CustomerProfile.jsp");
            //em.close();
            

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
        }
    }
}
