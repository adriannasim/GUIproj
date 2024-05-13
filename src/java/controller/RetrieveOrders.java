/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import jpaEntity.Custorder;
import jpaEntity.Paymentinfo;

/**
 *
 * @author User
 */
@WebServlet(name = "RetrieveOrders", urlPatterns = {"/RetrieveOrders"})
public class RetrieveOrders extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
      
        HttpSession session = request.getSession();
        
        List<Custorder> packaging = new ArrayList<>();
        List<Custorder> shipping = new ArrayList<>();
        List<Custorder> delivery = new ArrayList<>();
        
        //Get all orders from custorder table
        try 
        {

            TypedQuery<Custorder> query = em.createQuery(
                        "SELECT o FROM Custorder o ORDER BY o.orderdate DESC",      
                        Custorder.class);

                List<Custorder> orderList = query.getResultList();

                // For each Custorder, retrieve associated Orderitems
                for (Custorder custorder : orderList) {
                    String orderId = custorder.getOrderid();

                    // Retrieve PaymentInfo for the current Custorder
                    TypedQuery<Paymentinfo> paymentinfoQuery = em.createQuery(
                            "SELECT p FROM Paymentinfo p WHERE p.orderid = :orderId",
                            Paymentinfo.class);
                            paymentinfoQuery.setParameter("orderId", orderId);
                    Paymentinfo paymentinfo = paymentinfoQuery.getSingleResult();

                    // Set the retrieved paymentinfo to the Custorder
                    custorder.setPaymentinfo(paymentinfo);
                }

                session.setAttribute("orderList", orderList);
                System.out.print("Retrieve dao le:");


            // for (int i = 0; i < orderList.size(); i++)
            // {
            //     switch (orderList.get(i).getStatus())
            //     {
            //     //If status is "Packaging"
            //         case "Packaging":
            //             packaging.add(orderList.get(i));
            //             break;
            //     //If status is "Shipping"
            //         case "Shipping":
            //             shipping.add(orderList.get(i));
            //             break;
            //     //If status is "Delivery"
            //         case "Delivery":
            //             delivery.add(orderList.get(i));
            //             break;
            //         default:
            //             System.out.print("Order No."+ i + "have no status.");
            //             break;
            //     }
            // }
            // request.setAttribute("all", orderList);
            // request.setAttribute("packing", packaging);
            // request.setAttribute("shipping", shipping);
            // request.setAttribute("delivering", delivery);
            // System.out.print("CheckOrders.java Success: GOT RESULT!!");
        }
        catch (Exception e)
        {
            System.out.print("retrieveorders.java Error:" + e);
        }
       
        
        //Send response to jsp
        response.sendRedirect("orders.jsp");
    }
}
