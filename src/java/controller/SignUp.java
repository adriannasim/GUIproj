package controller;

import entity.*;
import model.*;
import javax.servlet.annotation.MultipartConfig;
import java.io.IOException;
import java.sql.SQLException;
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

@MultipartConfig(location = "/tmp", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)

@WebServlet(name = "signup", urlPatterns = {"/signup"})
public class SignUp extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Create a session
        HttpSession session = request.getSession();

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

        // Construct Address object
        String addressLine;
        if (!address2.isEmpty()) {
            addressLine = address + ", " + address2;
        } else {
            addressLine = address;
        }
        Address add = new Address(addressLine, city, state, postalCode, country);

        // Contrsuct Date object
        Date date = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            date = sdf.parse(dateOfBirth);
        } catch (ParseException ex) {
            ex.printStackTrace();
        }

        // Hashing the password before storing into DB
        String hashPassword = Password.hashPassword(userPwd);

        // Insert Customer Record into DB
        CustomerDAO custDAO = new CustomerDAO();
        custDAO.insertRecord(username, hashPassword, email, firstname, lastname, contactNo, date, gender, add);

        // Retrieve cartId from session
        String cartId = (String) session.getAttribute("cartId");
        CartDAO cartDAO = new CartDAO();
        Cart localCart = cartDAO.getCartInfo(cartId);

        // Check if the localCart (from cookie) has been assigned to a user
        if (localCart.getUsername() == null) {
            cartDAO.assignCartToUser(cartId, username); // If not then assign to the user
        } else {
            Cart newCart = new Cart();
            cartDAO.createCartWithUserId(newCart.getCartId(), username); // If yes then create a new one for the user
        }

        // Delete the cookie from local device
        Cookie cartIdToRemove = new Cookie("cart_id", "");
        cartIdToRemove.setMaxAge(0);
        response.addCookie(cartIdToRemove);

        // Set the signup success message to the user
        String message = "Your account has registered successfully.";
        session.setAttribute("signup-message", message);

        response.sendRedirect("SignIn.jsp");
    }
}
