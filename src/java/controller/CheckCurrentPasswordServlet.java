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
import jpaEntity.*;

@WebServlet(name = "CheckCurrentPasswordS", urlPatterns = {"/CheckCurrentPassword"})
public class CheckCurrentPasswordServlet extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initialization
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        // Get the password parameter from the request
        String password = request.getParameter("password");

        // Checking
        boolean passMatched = checkPasswordMatch(username, password);

        // Send response back to the client
        response.setContentType("text/plain");
        if (passMatched) {
            response.getWriter().write("matched");
        } else {
            response.getWriter().write("not matched");
        }
    }

    private boolean checkPasswordMatch(String username, String password) {
        try {
            TypedQuery<Customer> query = em.createNamedQuery("Customer.findByUsername", Customer.class);
            query.setParameter("username", username);

            Customer customer = query.getSingleResult();
            String storedPassword = customer.getUserpwd();
            //em.close();

            return Password.checkPassword(password, storedPassword);
        } catch (Exception ex) {
            ex.printStackTrace();
           //em.close();
            return false;
        }
    }
}
