<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports--%>
<%@page import="java.util.List"%> 
<div class="d-flex flex-row text-center justify-content-between">
    <!--Start of header-->
    <div><a href="Home.jsp"><button>Home</button></div>
    <!--Search Bar-->
    <div>
        <form id="searchBar" method="Get" action="SearchBar">
            <input type="search" id="search-input-dropdown" name="query" class="form-control" placeholder="Search..." aria-label="Search" />  
        </form>

        <div id="searchBar-dropdown">
            <ul id="searchBar-dropdown-list"></ul>
        </div>
    </div>

    <!-- Cart Button -->
    <div>
        <a href="Cart.jsp"><button>Cart</button></a>
    </div>

    <!-- User Profile Button -->
    <div>
        <a href="<%= session.getAttribute("username") == null ? "SignIn.jsp" : "Profile.jsp"%>">
            <button><%= session.getAttribute("username") == null ? "Sign in/Sign up" : "Profile"%></button>
        </a>
    </div>
    <!--End of header-->
</div>