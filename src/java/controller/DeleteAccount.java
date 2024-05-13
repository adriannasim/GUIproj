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
import jpaEntity.Employee;

@WebServlet(name = "DeleteAccount", urlPatterns = {"/DeleteAccount"})
public class DeleteAccount extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try{
        //Initializations
        //EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        //EntityManager em = emf.createEntityManager();

        //Get employee id to delete
        String empid = request.getParameter("id");
        
        System.out.println("emp id is "+empid);

        utx.begin();
        //em.getTransaction().begin();
        //Find the employee using prodId
        Employee emp = em.find(Employee.class, empid);
        if (emp != null) {
            em.remove(emp);
            //em.getTransaction().commit();
//            response.getWriter().write("Employee account deleted successfully");
            utx.commit();

            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Alert</title></head><body>");
            out.println("<script type='text/javascript'>");
            out.println("alert('Customer deleted successfully');");
            out.println("</script>");
            out.println("</body></html>");
            
            System.out.println("emp id is "+empid);

        } else {
//            response.getWriter().write("Employee account not found");

            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Alert</title></head><body>");
            out.println("<script type='text/javascript'>");
            out.println("alert('No such staff ID!');");
            out.println("</script>");
            out.println("</body></html>");
        }
        
        response.sendRedirect("staff.jsp");

        //em.close();
        //emf.close();
         } catch (Exception ex) {
            try {
                if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                    utx.rollback();
                }
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            ex.printStackTrace();
            response.sendRedirect("ErrorPage.jsp"); // Redirect to error page
        }

    }
}
