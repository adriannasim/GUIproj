<%-- This file is a guideline for all individual jsp files --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports--%>
<%--includes--%>

<% 
    String paymentId = (String) request.getAttribute("paymentId");
    String orderId = (String) request.getAttribute("orderId");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Payment Success</title>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/profilestyles.css" rel="stylesheet" />
        <!-- Include commonFiles.tag -->
        <custom:commonFiles />
        <!-- Theme -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="assets/css/tiny-slider.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
    </head>

    <body class="text-center successPaymentjsp">
        <%--header--%>
        <jsp:include page="components/Header.jsp" />

        <!--start of content-->
        <div class="card pt-2 pb-2">
            <div style="border-radius:200px; height:150px; width:150px; background: #eef9fa; margin:0 auto;">
                <i class="checkmark" style="position:relative;top:-30px;">✓</i>
            </div>
            <h1 id="successH1">Success</h1> 
            <p id="successP">We received your purchase request;<br/> we'll be in touch shortly!</p>
            <hr>
            <p class="mt-3" style="font-size:10pt;">
                <span style="font-weight:bold;">Payment ID:&nbsp;</span>
             <%=paymentId%>
            </p>
            <p class="mt-1" style="font-size:10pt;">
                <span style="font-weight:bold;">Order ID:&nbsp;</span>
                <%=orderId%>
            </p>
            <a href="RetrieveCustomerProfile" class="btn profile-button mt-3" style="background-color: #3b5d50">View your order</a>
        </div>
       
        <!--end of content-->
    </body>

    <%--footer--%>
    <jsp:include page="components/Footer.jsp" />
</html>
