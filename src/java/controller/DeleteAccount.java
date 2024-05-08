package controller;

import java.io.IOException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jpaEntity.Employee;

@WebServlet(name = "DeleteAccount", urlPatterns = {"/DeleteAccount"})
public class DeleteAccount extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {

        //Initializations
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        EntityManager em = emf.createEntityManager();

        //Get product id to delete
        String empid = request.getParameter("id");
        
        em.getTransaction().begin();
        //Find the product using prodId
        Employee emp = em.find(Employee.class, empid);
        if (emp != null)
        {
            em.remove(emp);
            em.getTransaction().commit();
            response.getWriter().write("Employee account deleted successfully");
        } 
        else
        {
            response.getWriter().write("Employee account not found");
        }

        em.close();
        emf.close();
    }
}
