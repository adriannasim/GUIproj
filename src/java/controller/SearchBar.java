package controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import jpaEntity.Product;

@WebServlet(name = "SearchBar", urlPatterns = {"/SearchBar"})
public class SearchBar extends HttpServlet
{
    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        try
        {
            TypedQuery<Product> query = em.createQuery("SELECT prod FROM Product prod", Product.class);
            List<Product> results = query.getResultList();
            
            //Convert data to JSON or another suitable format
            Gson gson = new Gson();
            String jsonData = gson.toJson(results);
            
            //Send the list to JS file
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonData);
        }
        catch (Exception e)
        {
             System.out.print("SearchBar.java Error:" + e);
        }
    }
}


