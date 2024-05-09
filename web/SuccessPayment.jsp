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

        <!-- Success Payment CSS -->
        <style>
            body.successPaymentjsp {
                text-align: center;
                padding: 40px 0;
                background: #EBF0F5;
            }
            
            #successH1 {
                color: #17a2b8;
                font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
                font-weight: 900;
                font-size: 40px;
                margin-bottom: 10px;
            }
            
            #successP {
                color: #404F5E;
                font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
                font-size:20px;
                margin: 0;
            }
            
            .successPaymentjsp .checkmark {
                color: #17a2b8;
                font-size: 80px;
                line-height: 200px;
                margin-left:-15px;
            }
            
            .successPaymentjsp .card {
                background: white;
                padding: 60px;
                border-radius: 4px;
                box-shadow: 0 2px 3px #C8D0D8;
                display: inline-block;
                margin: 0 auto;
            }
            
            #success-backToProfile:hover {
                color:#17a2b8;
                text-decoration:none;
            }
        </style>

        <!-- Include commonFiles.tag -->
        <custom:commonFiles />

    </head>

    <body class="text-center">
        <%--header--%>
        <jsp:include page="components/header.jsp" />

        <!--start of content-->
        <div class="card">
            <div style="border-radius:200px; height:150px; width:150px; background: #eef9fa; margin:0 auto;">
                <i class="checkmark">✓</i>
            </div>
            <h1 id="successH1">Success</h1> 
            <p id="successP">
                We received your purchase request!<br/> we'll be in touch shortly!
                <br>
                <a href="CustomerProfile.jsp" id="success-backToProfile"
                   style="text-decoration:none;color:black;">Check your order at your profile</a>
            </p>
        </div>
        <h2>Your payment is success.</h2>
        <a href="CustomerProfile.jsp">Click here to view your order.</a>
        <!--end of content-->
        
    </body>
    <%--footer--%>
    <jsp:include page="components/footer.jsp" />
</html>
