package controller;

import entity.Product;
import java.io.*;
import java.util.*;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.EmployeeDAO;

@WebServlet(name = "AddProducts", urlPatterns = {"/AddProducts"})
public class AddProducts extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //Initializations
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("productUnit");
        EntityManager em = emf.createEntityManager();
        Product prod = new Product();
        int imgCount = 0;
        
        String id = request.getParameter("prodid");
        String name = request.getParameter("prodname");
        String desc = request.getParameter("prodesc");
        double price = Double.parseDouble(request.getParameter("price"));
        int qty = Integer.parseInt(request.getParameter("qtyavailable"));
        
        //Keywords
        String[] keywords = request.getParameterValues("prodkeyword");
        String keywordsAttached = "";
        if (keywords != null)
        {
            for (int i = 0; i < keywords.length; i++)
            {
                if (i == keywords.length - 1)
                {
                    //Last keyword don't need the ;
                    keywordsAttached = keywordsAttached.concat(keywords[i]);
                }
                else
                {
                    keywordsAttached = keywordsAttached.concat(keywords[i] + ";");
                }
            }
        }
        
        //Product image
        //Get all files
        Collection<Part> imgs = request.getParts();
        //Directory to store the image files
        String imgDir = getServletContext().getRealPath("/img/prodImg");
        //Array of file urls
        String[] imgUrls = null;
        for (Part img : imgs) 
        {
            //Check if the file is an image
            if (img.getContentType() != null && img.getContentType().startsWith("image")) 
            {
                //Set filename
                String filename = id + "-" + imgCount + ".jpeg";
                //Store image directly to server image directory
                img.write(imgDir + File.separator + filename);
                //Set file url
                imgUrls[imgCount] = imgDir + "/" + filename;
                
                //Convert image to bytes to store in db
//                InputStream imageInputStream = img.getInputStream();
//        
//                //Change input stream to output stream
//                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//                byte[] buffer = new byte[4096];
//                int bytesRead;
//                while ((bytesRead = imageInputStream.read(buffer)) != -1) {
//                    outputStream.write(buffer, 0, bytesRead);
//                }
//                byte[] imgbytes = outputStream.toByteArray();
                
                //Add imgcount
                imgCount++;
            }
        }
        
        //Setting varibles into product entity
        prod.setProdID(id);
        prod.setProdName(name);
        prod.setProdDesc(desc);
        prod.setProdPrice(price);
        prod.setQtyAvailable(qty);
        prod.setProdImg(imgUrls);
        prod.setKeywords(keywords);
        
        em.getTransaction().begin();
        em.persist(product);
        em.getTransaction().commit();

        em.close();
        emf.close();
        //empDAO.closeConnection();
    }
}
