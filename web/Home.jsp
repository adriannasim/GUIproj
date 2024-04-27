<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Product,java.util.ArrayList, model.ProductDAO"%>

<!DOCTYPE html>
<%
    ProductDAO productDAO = new ProductDAO();
    ArrayList<Product> productList = productDAO.retrieveProd();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <h1>Products</h1>
        <form action="Retrieveproduct" method="GET">
            <%
                for(Product product: productList){ %>
                    <div><%=product.getProdName()%></div>
                <%}
            %>
        </form>
    </body>
</html>

