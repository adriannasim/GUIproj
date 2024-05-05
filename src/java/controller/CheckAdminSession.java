package controller;

import entity.Employee;
import entity.User;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.EmployeeDAO;

@WebServlet(name = "CheckAdminSession", urlPatterns = {"/CheckAdminSession"})
public class CheckAdminSession extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //Check if user logged in through the login page to prevent unauthorized access through changing the url
        if (request.getSession().getAttribute("username") == null) {
        /// Redirect to login page if not authenticated
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
    }
}
