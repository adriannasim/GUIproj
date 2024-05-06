<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports--%>
<%@page import="java.util.List"%> 
<div class="d-flex flex-row text-center justify-content-between">
    <!--Start of header-->
    <div><a href="Home.jsp"><button>Home</button></div>
    
    <!--Search Bar-->
    <form id="searchBar" method="Get" action="SearchBar">
        <input type="search" id="search-input-dropdown" name="query" class="form-control" placeholder="Search..." aria-label="Search" />  
    </form>
    <div id="searchBar-dropdown">
        <ul id="searchBar-dropdown-list"></ul>
    </div>

        <!-- Cart Button -->
        <a href="Cart.jsp"><button>Cart</button></a>
        <!--End of header-->
</div>