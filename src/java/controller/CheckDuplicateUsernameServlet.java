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

        // Checking
        boolean usernameExists = checkUsernameExistsInDatabase(username);

        // Send response back to the client
        response.setContentType("text/plain");
        if (usernameExists) {
            response.getWriter().write("duplicate");
        } else {
            response.getWriter().write("available");
        }
    }

    private boolean checkUsernameExistsInDatabase(String username) {
        CustomerDAO custDAO = new CustomerDAO();
        Customer cust = custDAO.getRecordByUsername(username);
        if (cust != null){
            custDAO.closeConnection();
            return true;
        }
        custDAO.closeConnection();
        return false;
    }
}
