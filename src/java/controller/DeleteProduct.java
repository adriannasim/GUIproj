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
import jpaEntity.Product;

@WebServlet(name = "DeleteProduct", urlPatterns = {"/DeleteProduct"})
public class DeleteProduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {

        //Initializations
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        EntityManager em = emf.createEntityManager();

        //Get product id to delete
        String prodId = request.getParameter("prodId");
        
        em.getTransaction().begin();
        //Find the product using prodId
        Product product = em.find(Product.class, prodId);
        if (product != null)
        {
            em.remove(product);
            em.getTransaction().commit();
            response.getWriter().write("Product deleted successfully");
        } 
        else
        {
            response.getWriter().write("Product not found");
        }

        em.close();
        emf.close();
    }
}
