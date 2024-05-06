package controller;

import entity.Product;
import model.ProductDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "RetrieveProducts", urlPatterns = {"/RetrieveProducts"})
public class RetrieveProducts extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //initializations
        ProductDAO prodDA = new ProductDAO();
        ArrayList<Product> prodList = new ArrayList<>();
        ArrayList<Product> suggestionList = new ArrayList<>();
        String prodId;
        String viewAll;
        Product mainProduct = new Product();
        HttpSession session = request.getSession();

        //If need retrieve specific product details and other recommended products
        if (request.getParameter("id") != null && !request.getParameter("id").equals("")) {
            prodId = request.getParameter("id");
            prodList.add(prodDA.getProductById(prodId));
            suggestionList = prodDA.getRecommendedProducts(prodId);
        } 
        //If need retrieve all products and main product
        else if (request.getParameter("all") != null && !request.getParameter("all").equals("")) {
            viewAll = request.getParameter("all");
            if (viewAll.equalsIgnoreCase("t")) {
                prodList = prodDA.getAllProducts();
                mainProduct = prodDA.getMainProduct();
            }
        } 
        //Else, for main page latest products
        else {
            prodList = prodDA.getLatestProducts();
        }

        //if there's products in the arraylist prodList
        if (prodList.isEmpty() == false) {
            session.setAttribute("prodList", prodList);
        } else {
            session.removeAttribute("prodList");
        }

        //if there's products in the arraylist suggestionList
        if (suggestionList.isEmpty() == false) {
            session.setAttribute("suggestionList", suggestionList);
        } else {
            session.removeAttribute("suggestionList");
        }

        //if there's main product
        if (mainProduct != null) {
            session.setAttribute("mainProduct", mainProduct);
        } else {
            session.removeAttribute("mainProduct");
        }

        // close DB Connection
        prodDA.closeConnection();

        response.sendRedirect("Home.jsp");
    }
}
