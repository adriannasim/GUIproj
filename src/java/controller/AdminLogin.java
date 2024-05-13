package controller;

import entity.Employee;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.EmployeeDAO;

@WebServlet(name = "AdminLogin", urlPatterns = {"/AdminLogin"})
public class AdminLogin extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //Initializations
        EmployeeDAO empdao = new EmployeeDAO();
        HttpSession session = request.getSession();
        boolean matched = false;
        
        //Get user input username and password
        String username = request.getParameter("signin-username").trim();
        String password = request.getParameter("signin-password").trim();
        
        try
        {
            Employee empUsername = empdao.getRecordByUsername(username);
            
            if (empUsername != null)
            {
                matched = Password.checkPassword(password, empUsername.getUserPwd());
                if (matched)
                {
                    session.setAttribute("username", empUsername.getUsername());
                    session.setAttribute("role", empUsername.getEmpRole());
                    response.sendRedirect("admin-dashboard.jsp");
                }
            }
            else
            {
                session.setAttribute("signin-failure-message", "Invalid credentials.");
                response.sendRedirect("sign-in.jsp");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        } 
        finally
        {
             empdao.closeConnection();
        }
    }
}
