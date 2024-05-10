package controller;

import jpaEntity.Customer;
import jpaEntity.CustomerPK;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.persistence.*;

@WebServlet(name = "EditCustomer", urlPatterns = {"/EditCustomer"})
public class EditCustomer extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //Initializations
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        EntityManager em = emf.createEntityManager();
        
        String username = request.getParameter("custusername");
        String email = request.getParameter("custemail");
        String firstname = request.getParameter("custfirst");
        String lastname = request.getParameter("custlast");
        String contact = request.getParameter("custcontact");
        
        String dobString = request.getParameter("custdob");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date dob = null;
        try
        {
            dob = dateFormat.parse(dobString);
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
        
        String gender = request.getParameter("gender");
        String address = request.getParameter("custadd");
        String city = request.getParameter("custcity");
        String state = request.getParameter("custstate");
        String postalcode = request.getParameter("custpost");
        String country = request.getParameter("custcountry");
        
        CustomerPK pk = new CustomerPK(username, email);
        //Find employee based on the username
        em.getTransaction().begin();
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
        em.getTransaction().commit();

        em.close();
        emf.close();
    }
}
