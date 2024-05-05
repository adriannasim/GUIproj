<%-- This file is a guideline for all individual jsp files --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports-->%

<%--includes--%>
<jsp:include page="/AdminLogin"/>
      
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Template</title>

        <!-- Include commonFiles.tag -->
        <custom:commonFiles />

    </head>
    
    <body class="text-center">
        <%--header--%>
        <jsp:include page="components/adminheader.jsp" />
    
        <!--start of content-->
        <h1>Sign In</h1>
        <form action="signup" method="post">
            <label>Username/Email</label>
            <input name="username" type="text"/><br/>

            <label>Password</label>
            <input name="password" type="text"/><br/>

            <button type="submit">Sign In</button>
        </form>
        <!--end of content-->
    </body>
</html>
