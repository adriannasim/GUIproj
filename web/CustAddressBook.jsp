
<%-- This file is a guideline for all individual jsp files --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports-->%

<%--includes--%>
      
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Profile Setting</title>=
        <!-- Core theme CSS (includes Bootstrap) for Customer Profile ONLY -->
        <link href="css/profilestyles.css" rel="stylesheet" />

        <!-- Include commonFiles.tag -->
        <custom:commonFiles />

    </head>
    
    <body>
        <header class="text-center">
        <%--header--%>
        <jsp:include page="components/header.jsp" />
        </header>
    
        <!--start of content-->
        <div class="d-flex" id="wrapper">
            
            
            <!-- Sidebar-->
            <div class="border-end border-right bg-white text-center" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light"> 
                    <a class="sidebar-heading-a" href="CustomerProfile.jsp">&Lt; Back to Profile</a> 
                </div>
                <div class="list-group list-group-flush" id="sidebar-list-group">
                    <a class="list-group-item list-group-item-light p-3 list-group-a" 
                       href="CustEditProfile.jsp">Edit Profile</a>
                    <a class="list-group-item list-group-item-light p-3 list-group-a" 
                       href="CustAddressBook.jsp">Address book</a>
                    <a class="list-group-item list-group-item-light p-3 list-group-a" 
                       href="CustChangePassword.jsp">Change my password</a>
                    <a class="list-group-item list-group-item-light p-3 list-group-a" 
                       href="CustPaymentCard.jsp">My credit/debit cards</a>
                </div>
            </div>
            
            
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Page content-->
                
                <!-- Edit Address -->
                <div class="col-md-5" style="padding-left:180px;width:70%;">
                    <div class="p-3"style="padding-top:10px;">
                        
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">My Current Address</h4>
                        </div>
                        
                        <div class="row mt-2">
                            
                            <div class="col-md-12"><label class="labels">Address Line 1</label>
                                <input type="text" class="form-control" placeholder="address" value="">
                            </div>
                            
                            <div class="col-md-12"><label class="labels">Address Line 2</label>
                                <input type="text" class="form-control" placeholder="address" value="">
                            </div>
                            
                            <div class="col-md-12"><label class="labels">Postcode</label>
                                <input type="text" class="form-control" placeholder="postcode" value="">
                            </div>
                            
                            <div class="col-md-12"><label class="labels">City</label>
                                <input type="text" class="form-control" placeholder="city" value="">
                            </div>
                            
                        </div>
                        <div class="row mt-3">
                            
                            <div class="col-md-6"><label class="labels">Country</label>
                                <input type="text" class="form-control" placeholder="country" value="">
                            </div>
                            
                            <div class="col-md-6"><label class="labels">State/Region</label>
                                <input type="text" class="form-control" value="" placeholder="state">
                            </div>
                            
                        </div>
                        
                        <div class="mt-5 text-center">
                            <button class="btn btn-primary profile-button" type="button">Save Address</button>
                        </div>
                    </div>
                </div>
                <!-- Edit Address -->
                
            </div>
            <!-- Page content wrapper-->
            
        </div>
        <!--end of content-->
    </body>
    <%--footer--%>
    <jsp:include page="components/footer.jsp" />
</html>