<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--imports--%>
<%@page import="jpaEntity.Product,java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--includes: RetrieveProducts Servlet (This servlet will run automatically when the page is loaded)--%>
<jsp:include page="/RetrieveProductsAdm"/>

<%-- End: Retrieve Product List and Main Product From Session (prodList & mainProduct) --%>

<% 
//Get the result from servlet
Product prod = (Product) request.getAttribute("prod");
String[] imgs = (String[]) request.getAttribute("imgs");
String[] keys = (String[]) request.getAttribute("keys");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Products Menu</title>
        <!-- Include commonFiles.tag -->
        <custom:commonFilesAdm/>
    </head>

    <body class="text-center">
        <!--header-->
        <jsp:include page="components/adminheader.jsp" />
        
        <h1>Edit Products <%= prod.getProdname()%></h1>
        <p>Added on: <%= prod.getProdaddeddate()%></p>
        <form>
            <table border="1">
            <tr>
                <th>ID</th>
                <td><%= prod.getProdid()%></td>
            </tr>
            <tr>
                <th>Name</th>
                <td><input type="text" value="<%= prod.getProdname()%>"</td>
            </tr>
            <tr>
                <th>Description</th>
                <td><input type="textarea" value="<%= prod.getProddesc()%>"</td>
            </tr>
            <tr>
                <th>Price</th>
                <td><input type="text" value="<%= prod.getProdprice()%>"</td>
            </tr>
            <tr>
                <th>Qty Available</th>
                <td><input type="text" value="<%= prod.getQtyavailable()%>"</td>
            </tr>
            <tr>
                <th>Product Images</th>
                <td>
                    <table>
                        <tr>
                        <% 
                        for (int i = 0; i < imgs.length; i++)
                        {
                        %>
                            <td>
                                <img src="<%= imgs[i] %>" alt="Product Image" width="100" height="100"><br/>
                                <button type="button">Delete</button>
                            </td>
                        <%
                        }
                        %>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <th>Product Keywords</th>
            </tr>
            <tr>
                <th>Make it a main product ?</th>
                <td>
                    <input type="checkbox"
                        <% 
                        if (prod.getMain() == 'T')
                        {
                        %> checked
                        <%
                        }
                        %> 
                    />
                </td>
            </tr>
            <%
                }
            } 
            %>
            </table>
        </form>
    </body>
</html>