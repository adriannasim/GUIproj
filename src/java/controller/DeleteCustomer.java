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
import jpaEntity.Customer;
import jpaEntity.CustomerPK;

@WebServlet(name = "DeleteCustomer", urlPatterns = {"/DeleteCustomer"})
public class DeleteCustomer extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Initializations
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        EntityManager em = emf.createEntityManager();

        //Get customer pk to delete
        String username = request.getParameter("username");
        String email = request.getParameter("email");

        em.getTransaction().begin();
        //Find the customer using pk
        CustomerPK pk = new CustomerPK(username, email);
        Customer cust = em.find(Customer.class, pk);

        if (cust != null) {
            em.remove(cust);
            em.getTransaction().commit();
//            response.getWriter().write("Customer account deleted successfully");

            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Alert</title></head><body>");
            out.println("<script type='text/javascript'>");
            out.println("alert('Customer deleted successfully');");
            out.println("</script>");
            out.println("</body></html>");
        } else {
//            response.getWriter().write("Customer account not found");
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
