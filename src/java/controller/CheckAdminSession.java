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
        //Check if user logged in through the login page to prevent unauthorized access through changing the url
        if (request.getSession().getAttribute("username") == null)
        {
            //Redirect to login page if not authenticated
            response.sendRedirect("AdminLogin.jsp");
        }
        
        //Check staff role to make sure they cannot access admin-only pages
        String pageUrl = request.getRequestURL().toString();
        if (pageUrl.startsWith("AddAccount") || pageUrl.startsWith("ManageAccounts") || pageUrl.startsWith("AddPayments") || pageUrl.startsWith("EditPayments"))
        {
            if (!request.getSession().getAttribute("role").equals("admin"))
            {
                //Redirect to login page if not authenticated
                response.sendRedirect("Admin.jsp");
            }
        }
    }
}
