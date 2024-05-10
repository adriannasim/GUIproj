package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

@WebServlet(name = "Logout", urlPatterns = {"/Logout"})
public class Logout extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); 
        if (session != null) 
        {
            session.invalidate(); // destroy the sesion object
            request.setAttribute("errorMS", "Logged out successfully"); 
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("SignIn.jsp"); 
            requestDispatcher.forward(request, response);
        }
    }
}
