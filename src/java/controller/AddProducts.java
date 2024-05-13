package controller;

import jpaEntity.Product;
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
import model.EmployeeDAO;

@WebServlet(name = "AddProducts", urlPatterns = {"/AddProducts"})
public class AddProducts extends HttpServlet {

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
            Product jpaprod = new Product();
            entity.Product prod = new entity.Product();
            int imgCount = 0;

            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String desc = request.getParameter("description");
            String keywords = request.getParameter("keywords");
            double price = Double.parseDouble(request.getParameter("price"));
            int qty = Integer.parseInt(request.getParameter("stock"));

            String dateString = request.getParameter("date");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = null;
            try {
                // Parse the string into a Date object
                date = dateFormat.parse(dateString);
            } catch (Exception e) {
                e.printStackTrace();
            }

            String image = request.getParameter("imageInput");

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
            jpaprod.setProdid(id);
            jpaprod.setProdname(name);
            jpaprod.setProddesc(desc);
            jpaprod.setProdprice(new BigDecimal(price));
            jpaprod.setQtyavailable(qty);
            jpaprod.setProdimg(image);
            jpaprod.setProdkeywords(keywords);
            jpaprod.setProdaddeddate(new Date());
            jpaprod.setProdslug(prod.formatSlug(name));

            utx.begin();
            //Insert into db using JPA
            //em.getTransaction().begin();
            em.persist(jpaprod);
            //em.getTransaction().commit();
            utx.commit();

            //em.close();
            //emf.close();
            response.sendRedirect("products.jsp");

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
