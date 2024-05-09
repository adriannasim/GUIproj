package controller;

import jpaEntity.Employee;
import java.io.*;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.persistence.*;

@WebServlet(name = "ChangeRole", urlPatterns = {"/ChangeRole"})
public class ChangeRole extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //Initializations
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        EntityManager em = emf.createEntityManager();
        
        String username = request.getParameter("username");
        String role = request.getParameter("role");
        
        //Find employee based on the username
        em.getTransaction().begin();
        Employee emp = em.find(Employee.class, username);
        
        //Update all properties
        emp.setEmprole(role);
        
        //Commit changes into db
        em.getTransaction().commit();

        em.close();
        emf.close();
        
        //Send a message to be prompted for user
        response.getWriter().write("Role updated successfully to " + role);
    }
}
