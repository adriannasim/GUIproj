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

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); //getting to session object
        if (session != null) // check if condition the session not null
        {
            session.invalidate(); //using this method to destroy the sesion object
            request.setAttribute("errorMS", "Logged out successfully"); //send "errorMSG" object on client side. And get using request.getAttribute() method
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("SignIn.jsp"); // using RequestDispatcher method forward to login page.
            requestDispatcher.forward(request, response);
        }
    }
}
