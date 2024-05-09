package controller;

import java.io.IOException;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jpaEntity.Employee;

@WebServlet(name = "CheckAccountInput", urlPatterns = {"/CheckAccountInput"})
public class CheckAccountInput extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        EntityManager em = emf.createEntityManager();
        
        //If there's an empid parameter (means check id)
        if (request.getParameter("empid") != null)
        {
            String empid = request.getParameter("empid");
            //Check if the ID exists in the database
            TypedQuery<Employee> querystr = em.createQuery("SELECT emp FROM Employee emp WHERE emp.empid = :id", Employee.class);
            querystr.setParameter("id", empid);
            
            //If this id already exists
            if (querystr.getSingleResult() != null)
            {
                response.getWriter().write("ID Exists");
                return;
            }
            else
            {
                response.getWriter().write("ID Valid");
                return;
            }
        }
        //If there's an empusername parameter (means check username)
        else if (request.getParameter("empusername") != null)
        {
            String empusername = request.getParameter("empusername");
            //Check if the username exists in the database
            TypedQuery<Employee> querystr = em.createQuery("SELECT emp FROM Employee emp WHERE emp.username = :username", Employee.class);
            querystr.setParameter("username", empusername);
            
            //If this username already exists
            if (querystr.getSingleResult() != null)
            {
                response.getWriter().write("Username Exists");
                return;
            }
            else
            {
                response.getWriter().write("Username Valid");
                return;
            }
        }
        
        em.close();
        emf.close();
    }
}