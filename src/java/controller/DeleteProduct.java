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
import jpaEntity.Product;

@WebServlet(name = "DeleteProduct", urlPatterns = {"/DeleteProduct"})
public class DeleteProduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Initializations
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        EntityManager em = emf.createEntityManager();

        //Get product id to delete
        String prodId = request.getParameter("id");

        em.getTransaction().begin();
        //Find the product using prodId
        Product product = em.find(Product.class, prodId);
        if (product != null) {
            em.remove(product);
            em.getTransaction().commit();

            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Alert</title></head><body>");
            out.println("<script type='text/javascript'>");
            out.println("alert('Staff deleted successfully');");
            out.println("</script>");
            out.println("</body></html>");
            
        } else {
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
