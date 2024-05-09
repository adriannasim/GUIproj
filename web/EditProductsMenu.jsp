<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--imports--%>
<%@page import="jpaEntity.Product,java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--includes--%>
<jsp:include page="/RetrieveProductsAdm"/>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/DeleteProduct.js"></script>
        <title>Edit Products Menu</title>
        <!-- Include commonFiles.tag -->
        <custom:commonFilesAdm/>
    </head>

    <body class="text-center">
        <!--header-->
        <jsp:include page="components/adminheader.jsp" />
        
        <h1>Edit Products Menu</h1>
        <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th colspan="2">Stock</th>
            <th colspan="2">Modify</th>
        </tr>
        <% if (request.getAttribute("prodList") != null)
        {
            for (Product product : (List<Product>) request.getAttribute("prodList")) 
            { 
        %>
            <tr>
                <td><%= product.getProdid() %></td>
                <td><%= product.getProdname()%></td>
                <td><%= product.getProdprice()%></td>
                <td id="stockCol_<%= product.getProdid() %>"><%= product.getQtyavailable()%></td>
                <td><button changeStock(<%= product.getProdid() %>) >Change Stock</button></td>
                <td><a href="EditProducts.jsp?slug=<%= product.getProdslug() %>">Edit</a></td>
                <td><button onclick="confirmDelete(<%=product.getProdid()%>)">Delete</button></td>
            </tr>
        <%
            }
        } 
        %>
    </table>
    </body>
</html>