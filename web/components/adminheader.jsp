<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports--%>

        <!--Start of header-->
        <% 
        //Get employee role
        String role = (String) session.getAttribute("role");
        if ("admin".equals(role))
        {
        %>
        <h1>Admin Header</h1>
        <a href="AddProducts.jsp">Add Product</a>
        <a href="EditProductsMenu.jsp">Manage Products</a>
        <a href="#">Check Orders</a>
        <a href="#">Manage Payments</a>
        <a href="#">Manage Accounts</a>
        <%
        }
        else
        {
        %>
        <h1>Staff Header</h1>
        <a href="AddProducts.jsp">Add Product</a>
        <a href="EditProductsMenu.jsp">Manage Products</a>
        <a href="#">Check Orders</a>
        <%   
        }
        %>
        <!--End of header-->