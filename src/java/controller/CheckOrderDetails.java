package controller;

import java.io.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.persistence.*;
import jpaEntity.Custorder;

@WebServlet(name = "CheckOrderDetails", urlPatterns = {"/CheckOrderDetails"})
public class CheckOrderDetails extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //Initializations
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        EntityManager em = emf.createEntityManager();
        String id = request.getParameter("id");
        
        //Get all orders from custorder table
        TypedQuery<Custorder> querystr = em.createQuery("SELECT order FROM Custorder order WHERE order.orderid = :id", Custorder.class);
        querystr.setParameter("id", id);
        Custorder order = querystr.getSingleResult();
        
        //More than 2 lines of address
        if (order.getAddress().contains(";"))
        {
            String [] addresses = order.getAddress().split(";");
            request.setAttribute("addresses", addresses);
        }
             
        request.setAttribute("order", order);
        
        em.close();
        emf.close();

        //Send response to jsp
        response.sendRedirect("CheckOrderDetails.jsp");
    }
}