<%-- This file is a guideline for all individual jsp files --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports-->%

<%--includes--%>
<jsp:include page="/AddAccount"/>
<jsp:include page="components/header.jsp" />
      
<!DOCTYPE html>

<html>
    <head>
        <jsp:include page="components/adminheader.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <script src="js/CheckPassword.js"></script>
        <title>Add Employee Account</title>

        <!-- Include commonFiles.tag -->
        <custom:commonFilesAdm />
        
        <style>
        body {
            background-image: url('img/images/background1.png');
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
        }

        .text-center {
            text-align: center;
        }

        .cont {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="tel"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="radio"] {
            display: inline; 
            margin-right: 5px;
        }

        #submit {
            display: block;
            width: 100%;
            padding: 10px;
            border: none;
            background-color: #800080; 
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        #submit:hover {
            background-color: #6a006a;
        }
    </style>

    </head>
    
    <body class="text-center">
        
        <!--start of content-->
        <h1>Add Employee Account</h1>
        <div class="cont">
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
        </div>
        <!--end of content-->
    </body>
    <jsp:include page="admin-components/footer.jsp" />
</html>
