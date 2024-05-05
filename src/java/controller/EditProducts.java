package controller;

import entity.Product;
import java.io.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.persistence.*;

@WebServlet(name = "EditProducts", urlPatterns = {"/EditProducts"})
public class EditProducts extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //Initializations
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("productUnit");
        EntityManager em = emf.createEntityManager();
        
        String id = request.getParameter("prodid");
        String name = request.getParameter("prodname");
        String desc = request.getParameter("proddesc");
        String price = request.getParameter("prodprice");
        String qty = request.getParameter("qtyavailable");
        String keywords = request.getParameter("prodkeywords");
        
        //Processing the image input
        Part imgPart = request.getPart("prodimg");
        InputStream imgInputStream = imgPart.getInputStream();
        //Convert the input stream into a ByteArrayOutputStream
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead;
        while ((bytesRead = imgInputStream.read(buffer)) != -1)
        {
            outputStream.write(buffer, 0, bytesRead);
        }
        byte[] imageData = outputStream.toByteArray();
        
        Product prod = new Product();
        
        //Setting all values to be added to product table
        prod.setProdID(id);
        prod.setProdName(name);
        prod.setProdDesc(desc);
//        prod.setProdPrice(price);
//        prod.setQtyAvailable(qty);
//        prod.setProdKewords(keywords);
        //prod.setProdImgBytes(price);
        
        //Save everything to db
        em.getTransaction().begin();
        em.persist(prod);
        em.getTransaction().commit();
        
        em.close();
        emf.close();
        //empDAO.closeConnection();
    }
}
