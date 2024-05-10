<%-- This file is a guideline for all individual jsp files --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports--%>
<%--includes--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Payment Success</title>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/profilestyles.css" rel="stylesheet" />
        <!-- Include commonFiles.tag -->
        <custom:commonFiles />
    </head>

    <body class="text-center successPaymentjsp">
        <%--header--%>
        <jsp:include page="components/header.jsp" />

        <!--start of content-->
        <div class="card">
            <div style="border-radius:200px; height:150px; width:150px; background: #eef9fa; margin:0 auto;">
                <i class="checkmark" style="position:relative;top:-30px;">✓</i>
            </div>
            <h1 id="successH1">Success</h1> 
            <p id="successP">We received your purchase request;<br/> we'll be in touch shortly!</p>
            <hr>
            <p class="mt-3" style="font-size:10pt;">
                <span style="font-weight:bold;">Payment ID:&nbsp;</span>
                [Payment ID]
            </p>
            <p class="mt-1" style="font-size:10pt;">
                <span style="font-weight:bold;">Order ID:&nbsp;</span>
                [Order ID]
            </p>
            <a href="RetrieveCustomerProfile" class="btn btn-primary profile-button mt-3">View your order</a>
        </div>
       
        <!--end of content-->
    </body>

    <%--footer--%>
    <jsp:include page="components/footer.jsp" />
</html>
