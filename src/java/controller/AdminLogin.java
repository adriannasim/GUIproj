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

@WebServlet(name = "AdminLogin", urlPatterns = {"/AdminLogin"})
public class AdminLogin extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //Initializations
        EmployeeDAO empdao = new EmployeeDAO();
        ArrayList<Employee> empList = new ArrayList<Employee>();
        
        //Get user input username and password
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        
        if (!username.isEmpty() && !password.isEmpty())
        {
            //empList = empdao.getAllRecord();
            for (int i = 0; i < empList.size(); i++)
            {
//                if (empList.getUsername().equals(username) && empList.getPassword().equals(password))
//                {
//                    //Login successful
//                    request.getSession().setAttribute("username", username);
//                    response.sendRedirect("AdminPage.jsp");
//                }
//                else
//                {
//                    //Wrong password or username
//                    request.setAttribute("errMsg", "Invalid username or password.");
//                    request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
//                }
            }
            //No record found
            request.setAttribute("errMsg", "No record found");
            request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
        }
        else if (username.isEmpty())
        {
            //Prompt please enter username
            request.setAttribute("errMsg", "Please enter your username.");
            request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
        }
        else if (password.isEmpty())
        {
            //Prompt please enter password
            request.setAttribute("errMsg", "Please enter your password");
            request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
        }
        else
        {
            //Prompt please enter credentials
            request.setAttribute("errMsg", "Please enter your credentials.");
            request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
        }
        
        //empDAO.closeConnection();
    }
}
