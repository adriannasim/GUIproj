package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CheckAdminSession", urlPatterns = {"/CheckAdminSession"})
public class CheckAdminSession extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String username = (String) request.getSession().getAttribute("username");
        String role = (String) request.getSession().getAttribute("role");
        
        //Check if user logged in through the login page to prevent unauthorized access through changing the url
        if (username == null)
        {
            //Redirect to login page if not authenticated
            response.sendRedirect("AdminLogin.jsp");
            return;
        }
        
        //Check staff role to make sure they cannot access admin-only pages
        String pageUrl = request.getRequestURI();
        if (pageUrl.contains("AddAccount") || pageUrl.contains("ManageAccounts") || pageUrl.contains("AddPayments") || pageUrl.contains("EditPayments"))
        {
            if (!role.equals("admin"))
            {
                //Redirect to login page if not authenticated
                response.sendRedirect("Admin.jsp");
            }
        }
    }
}
