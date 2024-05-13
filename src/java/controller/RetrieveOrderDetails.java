package controller;

import java.io.IOException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jpaEntity.Custorder;
import jpaEntity.Orderitem;
import jpaEntity.Paymentinfo;
import java.util.List; 
import javax.annotation.Resource;
import javax.transaction.UserTransaction;


@WebServlet(name = "RetrieveOrderDetails", urlPatterns = {"/RetrieveOrderDetails"})
public class RetrieveOrderDetails extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;
    
    @Resource
    private UserTransaction utx;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("orderId");
        try {
            utx.begin();
            // Get order from custorder table
            TypedQuery<Custorder> querystr = em.createQuery("SELECT c FROM Custorder c WHERE c.orderid = :id", Custorder.class);
            querystr.setParameter("id", id);
            Custorder order = querystr.getSingleResult();
            System.out.println("Enter 1");

            utx.commit();
            
            try {
                utx.begin();
                // Get paymentInfo from paymentinfo table
                TypedQuery<Paymentinfo> querystr2 = em.createQuery("SELECT p FROM Paymentinfo p WHERE p.orderid = :id", Paymentinfo.class);
                querystr2.setParameter("id", id);
                Paymentinfo paymentinfo = querystr2.getSingleResult();
                order.setPaymentinfo(paymentinfo);
                System.out.println("Enter 2");

                utx.commit();
                try {  // Get order items
                    utx.begin();
                    TypedQuery<Orderitem> querystr3 = em.createQuery("SELECT o FROM Orderitem o WHERE o.orderitemPK.orderid = :id", Orderitem.class);
                    querystr3.setParameter("id", id);
                    List<Orderitem> orderItems = querystr3.getResultList();
                    order.setOrderitems(orderItems);

                    request.setAttribute("order", order);
                    System.out.println("Enter 3");

                    utx.commit();
                    // Send response to JSP
                    request.getRequestDispatcher("view-orders.jsp").forward(request, response);
                } catch (Exception e) {
                    System.out.println("Error in RetrieveOrderDetails servlet: " + e.getMessage());
                    request.setAttribute("errorMessage", "Error retrieving order details.");
                    request.getRequestDispatcher("error-page.jsp").forward(request, response);
                }
            } catch (Exception e) {
                System.out.println("Error in RetrieveOrderDetails servlet: " + e.getMessage());
                request.setAttribute("errorMessage", "Error retrieving order details.");
                request.getRequestDispatcher("error-page.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("Error in RetrieveOrderDetails servlet: " + e.getMessage());
            request.setAttribute("errorMessage", "Error retrieving order details.");
            request.getRequestDispatcher("error-page.jsp").forward(request, response);
        }

    }
}
