package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Payment", urlPatterns = {"/Payment"})
public class Payment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Initializations
        HttpSession session = request.getSession();

        // Check if user has logged in
        String username = (String) session.getAttribute("username");
        
        // If user has not logged in, then ask user to register an account
        if (username == null) {
           session.setAttribute("message", "Please sign up to continue.");
           response.sendRedirect("SignUp.jsp");
        } 
        // If user has logged in, then redirect user to Payment.jsp
        else {
            response.sendRedirect("Payment.jsp");
        }  
    }
}
