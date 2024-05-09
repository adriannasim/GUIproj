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
import jpaEntity.Custorder;

@WebServlet(name = "UpdateStatus", urlPatterns = {"/UpdateStatus"})
public class UpdateStatus extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //Initializations
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        EntityManager em = emf.createEntityManager();

        //Get product id to delete
        String id = request.getParameter("id");
        
        em.getTransaction().begin();
        //Find the product using prodId
        Custorder order = em.find(Custorder.class, id);
        String currentStatus = order.getStatus();
        
        switch (currentStatus)
        {
            case "Packaging":
                order.setStatus("Shipping");
                em.getTransaction().commit();
                response.getWriter().write("Status successfully updated to 'Shipping'");
                break;
                
            case "Shipping":
                order.setStatus("Delivery");
                em.getTransaction().commit();
                response.getWriter().write("Status successfully updated to 'Delivery'");
                break;
                
            case "Delivery":
                response.getWriter().write("Status is already at 'Delivery'!");
                break;
            
            default:
                response.getWriter().write("ERROR: Order not found!");
        }
        em.close();
        emf.close();
    }
}
