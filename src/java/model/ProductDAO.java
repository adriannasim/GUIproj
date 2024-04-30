//package src.java.model;
package model;

import entity.Product;
import java.awt.event.ActionEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import java.sql.*;
import javax.swing.*;
import java.util.ArrayList;

public class ProductDAO {

    private String tableName = "Product";
    private DatabaseConn conn;
    private PreparedStatement stmt;

    public ProductDAO() {
        conn = new DatabaseConn();
    }

    public ArrayList<Product> showProd() {
        ArrayList<Product> prodList = new ArrayList<>();

        // Database query to retrieve product by ID
        String queryStr = "SELECT * FROM " + tableName;

        try {
            stmt = conn.returnConnection().prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String prodImgList = rs.getString("prodImg");
                String[] prodImgArray = prodImgList.split(";");
                String prodKeyList = rs.getString("prodKeywords");
                String[] prodKeyArray = prodKeyList.split(";");

                Product prod = new Product(rs.getString("prodId"), rs.getString("prodName"), rs.getString("prodDesc"), rs.getDouble("prodPrice"), rs.getInt("qtyAvailable"), prodImgArray, prodKeyArray);
                prodList.add(prod);
            }
        } catch (SQLException ex) {
            System.err.println("Error occurred retrieving product: " + ex.getMessage());
            ex.printStackTrace();
        }
        return prodList;
    }

    public Product searchProd(String prodId) {
        Product prod = null;

        // Database query to retrieve product by ID
        String queryStr = "SELECT * FROM " + tableName + " WHERE prodId = ?";

        try {
            stmt = conn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, prodId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String prodImgList = rs.getString("prodImg");
                String[] prodImgArray = prodImgList.split(";");
                String prodKeyList = rs.getString("prodKeywords");
                String[] prodKeyArray = prodImgList.split(";");

                prod = new Product(prodId, rs.getString("prodName"), rs.getString("prodDesc"), rs.getDouble("prodPrice"), rs.getInt("qtyAvailable"), prodImgArray, prodKeyArray);
            }
        } catch (SQLException ex) {
            System.err.println("Error occurred retrieving product: " + ex.getMessage());
            ex.printStackTrace();
        }
        return prod;
    }

    public void insertProd(Product product) {
        // Database query to insert product
    }

    public void updateProd(Product product) {
        // Database query to update product
    }

    public void deleteProd(int productId) {
        // Database query to delete product
    }
}
