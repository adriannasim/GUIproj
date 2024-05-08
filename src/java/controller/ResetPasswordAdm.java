package controller;

import jpaEntity.Employee;
import java.io.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.persistence.*;

@WebServlet(name = "ResetPasswordAdm", urlPatterns = {"/ResetPasswordAdm"})
public class ResetPasswordAdm extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //Initializations
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        EntityManager em = emf.createEntityManager();
        
        //Get id from url
        String username = request.getParameter("id");
        
        String psw = request.getParameter("emppswcon");
        
        //Find employee based on the username
        em.getTransaction().begin();
        Employee emp = em.find(Employee.class, username);
        
        //Update all properties
        emp.setUserpwd(psw);
        
        //Commit changes into db
        em.getTransaction().commit();

        em.close();
        emf.close();
    }
}