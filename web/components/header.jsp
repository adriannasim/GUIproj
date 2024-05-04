<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports--%>
<%@page import="java.util.List"%> 

<%--includes--%>
<jsp:include page="/SearchBar"/>

        <% 
        List<String> matches = null;
        if (session.getAttribute("matches") != null)
        { 
            matches = (List<String>) session.getAttribute("matches"); 
        } 
        %>

        <!--Start of header-->
        <h1>Header</h1>
        <!--Search Bar-->
        <form id="searchBarForm" method="Get" action="SearchBar">
            <input type="search" id="search-input-dropdown" name="query" class="form-control" placeholder="Search..." aria-label="Search" />
        </form>
        <%
        if (matches != null)
        {
        %>
        <ul class="dropdown-menu dropdown-menu-left" aria-labelledby="navbarDropdownMenuLink">
            <%
            for (int i = 0; i < matches.size(); i++)
            {
            %>
            <li><a class="dropdown-item" href="#"><%= matches.get(i) %></a></li>
            <%
            }
            %>
        </ul>
        <%
        }
        %>
        <!-- Cart Button -->
        <a href="Cart.jsp"><button>Cart</button></a>
        <!--End of header-->
