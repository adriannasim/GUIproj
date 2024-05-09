<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--imports--%>
<%@page import="jpaEntity.Employee,java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--includes--%>
<jsp:include page="/ResetPasswordAdm"/>

<% 
//Get the result from servlet
String username = (String) request.getParameter("username");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/CheckAccountInput.js"></script>
        <title>Reset Password</title>
        <!-- Include commonFiles.tag -->
        <custom:commonFilesAdm/>
    </head>

    <body class="text-center">
        <!--header-->
        <jsp:include page="components/adminheader.jsp" />
        
        <h1>Reset Password</h1>
        <form action="ManageAccounts" method="post">
            <label>New Password:</label>
            <input type="password" name="emppsw" onkeyup="validatePassword()"/><br/>
            <label>Confirm Password:</label>
            <input type="password" name="emppswcon" onkeyup="validatePassword()"/><br/>
            <div id="chkPsw"></div>
            
            <input type="submit" id="submit" value="Reset Password" />
            <button type="button" id="back" onclick="window.location.href = 'ManageAccounts.jsp?id=<%= username %>.jsp';">Back</button>
        </form>
    </body>
</html>