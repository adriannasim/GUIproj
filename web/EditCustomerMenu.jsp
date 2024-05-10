<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--imports--%>
<%@page import="jpaEntity.Customer,java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--includes--%>
<jsp:include page="/RetrieveAccounts"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/DeleteAccount.js"></script>
        <title>Manage Customer Accounts</title>
        <!-- Include commonFiles.tag -->
        <custom:commonFilesAdm/>
    </head>

    <body class="text-center">
        <!--header-->
        <jsp:include page="components/adminheader.jsp" />
        
        <h1>Manage Customer Accounts</h1>
        <table border="1">
        <tr>
            <th>Username</th>
            <th>Email</th>
            <th colspan="2">Name</th>
            <th>Gender</th>
            <th>Contact No.</th>
            <th colspan="2">Modify</th>
        </tr>
        <% if (request.getAttribute("custList") != null)
        {
            for (Customer cust : (List<Customer>) request.getAttribute("custList")) 
            { 
        %>
            <tr>
                <td><%= cust.getCustomerPK().getUsername()%></td>
                <td><%= cust.getCustomerPK().getEmail()%></td>
                <td>First name: <%= cust.getFirstname()%></td>
                <td>Last name: <%= cust.getLastname()%></td>
                <td><%= cust.getGender()%></td>
                <td><%= cust.getContactno()%></td>
                <td><a href="EditCustomer.jsp?us=<%= cust.getCustomerPK().getUsername()%>&email=<%= cust.getCustomerPK().getEmail()%>">Edit</a></td>
                <td><button onclick="confirmDeleteCust(<%= cust.getCustomerPK().getUsername()%>, <%= cust.getCustomerPK().getEmail()%>)">Delete</button></td>
            </tr>
        <%
            }
        } 
        %>
    </table>
    </body>
</html>