package controller;

import entity.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminLogin", urlPatterns = {"/AdminLogin"})
public class AdminLogin extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //Initializations
        //EmpDAO empdao = new EmpDAO();
        
        //Get user input username and password
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        
        if (!username.isEmpty() && !password.isEmpty())
        {
            try
            {
                
            } 
            catch (Exception e)
            {
                
            }
        }
        
        //empDAO.closeConnection();
        response.sendRedirect("AdminLogin.jsp");
    }
}
