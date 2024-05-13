package controller;

import jpaEntity.Employee;
import java.io.*;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.persistence.*;
import javax.transaction.UserTransaction;

@WebServlet(name = "ManageAccounts", urlPatterns = {"/ManageAccounts"})
public class ManageAccounts extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //Initializations
            //EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
            //EntityManager em = emf.createEntityManager();

            String username = request.getParameter("name");
            String id = request.getParameter("empid");
            String email = request.getParameter("email");
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String contact = request.getParameter("contact");
            String gender = request.getParameter("gender");

            utx.begin();
            //Find employee based on the username
            //em.getTransaction().begin();
            Employee emp = em.find(Employee.class, username);

            //Update all properties
            emp.setEmpid(id);
            emp.setEmail(email);
            emp.setFirstname(firstname);
            emp.setLastname(lastname);
            emp.setContactno(contact);
            emp.setGender(gender);

            //Commit changes into db
            //em.getTransaction().commit();
            utx.commit();
            //em.close();
            //emf.close();
            response.sendRedirect("staff.jsp");
        } catch (Exception ex) {
            try {
                if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                    utx.rollback();
                }
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            ex.printStackTrace();
            response.sendRedirect("404Error.jsp"); // Redirect to error page
        }
    }
}
