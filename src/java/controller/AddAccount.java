package controller;

import jpaEntity.Employee;
import java.io.*;
import java.math.BigDecimal;
import java.util.*;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.transaction.UserTransaction;

@WebServlet(name = "AddAccount", urlPatterns = {"/AddAccount"})
public class AddAccount extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{//Initializations
            utx.begin();
        //EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        //EntityManager em = emf.createEntityManager();
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
        //em.getTransaction().begin();
        em.persist(emp);
        //em.getTransaction().commit();
        
        utx.commit();

        //em.close();
        //emf.close();
        
        response.sendRedirect("staff.jsp");
        }   catch (Exception ex) {
                // Rollback transaction if an exception occurs
                try {
                    if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                        utx.rollback();
                    }
                } catch (Exception rollbackEx) {
                    rollbackEx.printStackTrace();
                }
                ex.printStackTrace();
            }
    }
}
