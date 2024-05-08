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
        <a class="nav-link" href="ProductPage.jsp">Products</a>
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
        <a class="nav-link mr-3 mt-2" href="<%= session.getAttribute("username") == null ? "SignIn.jsp" : "CustomerProfile.jsp"%>">
        <%= session.getAttribute("username") == null ? "Sign in / Sign up" : "Profile"%>
        </a>
        
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle mr-3" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <img src="img/navbar/user-icon.png" alt="User" width="40px" height="40px"/>
        </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="CustomerProfile.jsp">Profile</a>
          <a class="dropdown-item" href="CustEditProfile.jsp">Edit Personal Details</a>
          <a class="dropdown-item" href="CustAddressBook.jsp">Shipping Address</a>
          <a class="dropdown-item" href="CustPaymentCard.jsp">Payment Details</a>
          <a class="dropdown-item" href="CustChangePassword.jsp">Change Password</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#"><i class="fa fa-power-off">&nbsp;&nbsp;&nbsp;</i>Logout</a>
        </div>
      </li>
    </ul>
  </div>
</nav>
            <!--Search Bar-->
            <div id="searchBar-dropdown">
                <ul id="searchBar-dropdown-list"></ul>
            </div>
        
        <!--End of header-->
