<%-- This file is a guideline for all individual jsp files --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports--%>
<%@ include file="bootstrap_styles.jsp" %>
<%--includes--%>
      
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Payment Success</title>

        <!-- Include commonFiles.tag -->
        <custom:commonFiles />

    </head>
    
    <body class="text-center">
        <%--header--%>
        <jsp:include page="components/header.jsp" />
    
        <!--start of content-->
        <h2>Your payment is success.</h2>
        <div>Click here to view your order.</div>
        <!--end of content-->
    </body>
    <%--footer--%>
    <jsp:include page="components/footer.jsp" />
</html>
