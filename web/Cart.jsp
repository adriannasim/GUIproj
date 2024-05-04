<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--tags-->
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %> <%--imports--%> <%@page
    import="entity.Product,entity.CartItem,java.util.ArrayList, model.CartItemDAO"%>

    <%-- Begin: Retrieve Product List From Session (prodList) --%> 
    <%
        ArrayList<CartItem> cartItemList = new ArrayList<CartItem>();
        if (session.getAttribute("cartItemList") != null) {
            cartItemList
                    = (ArrayList<CartItem>) session.getAttribute("cartItemList");
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
        </head>

        <body class="text-center d-flex flex-column">
            <!--header-->
            <jsp:include page="components/header.jsp" />

            <!--start of content-->
            <div id="cartContent">
                <!-- Display cart items -->
                <% for (CartItem cartItem : cartItemList) {%>
                <div class="d-flex flex-row align-items-center" id="cartItem<%= cartItem.getProd().getProdId()%>">
                    <!-- Display cart item details -->
                    <img src="<%= request.getContextPath() + cartItem.getProd().getProdImg()[0]%>" height="200px" width="auto" />
                    <%= cartItem.getProd().getProdId()%>&nbsp; <%= cartItem.getProd().getProdName()%>&nbsp;
                    RM<%= cartItem.getProd().getProdPrice()%>&nbsp; Qty:

                    <!-- Buttons for increment, decrement, and delete -->
                    <div class="btns">
                        <button class="btn" type="button" onclick="decrementValueAndUpdate('qty<%= cartItem.getProd().getProdId()%>', 1, '<%= cartItem.getProd().getProdId()%>')">
                            -
                        </button>
                        <input
                            min="1"
                            max="<%= cartItem.getProd().getQtyAvailable()%>"
                            value="<%= cartItem.getItemQty()%>"
                            name="qty"
                            type="number"
                            class=""
                            id="qty<%= cartItem.getProd().getProdId()%>"
                            onchange="updateCartItem('<%= cartItem.getProd().getProdId()%>', this.value)"
                            />
                        <button class="btn" type="button" onclick="incrementValueAndUpdate('qty<%= cartItem.getProd().getProdId()%>', <%= cartItem.getProd().getQtyAvailable()%>, '<%= cartItem.getProd().getProdId()%>')">
                            +
                        </button>
                    </div>
                    <button type="button" onclick="deleteCartItem('<%= cartItem.getProd().getProdId()%>')">Delete</button>
                </div>
                <% }%>
            </div>
            <!--end of content-->

            <!--footer-->
            <jsp:include page="components/footer.jsp" />
        </body>
    </html> 