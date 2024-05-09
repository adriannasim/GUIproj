package controller;

import java.io.IOException;
import java.util.*;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jpaEntity.Product;

@WebServlet(name = "EditStock", urlPatterns = {"/EditStock"})
public class EditStock extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //Initializations
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        EntityManager em = emf.createEntityManager();

        //Get product id to delete
        String id = request.getParameter("prodId");
        int qty = Integer.parseInt(request.getParameter("qty"));
        
        em.getTransaction().begin();
        //Find the product using prodId
        Product prod = em.find(Product.class, id);
        if (prod != null)
        {
            prod.setQtyavailable(qty);
            em.getTransaction().commit();
            response.getWriter().write("Stock Updated.");
        }
        else
        {
            response.getWriter().write("Product not found.");
        }
        
        em.close();
        emf.close();
    }
}
