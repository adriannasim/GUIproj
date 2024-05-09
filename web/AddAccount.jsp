<%-- This file is a guideline for all individual jsp files --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports-->%

<%--includes--%>
<jsp:include page="/AddAccount"/>
      
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <script src="js/CheckPassword.js"></script>
        <title>Add Employee Account</title>

        <!-- Include commonFiles.tag -->
        <custom:commonFilesAdm />
    </head>
    
    <body class="text-center">
        <%--header--%>
        <jsp:include page="components/adminheader.jsp" />
    
        <!--start of content-->
        <h1>Add Employee Account</h1>
        <form action="AddAccount" method="post">
            <label>Role:</label>
            <input type="radio" id="admin" name="role" value="admin"/>
            <label for="admin">Admin</label>
            <input type="radio" id="staff" name="role" value="staff"/>
            <label for="staff">Staff</label>
            <br/>
            
            <label>Employee ID:</label>
            <input type="text" name="empid" id="empid" onkeyup="validateId()"/><br/>
            <div id="chkId"></div><br/>
            
            <label>Employee Username:</label>
            <input type="text" name="empusername" id="empusername" onkeyup="validateUsername()"/><br/>
            <div id="chkUsername"></div><br/>
            
            <label>Employee Password:</label>
            <input type="password" name="emppsw" id="emppsw" onkeyup="validatePassword()"/><br/>
            <label>Confirm Password:</label>
            <input type="password" name="emppswcon" id="emppswcon" onkeyup="validatePassword()"/><br/>
            <div id="chkPsw"></div><br/>
            
            <label>Employee Email:</label>
            <input type="email" name="empemail"/><br/>
            
            <label>Employee First Name:</label>
            <input type="text" name="empfirst"/><br/>
            
            <label>Employee Last Name:</label>
            <input type="text" name="emplast"/><br/>
            
            <label>Employee Gender:</label>
            <input type="radio" id="male" name="gender" value="M"/>
            <label for="male">Male</label>
            <input type="radio" id="female" name="gender" value="F"/>
            <label for="female">Female</label>
            <input type="radio" id="others" name="gender" value="O"/>
            <label for="others">Others</label>
            <br/>
            
            <label>Employee Contact No.</label>
            <input type="tel" name="empcontact"/><br/>
            
            <input type="submit" id="submit" value="Add Product">
        </form>
        <!--end of content-->
    </body>
</html>
