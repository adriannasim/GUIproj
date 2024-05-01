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

@WebServlet(name = "RetrieveProducts", urlPatterns = {"/RetrieveProducts"})
public class RetrieveProducts extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO prodDA = new ProductDAO();

        String prodId;
        ArrayList<Product> prodList = null;
        HttpSession session = request.getSession();

        if (request.getParameter("id") != null && !request.getParameter("id").equals("")) {

            prodId = request.getParameter("id");
            prodList.add(prodDA.getProductById(prodId));

        } else {
            prodList = prodDA.getAllProducts();
        }

        if (prodList != null) {
            session.setAttribute("prodList", prodList);
        } else {
            session.removeAttribute("prodList");
        }

        prodDA.closeConnection();

        response.sendRedirect("Home.jsp");
    }
}
