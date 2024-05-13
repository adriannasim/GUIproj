<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--imports--%>
<%@page import="jpaEntity.Customer,java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--includes--%>
<jsp:include page="/ManageAccounts"/>
<jsp:include page="/RetrieveAccounts"/>

<%
//Get the result from servlet
    if (session.getAttribute("cust")!=null){
    Customer cust = (Customer) session.getAttribute("cust");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Customers</title>
        <!-- Include commonFiles.tag -->
    <custom:commonFilesAdm/>
</head>

<body class="text-center">
    <!--header-->
    <jsp:include page="components/adminheader.jsp" />

    <h1>Edit Employee Info</h1>
    <form action="ManageAccounts" method="post">
        <label>Customer Username:</label>
        <input type="text" name="custusername" values="<%= cust.getCustomerPK().getUsername()%>" disabled /><br/>

        <label>Customer Email:</label>
        <input type="email" name="custid" values="<%= cust.getCustomerPK().getEmail()%>" disabled /><br/>          

        <label>Customer First Name:</label>
        <input type="text" name="custfirst" values="<%= cust.getFirstname()%>"/><br/>

        <label>Customer Last Name:</label>
        <input type="text" name="custlast" values="<%= cust.getLastname()%>"/><br/>

        <label>Customer Contact No.</label>
        <input type="tel" name="custcontact" values="<%= cust.getContactno()%>"/><br/>

        <label>Customer Date of Birth</label>
        <input type="date" name="custdob" values="<%= cust.getDateofbirth()%>"/><br/>

        <label>Customer Gender:</label>
        <input type="radio" id="male" name="gender" value="M"
               <%
                   if (cust.getGender().equals('M')) {
               %> checked
               <%
                   }
               %>
               />
        <label for="male">Male</label>
        <input type="radio" id="female" name="gender" value="F"
               <%
                   if (cust.getGender().equals('F')) {
               %> checked
               <%
                   }
               %>
               />
        <label for="female">Female</label>
        <input type="radio" id="others" name="gender" value="O"
               <%
                   if (cust.getGender().equals('O')) {
               %> checked
               <%
                   }
               %>
               />
        <label for="others">Others</label>
        <br/>

        <!--Display address-->
        <label>Address:</label>
        <input type="text" name="custadd" values="<%= cust.getAddress()%>"         
               <br/>

        <label>City:</label>
        <input type="text" name="custcity" values="<%= cust.getCity()%>"         
               <br/>

        <label>State:</label>
        <input type="text" name="custstate" values="<%= cust.getState()%>"         
               <br/>

        <label>Postal Code:</label>
        <input type="text" name="custpost" values="<%= cust.getPostalcode()%>"         
               <br/>

        <label>Country:</label>
        <input type="text" name="custcountry" values="<%= cust.getCountry()%>"         
               <br/>

        <input type="submit" id="save" value="Save" />
        <button type="button" id="back" onclick="window.location.href = 'EditCustomerMenu.jsp';">Back</button>
    </form>
</body>
</html>