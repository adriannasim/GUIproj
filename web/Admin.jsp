<%@page import="jpaEntity.Custorder, java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports-->%

<%--includes--%>

<!DOCTYPE html>
<%
//Get all the attributes from servlet
List<Custorder> all = (List<Custorder>)request.getAttribute("all");
List<Custorder> packaging = (List<Custorder>)request.getAttribute("packing");
List<Custorder> shipping = (List<Custorder>)request.getAttribute("shipping");
List<Custorder> delivery = (List<Custorder>)request.getAttribute("delivering");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Admin Homepage</title>
        <script src="js/FilterOrders.js"></script>
        <script src="js/UpdateStatus.js"></script>
        <!-- Include commonFiles.tag -->
        <custom:commonFilesAdm />
    </head>
    
    <body class="text-center">
        <%--header--%>
        <jsp:include page="components/adminheader.jsp" />
    
        <!--start of content-->
        <h1>Admin Homepage</h1>
        <h2>Orders</h2>
        <!-- Filters -->
        <select id="filter">
            <option value="all">All</option>
            <option value="packaging">Packaging</option>
            <option value="shipping">Shipping</option>
            <option value="delivery">Delivery</option>
        </select>
        
        <!--Filter set to all orders-->
        <div>
            <table>
                <tr>
                    <th>Order ID</th>
                    <th>Order Date</th>
                    <th>Order Status</th>
                    <th>Customer Username</th>
                    <th>Customer Contact No.</th>
                    <th>Update Status</th>
                    <th>View Details</th>
                </tr>
                <tr id="all">
                    <%
                    for (int i = 0; i < all.size(); i++)
                    {
                    %>
                    <td><%= all.get(i).getOrderid() %></td>
                    <td><%= all.get(i).getOrderdate() %></td>
                    <td><%= all.get(i).getStatus() %></td>
                    <td><%= all.get(i).getUsername() %></td>
                    <td><%= all.get(i).getContactno() %></td>
                    <td><Button type="button" onclick="UpdateStatus(<%= all.get(i).getOrderid() %>)">Update</Button></td>
                    <td><Button type="button" onclick="window.location.href='CheckOrderDetails.jsp?id=<%= all.get(i).getOrderid() %>;">View</Button></td>
                    <%
                    }
                    %>
                </tr>
                
                <% if (packaging != null) { %>
                <tr id="packaging">
                    <%
                    for (int i = 0; i < packaging.size(); i++)
                    {
                    %>
                    <td><%= packaging.get(i).getOrderid() %></td>
                    <td><%= packaging.get(i).getOrderdate() %></td>
                    <td><%= packaging.get(i).getStatus() %></td>
                    <td><%= packaging.get(i).getUsername() %></td>
                    <td><%= packaging.get(i).getContactno() %></td>
                    <td><Button type="button" onclick="UpdateStatus(<%= packaging.get(i).getOrderid() %>)">Update</Button></td>
                    <td><Button type="button" onclick="window.location.href='CheckOrderDetails.jsp?id=<%= packaging.get(i).getOrderid() %>;">View</Button></td>
                    <%
                    }
                    %>
                </tr>
                <% } else { %>
                <tr><td>No record found.</td></tr>
                
                <% if (shipping != null) { %>
                <tr id="shipping">
                    <%
                    for (int i = 0; i < shipping.size(); i++)
                    {
                    %>
                    <td><%= shipping.get(i).getOrderid() %></td>
                    <td><%= shipping.get(i).getOrderdate() %></td>
                    <td><%= shipping.get(i).getStatus() %></td>
                    <td><%= shipping.get(i).getUsername() %></td>
                    <td><%= shipping.get(i).getContactno() %></td>
                    <td><Button type="button" onclick="UpdateStatus(<%= shipping.get(i).getOrderid() %>)">Update</Button></td>
                    <td><Button type="button" onclick="window.location.href='CheckOrderDetails.jsp?id=<%= shipping.get(i).getOrderid() %>;">View</Button></td>
                    <%
                    }
                    %>
                </tr>
                <% } else { %>
                <tr><td>No record found.</td></tr>
                
                <% if (delivery != null) { %>
                <tr id="delivery">
                    <%
                    for (int i = 0; i < delivery.size(); i++)
                    {
                    %>
                    <td><%= delivery.get(i).getOrderid() %></td>
                    <td><%= delivery.get(i).getOrderdate() %></td>
                    <td><%= delivery.get(i).getStatus() %></td>
                    <td><%= delivery.get(i).getUsername() %></td>
                    <td><%= delivery.get(i).getContactno() %></td>
                    <td><Button type="button" onclick="updateStatus(<%= delivery.get(i).getOrderid() %>)">Update</Button></td>
                    <td><Button type="button" onclick="window.location.href='CheckOrderDetails.jsp?id=<%= delivery.get(i).getOrderid() %>;">View</Button></td>
                    <%
                    }
                    %>
                </tr>
                <% } else { %>
                <tr><td>No record found.</td></tr>
            </table>
        </div>
        <!--end of content-->
    </body>
</html>
