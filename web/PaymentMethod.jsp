<%-- This file is a guideline for all individual jsp files --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports-->%

<%--includes--%>
<%
    // Prevent caching of the page
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
    
    // Check if the user is returning from an external page
    Boolean redirected = (Boolean) session.getAttribute("redirected");
    if (redirected != null && redirected) {
        // User returned from an external page
        // Call the OrderCreation servlet
        session.removeAttribute("redirected");
        RequestDispatcher dispatcher = request.getRequestDispatcher("OrderCreation");
        dispatcher.forward(request, response);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Payment Method</title>

        <!-- Include commonFiles.tag -->
        <custom:commonFiles />

    </head>

    <body class="text-center">
        <%--header--%>
        <jsp:include page="components/header.jsp" />

        <!--start of content-->
        <h3>Payment Method</h3>
        <form action="PaymentOption" method="post">
            <label for="payment-method-card">Debit/Credit Card</label>
            <input type ="radio" name="paymentMethod" value="card" id="payment-method-card" />
            <br/>
            <label for="payment-method-fpx">FPX</label>
            <input type ="radio" name="paymentMethod" value="fpx" id="payment-method-fpx" />
            <br/>
            <label for="payment-method-ewallet">E-Wallet</label>
            <input type ="radio" name="paymentMethod" value="ewallet" id="payment-method-ewallet" />
            <br/><br/>
            <button type="submit">Proceed</button>
        </form>
        <!--end of content-->
    </body>
    <%--footer--%>
    <jsp:include page="components/footer.jsp" />
</html>
