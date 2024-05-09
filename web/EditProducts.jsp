<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--imports--%>
<%@page import="jpaEntity.Product,java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--includes--%>
<jsp:include page="/RetrieveProductsAdm"/>
<jsp:include page="/EditProducts"/>

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
                <td><%= prod.getProdid()%><input type="hidden" name="prodid" value="<%= prod.getProdid()%>"/></td>
            </tr>
            <tr>
                <th>Name</th>
                <td><input type="text" name="prodname" value="<%= prod.getProdname()%>"</td>
            </tr>
            <tr>
                <th>Description</th>
                <td><input type="textarea" name="proddesc" value="<%= prod.getProddesc()%>"</td>
            </tr>
            <tr>
                <th>Price</th>
                <td><input type="text" name="prodprice" value="<%= prod.getProdprice()%>"</td>
            </tr>
            <tr>
                <th>Qty Available</th>
                <td><input type="number" name="qtyavailable" value="<%= prod.getQtyavailable()%>"</td>
            </tr>
            <tr>
                <th>Product Images</th>
                <button type="button" onclick="addImageInput()">Add Image</button>
                <td>
                    <table id="table-images">
                        <tr>
                        <% 
                        for (int i = 0; i < imgs.length; i++)
                        {
                        %>
                            <td id="imgCol">
                                <img src="<%= imgs[i] %>" name="img" width="100" height="100"><br/>
                                <button type="button" id="dlt-image">Delete</button>
                                <input type="hidden" name="existingImg" value="<%= imgs[i] %>" />
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
                <button type="button" id="add-keyword">Add Keyword</button>
                <td>
                    <table id="table-keys">
                        <tr>
                        <% 
                        for (int i = 0; i < keys.length; i++)
                        {
                        %>
                            <td id="keyCol">
                                <input type="text" name="key" value="<%= keys[i] %>"/><br/>
                                <button type="button" id="dlt-keyword">Delete</button>
                            </td>
                        <%
                        }
                        %>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <th>Make it a main product ?</th>
                <td>
                    <input type="checkbox" name="main"
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
            <input type="submit" value="Save" />
            <button type="button">Back</button>
        </form>
    </body>
</html>