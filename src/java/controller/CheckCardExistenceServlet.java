package controller;

import java.io.IOException;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import jpaEntity.*;
import javax.persistence.TypedQuery;


@WebServlet(name = "CheckCardExistence", urlPatterns = {"/CheckCardExistence"})

public class CheckCardExistenceServlet extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cardName = request.getParameter("cardName");
        String cardNumber = request.getParameter("cardNumber");

        // Query the database to check if a record exists with the provided card name and number
        TypedQuery<Paymentcard> query = em.createNamedQuery("Paymentcard.findByCardnameAndCardnumber", Paymentcard.class);
        query.setParameter("cardname", cardName);
        query.setParameter("cardnumber", cardNumber);

        boolean exists = !query.getResultList().isEmpty();

        response.setContentType("text/plain");
        
        // Send response
        if (exists) {
            response.getWriter().write("exists");
        } else {
            response.getWriter().write(""); 
        }
        //em.close();
    }
}
