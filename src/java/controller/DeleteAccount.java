package controller;

import java.io.IOException;
import java.io.PrintWriter;
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Initializations
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        EntityManager em = emf.createEntityManager();

        //Get employee id to delete
        String empid = request.getParameter("id");

        em.getTransaction().begin();
        //Find the employee using prodId
        Employee emp = em.find(Employee.class, empid);
        if (emp != null) {
            em.remove(emp);
            em.getTransaction().commit();
//            response.getWriter().write("Employee account deleted successfully");

            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Alert</title></head><body>");
            out.println("<script type='text/javascript'>");
            out.println("alert('Customer deleted successfully');");
            out.println("</script>");
            out.println("</body></html>");
        } else {
//            response.getWriter().write("Employee account not found");

            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Alert</title></head><body>");
            out.println("<script type='text/javascript'>");
            out.println("alert('No such staff ID!');");
            out.println("</script>");
            out.println("</body></html>");
        }

        em.close();
        emf.close();
    }
}
