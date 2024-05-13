package controller;

import jpaEntity.Customer;
import jpaEntity.CustomerPK;
import java.io.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.persistence.*;

@WebServlet(name = "RetrieveCustomerAdm", urlPatterns = {"/RetrieveCustomerAdm"})
public class RetrieveCustomerAdm extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Initializations
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        EntityManager em = emf.createEntityManager();
        HttpSession session = request.getSession();

        //Get Employee from db
        //If id exists (means its from editCustomer.jsp) 
        if (request.getParameter("user") != null) {
            String username = request.getParameter("user");
            String email = request.getParameter("email");
            CustomerPK pk = new CustomerPK();
            pk.setUsername(username);
            pk.setEmail(email);

            Customer cust = em.find(Customer.class, pk);
//            request.setAttribute("cust", cust);

            // Forward the request to the editCustomer.jsp page
            //request.getRequestDispatcher("editCustomer.jsp").forward(request, response);
            session.setAttribute("cust", cust);

        } //If id slug doesnt exists (means its from customers.jsp)
        else {
            TypedQuery<Customer> querystr = em.createQuery("SELECT cust FROM Customer cust", Customer.class);
            List<Customer> custList = querystr.getResultList();
            request.setAttribute("custList", custList);

            // Forward the request to the customers.jsp page
            request.getRequestDispatcher("customers.jsp").forward(request, response);
        }

        em.close();
        emf.close();
    }
}
