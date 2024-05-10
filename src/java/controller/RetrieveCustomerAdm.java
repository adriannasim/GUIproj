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
public class RetrieveCustomerAdm extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //Initializations
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        EntityManager em = emf.createEntityManager();
        
        //Get Employee from db
        //If id exists (means its from ManageAccountsMenu.jsp)
        if (request.getParameter("us") != null && request.getParameter("email") != null) 
        {
            String username = request.getParameter("us");
            String email = request.getParameter("email");
            CustomerPK pk = new CustomerPK(username, email);
            
            Customer cust = em.find(Customer.class, pk);
            request.setAttribute("cust", cust);
            
        }
        //If id slug doesnt exists (means its from ManageAccounts.jsp)
        else 
        {
            TypedQuery<Customer> querystr = em.createQuery("SELECT cust FROM Customer cust", Customer.class);
            List<Customer> custList = querystr.getResultList();
            request.setAttribute("custList", custList);
        }
        
        em.close();
        emf.close();

        //Send response to jsp
        response.sendRedirect("EditCustomer.jsp");
        response.sendRedirect("EditCustomerMenu.jsp");
    }
}