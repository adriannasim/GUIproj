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
        
        String role = "staff";
        String id = request.getParameter("empid");
        String username = request.getParameter("username");
        String password = "defaultPassword1@";
        String email = request.getParameter("email");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String gender = request.getParameter("gender");
        String contact = request.getParameter("contact");
        
        
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
