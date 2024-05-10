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
        <a href="AddAccounts.jsp">Add Accounts</a>
        <a href="ManageAccountsMenu.jsp">Manage Accounts</a>
        <button onclick="logout()">Logout</button>
        <%
        }
        else
        {
        %>
        <h1>Staff Header</h1>
        <a href="AddProducts.jsp">Add Product</a>
        <a href="EditProductsMenu.jsp">Manage Products</a>
        <button onclick="logout()">Logout</button>
        <%   
        }
        %>
        <!--End of header-->