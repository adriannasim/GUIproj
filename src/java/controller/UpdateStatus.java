package controller;

import java.io.IOException;
import java.util.Date;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jpaEntity.Custorder;

@WebServlet(name = "UpdateStatus", urlPatterns = {"/UpdateStatus"})
public class UpdateStatus extends HttpServlet {

    @PersistenceContext
    private EntityManager em;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        try
        {
            //Get product id to update status
            String id = request.getParameter("id");

            //Find the order using id
            Custorder order = em.find(Custorder.class, id);
            if (order == null) {
                response.getWriter().write("ERROR: Order not found!");
                return;
            }

            String currentStatus = order.getStatus();

            switch (currentStatus)
            {
                case "Packaging":
                    order.setStatus("Shipping");
                    order.setShipping(new Date());
                    response.getWriter().write("Status successfully updated to 'Shipping'");
                    break;

                case "Shipping":
                    order.setStatus("Delivery");
                    order.setDelivery(new Date());
                    response.getWriter().write("Status successfully updated to 'Delivery'");
                    break;

                case "Delivery":
                    response.getWriter().write("Status is already at 'Delivery'!");
                    break;

                default:
                    response.getWriter().write("ERROR: Invalid order status!");
            }
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
    }
}
