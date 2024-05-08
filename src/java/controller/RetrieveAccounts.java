package controller;

import jpaEntity.Employee;
import java.io.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.persistence.*;

@WebServlet(name = "RetrieveAccounts", urlPatterns = {"/RetrieveAccounts"})
public class RetrieveAccounts extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //Initializations
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        EntityManager em = emf.createEntityManager();
        
        //Get id from url
        String id = request.getParameter("id");
        
        //Get Employee from db
        //If id exists (means its from ManageAccountsMenu.jsp)
        if (id != null) 
        {
            TypedQuery<Employee> querystr = em.createQuery("SELECT emp FROM Employee emp WHERE emp.empid = :id", Employee.class);
            querystr.setParameter("id", id);
            Employee emp = querystr.getSingleResult();
            request.setAttribute("emp", emp);
            
        }
        //If id slug doesnt exists (means its from ManageAccounts.jsp)
        else 
        {
            TypedQuery<Employee> querystr = em.createQuery("SELECT emp FROM Employee emp", Employee.class);
            List<Employee> empList = querystr.getResultList();
            request.setAttribute("empList", empList);
        }
        
        em.close();
        emf.close();

        //Send response to jsp
        response.sendRedirect("ManageAccountsMenu.jsp");
        response.sendRedirect("ManageAccounts.jsp");
    }
}