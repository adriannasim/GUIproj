package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import model.CustomerDAO;
import entity.Customer;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "CheckDuplicateUsername", urlPatterns = {"/CheckDuplicateUsername"})
public class CheckDuplicateUsernameServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the username parameter from the request
        String username = request.getParameter("username");

        // Perform your database query to check for duplicate username
        // Replace this with your actual database logic
        boolean usernameExists = checkUsernameExistsInDatabase(username);

        // Send response back to the client
        response.setContentType("text/plain");
        if (usernameExists) {
            response.getWriter().write("duplicate");
        } else {
            response.getWriter().write("available");
        }
    }

    // Dummy method to simulate database check
    private boolean checkUsernameExistsInDatabase(String username) {
        // Implement your actual database logic here
        // This is just a placeholder
        CustomerDAO custDAO = new CustomerDAO();
        Customer cust = custDAO.getRecordByUsername(username);
        if (cust != null){
            return true;
        }
        return false;
    }
}
