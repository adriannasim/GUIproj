package controller;

import jpaEntity.Customer;
import jpaEntity.CustomerPK;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.persistence.*;
import javax.transaction.UserTransaction;

@WebServlet(name = "EditCustomer", urlPatterns = {"/EditCustomer"})
public class EditCustomer extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //Initializations
//            EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
//            EntityManager em = emf.createEntityManager();

            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String firstname = request.getParameter("firstName");
            String lastname = request.getParameter("lastName");
            String contact = request.getParameter("contact");

            String dobString = request.getParameter("birth");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date dob = null;
            try {
                dob = dateFormat.parse(dobString);
            } catch (Exception e) {
                System.out.println(e);
            }

            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String city = request.getParameter("locality");
            String state = request.getParameter("state");
            String postalcode = request.getParameter("postalCode");
            String country = request.getParameter("country");

            CustomerPK pk = new CustomerPK(username, email);

            //Find customer based on the username
//            em.getTransaction().begin();
            utx.begin();
            Customer cust = em.find(Customer.class, pk);

            //Update all properties
            cust.setFirstname(firstname);
            cust.setLastname(lastname);
            cust.setContactno(contact);
            cust.setDateofbirth(dob);
            cust.setGender(gender);
            cust.setAddress(address);
            cust.setCity(city);
            cust.setState(state);
            cust.setPostalcode(postalcode);
            cust.setCountry(country);

            //Commit changes into db
//            em.getTransaction().commit();
            utx.commit();

//            em.close();
//            emf.close();
            response.sendRedirect("customers.jsp");
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
