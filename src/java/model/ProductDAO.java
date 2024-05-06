//package src.java.model;
package model;

import entity.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;

public class ProductDAO {

    private String tableName = "public.Product";
    private DatabaseConn conn;
    private PreparedStatement stmt;

    public ProductDAO() {
        conn = new DatabaseConn();
    }

    // Retrieve all products
    public ArrayList<Product> getAllProducts() {
        ArrayList<Product> prodList = new ArrayList<>();
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

                Product prod = new Product(
                        rs.getString("prodId"),
                        rs.getString("prodName"),
                        rs.getString("prodDesc"),
                        rs.getDouble("prodPrice"),
                        rs.getInt("qtyAvailable"),
                        prodImgArray,
                        prodKeyArray,
                        LocalDate.parse(rs.getString("prodAddedDate")));

                prodList.add(prod);
            }
        } catch (SQLException ex) {
            System.err.println("Error occurred retrieving product: " + ex.getMessage());
            ex.printStackTrace();
        }
        return prodList;
    }

    // Retrieve specific product by product id 
    public Product getProductById(String prodId) {
        Product prod = null;
        String queryStr = "SELECT * FROM " + tableName + " WHERE prodId = ?";

        try {
            stmt = conn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, prodId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String prodImgList = rs.getString("prodImg");
                String[] prodImgArray = prodImgList.split(";");
                String prodKeyList = rs.getString("prodKeywords");
                String[] prodKeyArray = prodKeyList.split(";");

                prod = new Product(rs.getString("prodId"),
                        rs.getString("prodName"),
                        rs.getString("prodDesc"),
                        rs.getDouble("prodPrice"),
                        rs.getInt("qtyAvailable"),
                        prodImgArray,
                        prodKeyArray,
                        LocalDate.parse(rs.getString("prodAddedDate")));
            }
        } catch (SQLException ex) {
            System.err.println("Error occurred retrieving product: " + ex.getMessage());
            ex.printStackTrace();
        }
        return prod;
    }

    public List<String> matchProductByName(String query) {
        //Initializing a list to store all matching result
        List<String> matches = new ArrayList<>();
        //Database query to retrieve product by ID
        String queryStr = "SELECT * FROM " + tableName + " WHERE LOWER(prodName) LIKE ?";

        try {
            stmt = conn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, "%" + query + "%");
            ResultSet rs = stmt.executeQuery();

            //Add all result to list
            while (rs.next()) {
                matches.add(rs.getString("prodName"));
            }
        } catch (SQLException ex) {
            System.err.println("Error occurred retrieving product: " + ex.getMessage());
            ex.printStackTrace();
        }
        return matches;
    }

    // Retrieve the main product
    public Product getMainProduct() {
        Product prod = null;
        String queryStr = "SELECT * FROM " + tableName + " WHERE main = 'T'";

        try {
            stmt = conn.returnConnection().prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String prodImgList = rs.getString("prodImg");
                String[] prodImgArray = prodImgList.split(";");
                String prodKeyList = rs.getString("prodKeywords");
                String[] prodKeyArray = prodKeyList.split(";");

                prod = new Product(rs.getString("prodId"),
                        rs.getString("prodName"),
                        rs.getString("prodDesc"),
                        rs.getDouble("prodPrice"),
                        rs.getInt("qtyAvailable"),
                        prodImgArray,
                        prodKeyArray,
                        LocalDate.parse(rs.getString("prodAddedDate")));
            }
        } catch (SQLException ex) {
            System.err.println("Error occurred retrieving product: " + ex.getMessage());
            ex.printStackTrace();
        }
        return prod;
    }

    // Retrieve recommended products by comparing the keywords
    public ArrayList<Product> getRecommendedProducts(String prodId) {
        Product selectedProd = getProductById(prodId);
        String[] keywords1 = selectedProd.getProdKeywords();

        ArrayList<Product> allProdList = getAllProducts();
        ArrayList<Product> filteredProdList = new ArrayList<Product>();
        for (Product product : allProdList) {
            if (!product.getProdId().equals(selectedProd.getProdId())) {
                filteredProdList.add(product);
            }
        }

        ArrayList<Product> matchedProducts = new ArrayList<>();

        // Iterate through all products
        for (Product product : filteredProdList) {
            String[] keywords2 = product.getProdKeywords();

            // Calculate the number of common keywords between the selected product and the current product
            int commonKeywords = countCommonKeywords(keywords1, keywords2);

            if (commonKeywords >= 1) {
                matchedProducts.add(product);
            }
        }

        // Sort the matched products based on the number of common keywords (descending order)
        Collections.sort(matchedProducts, (p1, p2) -> {
            int commonKeywords1 = countCommonKeywords(keywords1, p1.getProdKeywords());
            int commonKeywords2 = countCommonKeywords(keywords1, p2.getProdKeywords());
            return Integer.compare(commonKeywords2, commonKeywords1);
        });

        // Return the top 3 matches if available, otherwise shuffle and return others
        if (matchedProducts.size() >= 3) {
            return new ArrayList<>(matchedProducts.subList(0, 3));
        } else if (matchedProducts.size() == 2) {
            Iterator<Product> iterator = filteredProdList.iterator();
            while (iterator.hasNext()) {
                Product product = iterator.next();
                if (product.getProdId().equals(matchedProducts.get(0).getProdId())
                        || product.getProdId().equals(matchedProducts.get(1).getProdId())) {
                    iterator.remove();
                }
            }
            Collections.shuffle(filteredProdList);
            matchedProducts.add(filteredProdList.get(0));
            return matchedProducts;
        } else if (matchedProducts.size() == 1) {
            Iterator<Product> iterator = filteredProdList.iterator();
            while (iterator.hasNext()) {
                Product product = iterator.next();
                if (product.getProdId().equals(matchedProducts.get(0).getProdId())) {
                    iterator.remove();
                }
            }
            Collections.shuffle(filteredProdList);
            matchedProducts.add(filteredProdList.get(0));
            matchedProducts.add(filteredProdList.get(1));
            return matchedProducts;
        } else {
            Collections.shuffle(filteredProdList);
            matchedProducts.add(filteredProdList.get(0));
            matchedProducts.add(filteredProdList.get(1));
            matchedProducts.add(filteredProdList.get(2));
            return matchedProducts;
        }
    }

    // method to calculate common keywords
    private int countCommonKeywords(String[] keywords1, String[] keywords2) {
        HashSet<String> set = new HashSet<>(Arrays.asList(keywords1));
        int commonKeywords = 0;
        for (String keyword : keywords2) {
            if (set.contains(keyword)) {
                commonKeywords++;
            }
        }
        return commonKeywords;
    }

    // Retrieve latest 4 products
    public ArrayList<Product> getLatestProducts() {
        ArrayList<Product> prodList = new ArrayList<>();
        String queryStr = "SELECT * FROM " + tableName
                + " WHERE prodAddedDate <= NOW() ORDER BY prodAddedDate DESC LIMIT 4";

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

                Product prod = new Product(
                        rs.getString("prodId"),
                        rs.getString("prodName"),
                        rs.getString("prodDesc"),
                        rs.getDouble("prodPrice"),
                        rs.getInt("qtyAvailable"),
                        prodImgArray,
                        prodKeyArray,
                        LocalDate.parse(rs.getString("prodAddedDate")));
                prodList.add(prod);
            }
        } catch (SQLException ex) {
            System.err.println("Error occurred retrieving product: " + ex.getMessage());
            ex.printStackTrace();
        }
        return prodList;
    }

    // Add product
    public void insertRecord(String prodid, String prodname, String proddesc, double prodprice, 
            int qtyavailable, String prodimg, String prodkeywords, LocalDate prodaddeddate) {
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
            java.sql.Date sqlDate = java.sql.Date.valueOf(prodaddeddate);
            stmt.setDate(8, sqlDate);
            stmt.execute();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    // Update product
    public void updateRecord(String prodid, String prodname, String proddesc, double prodprice, 
            int qtyavailable, String prodimg, String prodkeywords, LocalDate prodaddeddate) {
        String queryStr = "UPDATE " + tableName + " SET prodname=?,proddesc=?,prodprice=?,qtyavailable=?,prodimg=?,"
                + "prodkeywords=?,prodaddeddate=? WHERE prodid=?";

        try {
            stmt = conn.returnConnection().prepareStatement(queryStr);

            stmt.setString(1, prodname);
            stmt.setString(2, proddesc);
            stmt.setDouble(3, prodprice);
            stmt.setInt(4, qtyavailable);
            stmt.setString(5, prodimg);
            stmt.setString(6, prodkeywords);
            java.sql.Date sqlDate = java.sql.Date.valueOf(prodaddeddate);
            stmt.setDate(7, sqlDate);
            stmt.setString(9, prodid);
            stmt.executeUpdate();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public void updateRecordMainProd(String prodid, String main) {
        String queryStr = "UPDATE " + tableName + " SET main=? WHERE prodid=?";

        try {
            stmt = conn.returnConnection().prepareStatement(queryStr);

            stmt.setString(1, main);
            stmt.setString(2, prodid);
            stmt.executeUpdate();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }
    
    public void updateRecordProdslugCol(String prodid, String prodslug) {
        String queryStr = "UPDATE " + tableName + " SET prodslug=? WHERE prodid=?";

        try {
            stmt = conn.returnConnection().prepareStatement(queryStr);

            stmt.setString(1, prodslug);
            stmt.setString(2, prodid);
            stmt.executeUpdate();

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    // Delete Product
    public void deleteRecord(String prodid) {
        String queryStr = "DELETE FROM " + tableName + " WHERE prodid=?";
        try {
            stmt = conn.returnConnection().prepareStatement(queryStr);
            stmt.setString(1, prodid);
            stmt.execute();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    // Close DB conncetion
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
