package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import jpaEntity.Customer;
import jpaEntity.CustomerPK;

@WebServlet(name = "DeleteCustomer", urlPatterns = {"/DeleteCustomer"})
public class DeleteCustomer extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            //Initializations
//        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
//        EntityManager em = emf.createEntityManager();

            //Get customer pk to delete
            String username = request.getParameter("username");
            String email = request.getParameter("email");

            utx.begin();
//            em.getTransaction().begin();
            //Find the customer using pk
            CustomerPK pk = new CustomerPK(username, email);
            Customer cust = em.find(Customer.class, pk);

            if (cust != null) {
                em.remove(cust);
//                em.getTransaction().commit();
                utx.commit();
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

//            em.close();
//            emf.close();
            response.sendRedirect("customers.jsp");
            
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
