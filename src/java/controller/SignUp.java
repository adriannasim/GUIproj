package controller;

import entity.*;
import model.*;
import controller.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.ByteArrayOutputStream;
//import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.annotation.MultipartConfig;
import javax.transaction.UserTransaction;
import org.jboss.logging.Logger;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.ParseException;
import javax.servlet.http.HttpSession;

@MultipartConfig(location = "/tmp", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)

@WebServlet(name = "signup", urlPatterns = {"/signup"})
public class SignUp extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        // Record the parameter values
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

        try {
            // Construct Address object
            String addressLine;
            if (!address2.isEmpty()) {
                addressLine = address + ", " + address2;
            } else {
                addressLine = address;
            }
            Address add = new Address(addressLine, city, state, postalCode, country);
            
            // Contrsuct Date object
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = null;
            date = sdf.parse(dateOfBirth);
            
            // Hashing the password before storing into DB
            String hashPassword = Password.hashPassword(userPwd);
            
            // Insert Customer Record into DB
            CustomerDAO custDAO = new CustomerDAO();
            custDAO.insertRecord(username, hashPassword, email, firstname, lastname, contactNo, date, gender, add);
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (Exception e){
            e.printStackTrace();
        }
        
        // Set the success message to the user
        String message = "Your account has registered successfully.";
        session.setAttribute("signup-message", message);
        
        response.sendRedirect("SignIn.jsp");
    }
}
