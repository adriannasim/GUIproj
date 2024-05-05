package controller;

import entity.*;
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
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@MultipartConfig(location="/tmp", fileSizeThreshold=1024*1024, maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)

@WebServlet(name = "signup", urlPatterns = {"/signup"})
public class SignUp extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         String username = request.getParameter("username");
         String userPwd = request.getParameter("userPwd");
         String email = request.getParameter("email");
         String firstname = request.getParameter("firstname");
         String lastname = request.getParameter("lastname");
         String contactNo = request.getParameter("contactNo");
         String dateOfBirth = request.getParameter("dateOfBirth");
         String gender = request.getParameter("gender");
         String address = request.getParameter("ship-address");
         String address2 = request.getParameter("address2");
         String city = request.getParameter("locality");
         String state = request.getParameter("state");
         String postalCode = request.getParameter("postcode");
         String country = request.getParameter("country");
         
         
       
    }

   
}


