package controller;

import entity.*;
import model.*;
import javax.servlet.annotation.MultipartConfig;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.ParseException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;


@MultipartConfig(location = "/tmp", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024
        * 5, maxRequestSize = 1024 * 1024 * 5 * 5)

@WebServlet(name = "signup", urlPatterns = { "/signup" })
public class SignUp extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Record the parameter values passed from the signup form
        String username = request.getParameter("signup-username");
        String userPwd = request.getParameter("signup-userPwd");
        String email = request.getParameter("signup-email");
        String firstname = request.getParameter("signup-firstname");
        String lastname = request.getParameter("signup-lastname");
        String contactNo = request.getParameter("signup-contactNo");
        String dateOfBirth = request.getParameter("signup-dateOfBirth");
        String gender = request.getParameter("signup-gender");
        String address = request.getParameter("ship-address");
        String address2 = request.getParameter("address2");
        String city = request.getParameter("locality");
        String state = request.getParameter("state");
        String postalCode = request.getParameter("postcode");
        String country = request.getParameter("country");

        // Set attributes to retain user-entered information
        request.setAttribute("signup-username", username);
        request.setAttribute("signup-userPwd", userPwd);
        request.setAttribute("signup-email", email);
        request.setAttribute("signup-firstname", firstname);
        request.setAttribute("signup-lastname", lastname);
        request.setAttribute("signup-contactNo", contactNo);
        request.setAttribute("signup-dateOfBirth", dateOfBirth);
        request.setAttribute("signup-gender", gender);
        request.setAttribute("ship-address", address);
        request.setAttribute("address2", address2);
        request.setAttribute("locality", city);
        request.setAttribute("state", state);
        request.setAttribute("postcode", postalCode);
        request.setAttribute("country", country);

        // Forward the request to the sign-up confirmation page
        RequestDispatcher dispatcher = request.getRequestDispatcher("SignUpConfirmation.jsp");
        dispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the confirmation parameter from the request
        String confirmed = request.getParameter("confirmed");

        // If the user confirmed the sign-up
        if ("true".equals(confirmed)) {
            // Process the sign-up and database insertion
            // Retrieve the user-entered information from request attributes
            String username = request.getParameter("signup-username");
            String userPwd = request.getParameter("signup-userPwd").trim();
            String email = request.getParameter("signup-email");
            String firstname = request.getParameter("signup-firstname");
            String lastname = request.getParameter("signup-lastname");
            String contactNo = request.getParameter("signup-contactNo");
            String dateOfBirth = request.getParameter("signup-dateOfBirth");
            String gender = request.getParameter("signup-gender");
            String address = request.getParameter("ship-address");
            String address2 = request.getParameter("address2");
            String city = request.getParameter("locality");
            String state = request.getParameter("state");
            String postalCode = request.getParameter("postcode");
            String country = request.getParameter("country");

            // Construct Address object
            String addressLine;
            if (address2 != null && !address2.isEmpty()) {
                addressLine = address + ", " + address2;
            } else {
                addressLine = address;
            }
            Address add = new Address(addressLine, city, state, postalCode, country);

            // Contrsuct Date object
            // Define the date format expected from the input string
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date dob = null;
            try {
                if (dateOfBirth != null) {
                    dob = dateFormat.parse(dateOfBirth);
                } else {
                    // Handle the case where dateOfBirth is null
                }
            } catch (ParseException e) {
                e.printStackTrace();
                // Handle parse exception
            }

            // Hashing the password before storing into DB
            String hashPassword = Password.hashPassword(userPwd);

            // Insert Customer Record into DB
            CustomerDAO custDAO = new CustomerDAO();
            custDAO.insertRecord(username, hashPassword, email, firstname, lastname, contactNo, dob, gender,
                    add);

            // Retrieve cartId from session
            HttpSession session = request.getSession();
            String cartId = (String) session.getAttribute("cartId");
            CartDAO cartDAO = new CartDAO();
            Cart localCart = cartDAO.getCartInfo(cartId);

            // Check if localCart is not null before accessing its properties
            if (localCart != null) {
                // Check if the localCart (from cookie) has been assigned to a user
                if (localCart.getUsername() == null) {
                    cartDAO.assignCartToUser(cartId, username); // If not then assign to the user
                } else {
                    Cart newCart = new Cart();
                    cartDAO.createCartWithUserId(newCart.getCartId(), username); // If yes then create a new one for
                    // the user
                }
            }

            // Delete the cookie from local device
            Cookie cartIdToRemove = new Cookie("cart_id", "");
            cartIdToRemove.setMaxAge(0);
            response.addCookie(cartIdToRemove);

            // Set the signup success message to the user
            String message = "Your account has registered successfully.";
            session.setAttribute("signup-message", message);

            // Set attribute to indicate successful sign-up
            request.getSession().setAttribute("signup-success", true);
                    
            custDAO.closeConnection();

            response.sendRedirect("SignIn.jsp");
        } else {
            // If the user didn't confirm, redirect back to the sign-up page for editing
            response.sendRedirect("SignUp.jsp");
        }
    }

}
