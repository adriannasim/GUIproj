<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports--%>
<%@page import="java.util.List"%> 
        <!--Start of header-->
        <div class="d-flex flex-row text-center justify-content-between">
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

            <!-- User Profile Button -->
            <div>
                <a href="<%= session.getAttribute("username") == null ? "SignIn.jsp" : "Profile.jsp"%>">
                    <button><%= session.getAttribute("username") == null ? "Sign in/Sign up" : "Profile"%></button>
                </a>
            </div>
        </div>
        <!--End of header-->
