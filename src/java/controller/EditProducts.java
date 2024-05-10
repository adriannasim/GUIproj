//package controller;
//
//import java.io.*;
//import java.math.BigDecimal;
//import java.time.LocalDate;
//import java.util.ArrayList;
//import java.util.Collection;
//import java.util.Date;
//import java.util.List;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.*;
//import javax.servlet.http.*;
//import javax.persistence.*;
//
//@WebServlet(name = "EditProducts", urlPatterns = {"/EditProducts"})
//public class EditProducts extends HttpServlet
//{
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
//    {
//        //Initializations
//        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
//        EntityManager em = emf.createEntityManager();
//        jpaEntity.Product jpaprod = new jpaEntity.Product();
//        entity.Product prod = new entity.Product();
//        
//        String id = request.getParameter("prodid");
//        String name = request.getParameter("prodname");
//        String desc = request.getParameter("prodesc");
//        double price = Double.parseDouble(request.getParameter("prodprice"));
//        int qty = Integer.parseInt(request.getParameter("qtyavailable"));
//        
//        //Keywords
//        String[] keywords = request.getParameterValues("prodkeyword");
//        String keys = prod.concatKeywords(keywords);
//        
//        //Product image
//        //Get all files
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
//                String filename = id + "-" + imgCount + ".jpeg";
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
//        
//        //Setting varibles into product entity
//        jpaprod.setProdid(id);
//        jpaprod.setProdname(name);
//        jpaprod.setProddesc(desc);
//        jpaprod.setProdprice(new BigDecimal (price));
//        jpaprod.setQtyavailable(qty);
//        jpaprod.setProdimg(url);
//        jpaprod.setProdkeywords(keys);
//        jpaprod.setProdaddeddate(new Date());
//        jpaprod.setProdslug(prod.formatSlug(name));
//
//        //Insert into db using JPA
//        em.getTransaction().begin();
//        em.persist(jpaprod);
//        em.getTransaction().commit();
//
//        em.close();
//        emf.close();
//    }
//}
