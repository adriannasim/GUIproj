
package controller;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import java.io.IOException;
import jpaEntity.Product;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Predicate;
import java.util.List;


@WebServlet(name = "SearchingFunction", urlPatterns = {"/SearchingFunction"})
public class SearchingFunction extends HttpServlet {

    @Resource
    private UserTransaction utx; // Inject UserTransaction for managing transactions

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve search query and field to search
        String query = request.getParameter("query");
        String field = request.getParameter("field");
        String table = request.getParameter("table");
        

        try {
            // Begin transaction
            utx.begin();

            // Create EntityManager
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
            EntityManager em = emf.createEntityManager();

            // Construct dynamic query
            CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
            CriteriaQuery<Product> criteriaQuery = criteriaBuilder.createQuery(Product.class);
            Root<Product> root = criteriaQuery.from(Product.class);
            criteriaQuery.select(root);

            // Add dynamic WHERE clause based on the selected field and search query
            Predicate predicate = criteriaBuilder.like(criteriaBuilder.lower(root.get(field)), "%" + query.toLowerCase() + "%");
            criteriaQuery.where(predicate);

            // Execute the query
            List<Product> searchResults = em.createQuery(criteriaQuery).getResultList();

            // Commit transaction
            utx.commit();

            // Pass search results to the JSP page for rendering
            request.setAttribute("searchResults", searchResults);
            request.getRequestDispatcher("searchResults.jsp").forward(request, response);

            // Close EntityManager
            em.close();
            emf.close();
        } catch (Exception ex) {
            try {
                // Rollback transaction in case of any exception
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
}
