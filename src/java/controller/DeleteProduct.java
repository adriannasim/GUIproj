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
import jpaEntity.Product;

@WebServlet(name = "DeleteProduct", urlPatterns = {"/DeleteProduct"})
public class DeleteProduct extends HttpServlet {

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

            //Get product id to delete
            String prodId = request.getParameter("id");

            utx.begin();
            //em.getTransaction().begin();
            //Find the product using prodId
            Product product = em.find(Product.class, prodId);
            if (product != null) {
                em.remove(product);
                //em.getTransaction().commit();
                utx.commit();

                PrintWriter out = response.getWriter();
                out.println("<html><head><title>Alert</title></head><body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('Product deleted successfully');");
                out.println("</script>");
                out.println("</body></html>");

            } else {
                PrintWriter out = response.getWriter();
                out.println("<html><head><title>Alert</title></head><body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('No such product ID!');");
                out.println("</script>");
                out.println("</body></html>");
            }

            response.sendRedirect("products.jsp");
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
