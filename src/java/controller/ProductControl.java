package controller;

import model.ProductDAO;
import entity.Product;
import java.util.ArrayList;

public class ProductControl {
    private ProductDAO prodDAO;

    public ProductControl() {
        prodDAO = new ProductDAO();
    }

    public Product selectProduct(String prodId) {
        return prodDAO.searchProd(prodId);
    }
    
    public ArrayList<Product> allProducts() {
        return prodDAO.showProd();
    }
    
    // public void insertRecord(String code, String name, String faculty) {
    //     prodDAO.insertRecord(code, name, faculty);
    // }
    
    // public void updateRecord(String code, String name, String faculty) {
    //     prodDAO.updateRecord(code, name, faculty);
    // }
    
    // public void deleteRecord(String code) {
    //     prodDAO.deleteRecord(code);
    // }
}
