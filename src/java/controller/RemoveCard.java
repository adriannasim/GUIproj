package controller;

import java.io.IOException;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import jpaEntity.Paymentcard;



@WebServlet(name = "RemoveCard", urlPatterns = {"/RemoveCard"})
public class RemoveCard extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initializations
        HttpSession session = request.getSession();

        // Get the card details from user
        String cardName = request.getParameter("cardName");
        String cardNumber = request.getParameter("cardNumber");

        try {
            utx.begin();

            TypedQuery<Paymentcard> query = em.createNamedQuery("Paymentcard.findByCardnameAndCardnumber", Paymentcard.class);
            query.setParameter("cardname", cardName);
            query.setParameter("cardnumber", cardNumber);

            Paymentcard paymentcard = query.getSingleResult(); 
            
            // Delete the card from DB
            em.remove(paymentcard);
            utx.commit();

            response.sendRedirect("EditPaymentCard");

        } catch (Exception ex) {
            try {
                if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                    utx.rollback();
                }
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            ex.printStackTrace();
            response.sendRedirect("ErrorPage.jsp"); // Redirect to error page
        }
    }
}
