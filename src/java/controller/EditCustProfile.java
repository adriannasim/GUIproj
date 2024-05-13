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
import jpaEntity.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


@WebServlet(name = "EditCustProfile", urlPatterns = { "/EditCustProfile" })
public class EditCustProfile extends HttpServlet {

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
        CustomerPK customerPK = customer.getCustomerPK();

        // Set request attributes
        request.setAttribute("firstname", customer.getFirstname());
        request.setAttribute("lastname", customer.getLastname());
        request.setAttribute("contactNo", customer.getContactno());
        request.setAttribute("email", customerPK.getEmail());
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = dateFormat.format(customer.getDateofbirth());
        request.setAttribute("dateOfBirth", formattedDate);

        // Forward the request to the JSP with request parameters
        RequestDispatcher dispatcher = request.getRequestDispatcher("CustEditProfile.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initializations
        HttpSession session = request.getSession();

        String username = (String) session.getAttribute("username");
        String firstname = request.getParameter("edit-profile-firstname");
        String lastname = request.getParameter("edit-profile-lastname");
        String contactNo = request.getParameter("edit-profile-contactno");
        //String email = request.getParameter("edit-profile-email");
        String dobString = request.getParameter("edit-profile-dob");

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date dob = null;
        try {
            dob = dateFormat.parse(dobString);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // Update profile
        try {
            utx.begin();

            TypedQuery<Customer> query = em.createNamedQuery("Customer.findByUsername", Customer.class);
            query.setParameter("username", username);

            Customer customer = query.getSingleResult();
            //CustomerPK customerPK = customer.getCustomerPK();

            // Update the customer details
            customer.setFirstname(firstname);
            customer.setLastname(lastname);
            customer.setContactno(contactNo);
            //customerPK.setEmail(email);
            customer.setDateofbirth(dob);

            // Merge the updated customer object back into the database
            em.merge(customer);

            utx.commit();

            response.sendRedirect("CustomerProfile.jsp");
            
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
        }
    }

}
