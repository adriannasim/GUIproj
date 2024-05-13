package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import model.EmployeeDAO;
import entity.Employee;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "CheckEmployeeEmail", urlPatterns = {"/CheckEmployeeEmail"})
public class CheckEmployeeEmail extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the email parameter from the request
        String email = request.getParameter("email");
        String currentEmail = request.getParameter("currentEmail");

        // Checking
        boolean emailExists = checkEmailExistsInDatabase(email, currentEmail);

        // Send response back to the client
        response.setContentType("text/plain");
        if (emailExists) {
            response.getWriter().write("duplicate");
        } else {
            response.getWriter().write("available");
        }
    }

    private boolean checkEmailExistsInDatabase(String email, String currentEmail) {
        EmployeeDAO empDAO = new EmployeeDAO();
        Employee emp = empDAO.getRecordByEmail(email);
        if (emp != null) {
            if (currentEmail != null) {
                if (email.equals(currentEmail)) {
                    empDAO.closeConnection();
                    return false;
                } else {
                    empDAO.closeConnection();
                    return true;
                }
            } else {
                empDAO.closeConnection();
                return true;
            }
        }
        empDAO.closeConnection();
        return false;
    }
}
