package controller;

import java.io.IOException;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import jpaEntity.*;
import java.util.List;
import java.util.ArrayList;


@WebServlet(name = "EditPaymentCard", urlPatterns = {"/EditPaymentCard"})
public class EditPaymentCard extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initializations
        HttpSession session = request.getSession();

        // Retrieve username from session
        String username = (String) session.getAttribute("username");

        // Retrieve customer's cards
        try {
            TypedQuery<Paymentcard> query = em.createNamedQuery("Paymentcard.findByUsername", Paymentcard.class);
            query.setParameter("username", username);

            List<Paymentcard> paymentCardList = query.getResultList();
            ArrayList<Paymentcard> paymentCardArrayList = new ArrayList<>(paymentCardList);

            // Set request attributes
            request.setAttribute("paymentCardList", paymentCardArrayList);

        } catch (Exception ex) {
            try {
                if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                    utx.rollback();
                }
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            ex.printStackTrace();
            response.sendRedirect("404Error.jsp"); // Redirect to error page
        }

        // Forward the request to the JSP with request parameters
        RequestDispatcher dispatcher = request.getRequestDispatcher("CustPaymentCard.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initializations
        HttpSession session = request.getSession();

        // Get the card details from user
        String username = (String) session.getAttribute("username");
        String cardName = request.getParameter("payment-card-name");
        String cardNumber = request.getParameter("payment-card-number");
        String cardExp = request.getParameter("payment-card-expiration");
        String cardCvv = request.getParameter("payment-card-cvv");

        // Insert into paymentcard DB
        Paymentcard paymentcard = new Paymentcard();
        PaymentcardPK paymentcardPK = new PaymentcardPK();
        paymentcardPK.setCardname(cardName);
        paymentcardPK.setCardnumber(cardNumber);
        paymentcard.setPaymentcardPK(paymentcardPK);

        String[] expParts = null;
        int month = 0;
        int year = 0;
        if (cardExp != null && cardExp.contains("/")) {
            expParts = splitExp(cardExp);
        }

        if (expParts != null && expParts.length >= 2) {
            month = Integer.parseInt(expParts[0]);
            year = Integer.parseInt(expParts[1]);
        }

        paymentcard.setDatemonth(month);
        paymentcard.setDateyear(year);
        paymentcard.setCvv(cardCvv);
        paymentcard.setUsername(username);

        // Add card
        try {
            utx.begin();
            em.persist(paymentcard);
            utx.commit();

            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse resp = (HttpServletResponse) response;
            doGet(req, resp);
            
            em.close();
            
        } catch (Exception ex) {
            try {
                if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                    utx.rollback();
                }
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            ex.printStackTrace();
            response.sendRedirect("404Error.jsp"); // Redirect to error page
        }
    }

    public static String[] splitExp(String expirationDate) {
        return expirationDate.split("/");
    }
}
