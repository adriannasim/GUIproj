package controller;

import com.google.gson.Gson;
import java.io.*;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.persistence.*;
import javax.transaction.UserTransaction;

@WebServlet(name = "EditProducts", urlPatterns = {"/EditProducts"})
public class EditProducts extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Initializations
        String id = request.getParameter("id");

        try {
            utx.begin();
            System.out.println("id is : " + id);
            //EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
            //EntityManager em = emf.createEntityManager();
            jpaEntity.Product jpaprod = em.find(jpaEntity.Product.class, id);
            entity.Product prod = new entity.Product();
            int finalNo = 0;

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
            //Get the JSON array of urls that needs to be deleted
//        String json = request.getParameter("dltedImgUrls");
//        Gson gson = new Gson();
//        String[] dltedImgUrls = gson.fromJson(json, String[].class);
//
//        //Directory that stores the image files
//        String imgDir = getServletContext().getRealPath("/img/prodImg");
//
//        //If there's existing imgs that is gonna be dlted
//        if (dltedImgUrls != null) {
//            //Create a directory object
//            File directory = new File(imgDir);
//            //Get all the files' name inside
//            String[] imgs = directory.list();
//
//            //Go through the soon to be dlted imgs
//            for (int i = 0; i < dltedImgUrls.length; i++) {
//                //Go through the current files in the webserver
//                for (int j = 0; j < imgs.length; j++) {
//                    if (imgs[j].contains(id)) {
//                        if (dltedImgUrls[i].equals(imgs[j])) {
//                            File fileToDelete = new File(imgDir, imgs[j]);
//                            fileToDelete.delete();
//                        }
//                        //Get the final no of imgs associated with the product
//                        finalNo++;
//                    }
//                }
//            }
//        }
//
//        int imgCount = 0;
//        //Get all files
//        Collection<Part> addImgs = request.getParts();
//        //Array of file urls
//        String[] imgUrls = null;
//        for (Part img : addImgs) {
//            //Check if the file is an image
//            if (img.getContentType() != null && img.getContentType().startsWith("image")) {
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
            //jpaprod.setProdaddeddate(date);

            //Update into db using JPA
            //em.getTransaction().begin();
            em.merge(jpaprod);
            //em.getTransaction().commit();

            utx.commit();
            //em.close();
            //emf.close();

            response.sendRedirect("products.jsp");
        } catch (Exception ex) {
            try {
                if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                    utx.rollback();
                }
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            ex.printStackTrace();
            response.sendRedirect("404Error.jsp"); // Redirect to error page
        }

    }
}
