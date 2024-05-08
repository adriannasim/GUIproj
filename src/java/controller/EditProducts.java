package controller;

import entity.Product;
import java.io.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
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
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GUI_AssignmentPU");
        EntityManager em = emf.createEntityManager();
        
        //Get Product from db
        TypedQuery<Product> querystr = em.createQuery("SELECT prod FROM Product prod WHERE prod.prodslug = :slug", Product.class);
        querystr.setParameter("slug", slug);
        List<Product> productList = querystr.getResultList();
        
        em.close();
        emf.close();
        
        request.setAttribute("prodList", productList);
        
        //Send response to jsp
        response.sendRedirect("EditProductsMenu.jsp");
    }
}
