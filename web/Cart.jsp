<!-- This file is a guideline for all individual jsp files -->
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!--tags-->
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports--%>
<%@page import="entity.CartItem,java.util.ArrayList, model.CartItemDAO"%> 

<%--includes: RetrieveProducts Servlet (This servlet will run automatically when the page is loaded)--%>
<jsp:include page="/RetrieveCart"/>

<%-- Begin: Retrieve Product List From Session (prodList) --%>
<%
    ArrayList<CartItem> sessCartItemList = new ArrayList<CartItem>();
    if (session.getAttribute("cartItemList") != null) {
        sessCartItemList = (ArrayList<CartItem>) session.getAttribute("cartItemList");
    }
%>
<%-- End: Retrieve Product List From Session (prodList) --%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Cart</title>

        <!-- Include commonFiles.tag -->
        <custom:commonFiles />

        <!-- script to load servlet -->

    </head>

    <body class="text-center">
        <!--header-->
        <jsp:include page="components/header.jsp" />

        <!--start of content-->
        <%
            CartItem product = null;
            for (int i = 0; i < sessCartItemList.size(); i++) {
                product = sessCartItemList.get(i);
        %>
      
           <%= product.getProdId()%>
           <%= product.getItemQty()%>
           <%= product.getCartId()%>
     
        <% }%>
        <!--end of content-->

        <!--footer-->
        <jsp:include page="components/footer.jsp" />
    </body>
</html>
