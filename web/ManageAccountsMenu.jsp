<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--imports--%>
<%@page import="jpaEntity.Employee,java.util.ArrayList"%>
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
        <title>Manage Staff Accounts</title>
        <!-- Include commonFiles.tag -->
        <custom:commonFilesAdm/>
    </head>

    <body class="text-center">
        <!--header-->
        <jsp:include page="components/adminheader.jsp" />
        
        <h1>Manage Staff Accounts</h1>
        <table border="1">
        <tr>
            <th>Employee ID</th>
            <th>Employee Role</th>
            <th>Username</th>
            <th>Email</th>
            <th colspan="2">Modify</th>
        </tr>
        <% if (request.getAttribute("empList") != null)
        {
            for (Employee emp : (List<Employee>) request.getAttribute("empList")) 
            { 
        %>
            <tr>
                <td><%= emp.getEmpid()%></td>
                <td><%= emp.getEmprole()%></td>
                <td><%= emp.getUsername()%></td>
                <td><%= emp.getEmail()%></td>
                <td><a href="ManageAccounts.jsp?id=<%= emp.getEmpid() %>">Edit</a></td>
                <td><button onclick="confirmDelete(<%= emp.getEmpid()%>)">Delete</button></td>
            </tr>
        <%
            }
        } 
        %>
    </table>
    </body>
</html>