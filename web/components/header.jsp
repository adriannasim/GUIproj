<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports--%>
<%@ include file="../css/bootstrapStyles.jsp" %>
<%@page import="java.util.List"%> 
        <!--Start of header-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="Home.jsp">
    <img src="img/logo/art_logo_white.png" class="ml-4" width="95px" height="35px" alt="BongBongArtGallery">
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item nav-item-pd">
        <a class="nav-link" href="Home.jsp">Home</a>
      </li>
      <li class="nav-item nav-item-pd">
        <a class="nav-link" href="#">About</a>
      </li>
      <li class="nav-item nav-item-pd">
        <a class="nav-link" href="Cart.jsp">Cart</a>
      </li>
    </ul>
      <form class="form-inline my-2 my-lg-0" id="searchBar" method="Get" action="SearchBar">
          <div class="row justify-content-center">
              <div class="col-8">
                  <input class="form-control mr-sm-2" type="search" id="search-input-dropdown" name="query" placeholder="Search..." aria-label="Search">
              </div>
              <div class="col-2">
                  <button class="btn btn-outline-info search-btn" type="submit">Search</button>
              </div>
          </div>
      </form>
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link mr-3" href="<%= session.getAttribute("username") == null ? "SignIn.jsp" : "Profile.jsp"%>">
        <%= session.getAttribute("username") == null ? "Sign in/Sign up" : "Profile"%>
        </a>
      </li>
    </ul>
  </div>
</nav>
            <!--Search Bar-->
            <div id="searchBar-dropdown">
                <ul id="searchBar-dropdown-list"></ul>
            </div>
        
        <!--End of header-->
