package controller;

import entity.Product;
import model.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "RetrieveProduct", urlPatterns = {"/RetrieveProduct"})
public class RetrieveProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> productList = productDAO.retrieveProd();
        HttpSession session = request.getSession();

        if (productList != null) {
            session.setAttribute("productList", productList);
        } else {
            session.removeAttribute("productList");
        }

        productDAO.closeConnection();
        request.getRequestDispatcher("Home.jsp").forward(request, response);
    }
}
