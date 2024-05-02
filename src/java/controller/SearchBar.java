package controller;

import model.ProductDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SearchBar", urlPatterns = {"/SearchBar"})
public class SearchBar extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        System.out.print("SERVLET INVOKED");
        //Initializations
        ProductDAO prodDAO = new ProductDAO(); //product model
        List<String> matches = null; //list of matches
        HttpSession session = request.getSession();
                
        //Get search result
        String query = request.getParameter("query");
        
        //If query is not empty
        if (query != null) 
        {
            //Try to match the query to the product names in the db
            matches = prodDAO.matchProductByName(query.toLowerCase());
            System.out.print("Got search result");
            //Send the list to the user session
            session.setAttribute("matches", matches);
        }
        else
        {
            matches = null;
            System.out.print("No search result");
            session.removeAttribute("matches");
        }
        System.out.println(request.getContextPath());
        prodDAO.closeConnection();
        response.sendRedirect("components/header.jsp");
    }
}
