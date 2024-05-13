package controller;

import jpaEntity.Customer;
import java.io.*;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.transaction.UserTransaction;

@WebServlet(name = "AddCustomers", urlPatterns = {"/AddCustomers"})
public class AddCustomers extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //Initializations
            //EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
            //EntityManager em = emf.createEntityManager();
            Customer jpacust = new Customer();
            entity.Customer cust = new entity.Customer();

            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String firstname = request.getParameter("firstName");
            String lastname = request.getParameter("lastName");
            String contact = request.getParameter("contact");

            String dobString = request.getParameter("birth");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date dob = null;
            try {
                dob = dateFormat.parse(dobString);
            } catch (Exception e) {
                System.out.println(e);
            }

            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String postalcode = request.getParameter("postalCode");
            String country = request.getParameter("country");

            //Keywords
//        String[] keywords = request.getParameterValues("prodkeyword");
//        String keys = prod.concatKeywords(keywords);
            //Product image
            //Get all files
//        Collection<Part> imgs = request.getParts();
//        //Directory to store the image files
//        String imgDir = getServletContext().getRealPath("/img/prodImg");
//        //Array of file urls
//        String[] imgUrls = null;
//        for (Part img : imgs) 
//        {
//            //Check if the file is an image
//            if (img.getContentType() != null && img.getContentType().startsWith("image")) 
//            {
//                //Set filename
//                String filename = id + "-" + new Date() + "-(" + imgCount + ").jpeg";
//                //Store image directly to server image directory
//                img.write(imgDir + File.separator + filename);
//                //Set file url
//                imgUrls[imgCount] = imgDir + "/" + filename;
//                
//                //Convert image to bytes to store in db
////                InputStream imageInputStream = img.getInputStream();
////        
////                //Change input stream to output stream
////                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
////                byte[] buffer = new byte[4096];
////                int bytesRead;
////                while ((bytesRead = imageInputStream.read(buffer)) != -1) {
////                    outputStream.write(buffer, 0, bytesRead);
////                }
////                byte[] imgbytes = outputStream.toByteArray();
//                
//                //Add imgcount
//                imgCount++;
//            }
//        }
//        String url = prod.concatImg(imgUrls);
            //Setting varibles into product entity
            jpacust.setFirstname(firstname);
            jpacust.setLastname(lastname);
            jpacust.setContactno(contact);
            jpacust.setDateofbirth(dob);
            jpacust.setGender(gender);
            jpacust.setAddress(address);
            jpacust.setCity(city);
            jpacust.setState(state);
            jpacust.setPostalcode(postalcode);
            jpacust.setCountry(country);

            utx.begin();
            //Insert into db using JPA
//            em.getTransaction().begin();
            em.persist(jpacust);
//            em.getTransaction().commit();
            utx.commit();

//            em.close();
//            emf.close();
            response.sendRedirect("staff.jsp");
        } catch (Exception ex) {
            // Rollback transaction if an exception occurs
            try {
                if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                    utx.rollback();
                }
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            ex.printStackTrace();
        }
    }
}
