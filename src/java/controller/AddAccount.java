package controller;

import jpaEntity.Employee;
import java.io.*;
import java.math.BigDecimal;
import java.util.*;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "AddAccount", urlPatterns = {"/AddAccount"})
public class AddAccount extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //Initializations
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        EntityManager em = emf.createEntityManager();
        Employee emp = new Employee();
        
        String role = request.getParameter("role");
        String id = request.getParameter("empid");
        String username = request.getParameter("empusername");
        String password = request.getParameter("emppswcon");
        String email = request.getParameter("empemail");
        String firstname = request.getParameter("empfirst");
        String lastname = request.getParameter("emplast");
        String gender = request.getParameter("gender");
        String contact = request.getParameter("empcontact");
        
        
        //Setting varibles into product entity
        emp.setEmprole(role);
        emp.setEmpid(id);
        emp.setUsername(username);
        emp.setUserpwd(password);
        emp.setEmail(email);
        emp.setFirstname(firstname);
        emp.setLastname(lastname);
        emp.setGender(gender);
        emp.setContactno(contact);

        //Insert into db using JPA
        em.getTransaction().begin();
        em.persist(emp);
        em.getTransaction().commit();

        em.close();
        emf.close();
    }
}
