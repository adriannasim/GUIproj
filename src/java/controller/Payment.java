package controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ProductDAO;

@WebServlet(name = "Payment", urlPatterns = {"/Payment"})
public class Payment extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //Initializations
        ProductDAO prodDAO = new ProductDAO(); //product model
        List<String> matches; //list of matches
                
        //Get search result
        String query = request.getParameter("query");
        
        //If query is not empty
        if (!query.isEmpty()) 
        {
            //Try to match the query to the product names in the db
            matches = prodDAO.matchProductByName(query.toLowerCase());
            System.out.print("Have search result");
            //Send the list to JS file (so that we can use AJAX to update the page dynamically instead of sending request to server every single time)
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(new Gson().toJson(matches));
            return;
        }
        //No result
        else
        {
            System.out.print("No search result");
        }
        prodDAO.closeConnection();
        //response.sendRedirect("Home.jsp");
    }
}