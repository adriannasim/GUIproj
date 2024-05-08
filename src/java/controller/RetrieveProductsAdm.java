package controller;

import jpaEntity.Product;
import java.io.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.persistence.*;

@WebServlet(name = "RetrieveProductsAdm", urlPatterns = {"/RetrieveProductsAdm"})
public class RetrieveProductsAdm extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //Initializations
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        EntityManager em = emf.createEntityManager();
        
        boolean menu;
        
        //Get slug from url
        String slug = request.getParameter("slug");
        
        //Get Product from db
        //If slug exists (means its from EditProducts.jsp)
        if (slug != null) 
        {
            //Set menu to false so it will send response to EditProducts.jsp
            menu = false;
            TypedQuery<Product> querystr = em.createQuery("SELECT prod FROM Product prod WHERE prod.prodslug = :slug", Product.class);
            querystr.setParameter("slug", slug);
            Product prod = querystr.getSingleResult();
            request.setAttribute("prod", prod);
            
            //Get Images
            String[] prodImgArray;
            if (prod.getProdimg().contains(";"))
            {
                //If there are multiple images, split them
                prodImgArray = prod.getProdimg().split(";");
            } 
            else
            {
                //If there's only one image, create an array with a single element
                prodImgArray = new String[]{prod.getProdimg()};
            }
            request.setAttribute("imgs", prodImgArray);
            
            //Get Keywords
            String[] prodKeyArray;
            if (prod.getProdkeywords().contains(";")) {
                // If there are multiple keywords, split them
                prodKeyArray = prod.getProdkeywords().split(";");
            } else {
                // If there's only one keyword, create an array with a single element
                prodKeyArray = new String[]{prod.getProdkeywords()};
            }
            request.setAttribute("keys", prodKeyArray);
        }
        //If slug doesnt exists (means its from EditProductsMenu.jsp)
        else 
        {
            TypedQuery<Product> querystr = em.createQuery("SELECT prod FROM Product prod", Product.class);
            List<Product> productList = querystr.getResultList();
            request.setAttribute("prodList", productList);
        }
        
        em.close();
        emf.close();

        //Send response to jsp
        response.sendRedirect("EditProductsMenu.jsp");
        response.sendRedirect("EditProducts.jsp");
    }
}