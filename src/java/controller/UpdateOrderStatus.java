package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import jpaEntity.Custorder;
import java.util.Date;

/**
 *
 * @author User
 */
@WebServlet(urlPatterns = {"/UpdateOrderStatus"})
public class UpdateOrderStatus extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String orderId = request.getParameter("orderId");
        String newStatus = request.getParameter("newStatus");

        // Update the order status and date in the database
        boolean success = updateOrderStatusAndDate(orderId, newStatus);

        if (success){
            response.sendRedirect("view-order.jsp?orderId=" + orderId);
        }
        
    }

    private boolean updateOrderStatusAndDate(String orderId, String newStatus) {
        // Update profile
        try {
            utx.begin();

            TypedQuery<Custorder> query = em.createNamedQuery("Custorder.findByOrderid", Custorder.class);
            query.setParameter("orderid", orderId);

            Custorder order = query.getSingleResult();
           
            // Update the order details
            order.setStatus(newStatus);

            if (newStatus.equals("Shipping")) {
                if (order.getShipping() == null) {
                    order.setShipping(new Date());
                } else {
                }
            } else if (newStatus.equals("Delivery")) {
                if (order.getDelivery() == null) {
                    order.setDelivery(new Date());
                } else {
                }
            } else {
            }

            // Merge the updated customer object back into the database
            em.merge(order);

            utx.commit();
            
            return true;

        } catch (Exception ex) {
            try {
                if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                    utx.rollback();
                }
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            ex.printStackTrace();
            return false;
        }
    }
}
