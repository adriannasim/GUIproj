package controller;

import java.io.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.persistence.*;
import jpaEntity.Custorder;

@WebServlet(name = "CheckOrders", urlPatterns = {"/CheckOrders"})
public class CheckOrders extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //Initializations
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        EntityManager em = emf.createEntityManager();
        List<Custorder> packaging = null;
        List<Custorder> shipping = null;
        List<Custorder> delivery = null;
        
        //Get all orders from custorder table
        TypedQuery<Custorder> querystr = em.createQuery("SELECT order FROM Custorder order", Custorder.class);
        List<Custorder> orderList = querystr.getResultList();
            
        for (int i = 0; i < orderList.size(); i++)
        {
            switch (orderList.get(i).getStatus())
            {
            //If status is "Packaging"
                case "Packaging":
                    packaging.add(orderList.get(i));
                    break;
            //If status is "Shipping"
                case "Shipping":
                    shipping.add(orderList.get(i));
                    break;
            //If status is "Delivery"
                case "Delivery":
                    delivery.add(orderList.get(i));
                    break;
                default:
                    System.out.print("Order No."+ i + "have no status.");
                    break;
            }
        }
        request.setAttribute("all", orderList);
        request.setAttribute("packing", packaging);
        request.setAttribute("shipping", shipping);
        request.setAttribute("delivering", delivery);
       
        em.close();
        emf.close();

        //Send response to jsp
        response.sendRedirect("Admin.jsp");
    }
}