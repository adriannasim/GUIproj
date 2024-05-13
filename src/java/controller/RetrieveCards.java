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

@WebServlet(name = "RetrieveCards", urlPatterns = {"/RetrieveCards"})
public class RetrieveCards extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
        RequestDispatcher dispatcher = request.getRequestDispatcher("CardPayment.jsp");
        dispatcher.forward(request, response);
    }

}
