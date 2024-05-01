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
import java.util.logging.Logger;
import java.util.logging.Level;

public class ProductDAO {

    private String tableName = "Product";
    private DatabaseConn conn;
    private PreparedStatement stmt;

    public ProductDAO() {
        conn = new DatabaseConn();
    }

    public ArrayList<Product> getAllProducts() {
        ArrayList<Product> prodList = new ArrayList<>();

        // Database query to retrieve product by ID
        String queryStr = "SELECT * FROM " + tableName;

        try {
            stmt = conn.returnConnection().prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String prodImgList = rs.getString("prodImg");
                String[] prodImgArray = null;
                if (prodImgList.contains(";")) {
                    // If there are multiple images, split them
                    prodImgArray = prodImgList.split(";");
                } else {
                    // If there's only one image, create an array with a single element
                    prodImgArray = new String[]{prodImgList};
                }

                String prodKeyList = rs.getString("prodKeywords");
                String[] prodKeyArray = null;
                if (prodKeyList.contains(";")) {
                    // If there are multiple keywords, split them
                    prodKeyArray = prodKeyList.split(";");
                } else {
                    // If there's only one keyword, create an array with a single element
                    prodKeyArray = new String[]{prodKeyList};
                }

                Product prod = new Product(rs.getString("prodId"), rs.getString("prodName"), rs.getString("prodDesc"),
                        rs.getDouble("prodPrice"), rs.getInt("qtyAvailable"), prodImgArray, prodKeyArray);
                prodList.add(prod);
            }
        } catch (SQLException ex) {
            System.err.println("Error occurred retrieving product: " + ex.getMessage());
            ex.printStackTrace();
        }
        return prodList;
    }

    public Product getProductById(String prodId) {
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

                prod = new Product(prodId, rs.getString("prodName"), rs.getString("prodDesc"),
                        rs.getDouble("prodPrice"), rs.getInt("qtyAvailable"), prodImgArray, prodKeyArray);
            }
        } catch (SQLException ex) {
            System.err.println("Error occurred retrieving product: " + ex.getMessage());
            ex.printStackTrace();
        }
        return prod;
    }

    public void insertRecord(String prodid, String prodname, String proddesc, double prodprice, int qtyavailable, String prodimg, String prodkeywords, String prodaddeddate) {
        String queryStr = "INSERT INTO " + tableName + " VALUES (?,?,?,?,?,?,?,?)";

        try {
            stmt = conn.returnConnection().prepareStatement(queryStr);

            stmt.setString(1, prodid);
            stmt.setString(2, prodname);
            stmt.setString(3, proddesc);
            stmt.setDouble(4, prodprice);
            stmt.setInt(5, qtyavailable);
            stmt.setString(6, prodimg);
            stmt.setString(7, prodkeywords);
            stmt.setString(8, prodaddeddate);
            stmt.execute();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public void updateRecord(String prodid, String prodname, String proddesc, double prodprice, int qtyavailable, String prodimg, String prodkeywords, String prodaddeddate) {
        String queryStr = "UPDATE " + tableName + " SET prodname=?,proddesc=?,prodprice=?,qtyavailable=?,prodimg=?,prodkeywords=?,prodaddeddate=? WHERE prodid=?";

        try {
            stmt = conn.returnConnection().prepareStatement(queryStr);

            stmt.setString(1, prodname);
            stmt.setString(2, proddesc);
            stmt.setDouble(3, prodprice);
            stmt.setInt(4, qtyavailable);
            stmt.setString(5, prodimg);
            stmt.setString(6, prodkeywords);
            stmt.setString(7, prodaddeddate);
            stmt.setString(8, prodid);
            stmt.executeUpdate();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public void deleteRecord(String username) {
        String queryStr = "DELETE FROM " + tableName + " WHERE username=?";
        try {
            stmt = dbConn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, username);
            stmt.execute();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public void closeConnection() {
        try {
            if (conn.returnConnection() != null) {
                conn.shutDown();
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.WARNING, null, ex);
        }
    }

}
