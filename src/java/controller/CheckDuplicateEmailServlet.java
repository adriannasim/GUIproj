package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import model.CustomerDAO;
import entity.Customer;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "CheckDuplicateEmail", urlPatterns = {"/CheckDuplicateEmail"})
public class CheckDuplicateEmailServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the email parameter from the request
        String email = request.getParameter("email");

        // Checking
        boolean emailExists = checkEmailExistsInDatabase(email);

        // Send response back to the client
        response.setContentType("text/plain");
        if (emailExists) {
            response.getWriter().write("duplicate");
        } else {
            response.getWriter().write("available");
        }
    }

    private boolean checkEmailExistsInDatabase(String email) {
        CustomerDAO custDAO = new CustomerDAO();
        Customer cust = custDAO.getRecordByEmail(email);
        if (cust != null){
            return true;
        }
        return false;
    }
}
