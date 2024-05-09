<%@page import="jpaEntity.Custorder, java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports-->%

<%--includes--%>

<!DOCTYPE html>
<%
//Get all the attributes from servlet
Custorder order = (Custorder)request.getAttribute("order");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Admin Homepage</title>
        <!-- Include commonFiles.tag -->
        <custom:commonFilesAdm />
    </head>
    
    <body class="text-center">
        <%--header--%>
        <jsp:include page="components/adminheader.jsp" />
    
        <!--start of content-->
        <h1>Check Order Details</h1>
        <div>
            <table>
                <tr>
                    <th>Order ID</th>
                    <th>Order Date</th>
                    <th>Order Status</th>
                    <th>Customer Username</th>
                    <th>Receiver Name</th>
                    <th>Customer Contact No.</th>
                    <th>Customer Address</th>
                    <th>Remark</th>
                    <th>Packaging Date</th>
                    <th>Shipping Date</th>
                    <th>Delivery Date</th>
                </tr>
                <tr>
                    <td><%= order.getOrderid() %></td>
                    <td><%= order.getOrderdate() %></td>
                    <td><%= order.getStatus() %></td>
                    <td><%= order.getUsername() %></td>
                    <td><%= order.getName() %></td>
                    <td><%= order.getContactno() %></td>
                    <!--Display address-->
                    <td>
                    <%
                    if (request.getAttribute("addresses") != null)
                    {
                        String[] addresses = (String[])request.getAttribute("addresses");
                        for (int i = 0; i < addresses.length; i++)
                        {
                    %>
                        Address Line <%= i %>: <%= addresses[i] %><br/>
                    <%  
                        }
                    %>
                    <%
                    }
                    else
                    {
                    %>
                        Address: <%= order.getAddress() %>
                    <%
                    }
                    %>
                        City: <%= order.getCity() %>
                        State: <%= order.getState() %>
                        Postal Code: <%= order.getPostalcode() %>
                        Country: <%= order.getCountry() %>
                    </td>
                    <td><%= order.getRemark() != null ? order.getRemark() : "-" %></td>
                    <td><%= order.getPackaging() != null ? order.getPackaging() : "-" %></td>
                    <td><%= order.getShipping() != null ? order.getShipping() : "-" %></td>
                    <td><%= order.getDelivery() != null ? order.getDelivery() : "-" %></td>
                </tr>
            </table>
            <button type="button" onclick="UpdateStatus(<%= order.getOrderid() %>)">Update</button>
            <button type="button" id="back" onclick="window.location.href = 'CheckOrders.jsp';">Back</button>
        </div>
        <!--end of content-->
    </body>
</html>
