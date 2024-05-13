<%-- 
    Document   : adminLogin
    Created on : 8 May 2024, 12:00:39 pm
    Author     : jiami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="components/header.jsp" />
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width-device-width,initial-scale=1.0">
    <title>Admin Login</title>
    
    <style>
        
        /* adminLogin.css */
body {
    background-image: url('img/images/background1.png');
    background-size: cover;
    background-position: center;
    font-family: Arial, sans-serif;
}

.cont{
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: rgba(255, 255, 255, 0.8);
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.myform {
    text-align: center;
}

.myform h2 {
    margin-bottom: 20px;
}

.image {
    margin-bottom: 20px;
}

.image img {
    width: 150px;
    height: auto;
}

#errorMsg {
    margin-bottom: 20px;
}

form input[type="text"],
form input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

form button[type="submit"] {
    display: block;
    width: 100%;
    padding: 10px;
    border: none;
    background-color: #800080; /* Purple background */
    color: white;
    border-radius: 5px;
    cursor: pointer;
}

form button[type="submit"]:hover {
    background-color: #6a006a; /* Darker purple on hover */
}

        
        </style>
    
</head>
<body id="adminlg">
    <div class="cont">
        <div class="myform">
            <h2>ADMIN LOGIN</h2>
            <div class="image">
                <img src="img/images/admin_logo.png" alt=""/>
            </div>
            <div id="errorMsg">
                <% if ((String) request.getAttribute("errMsg") != null) 
                {
                %>
                <div id="login-errorMsg">
                    <p><%= request.getAttribute("errMsg") %></p>
                <%
                }
                else
                {
                
                }
                %>
            </div>
            <form action="AdminLogin" method="POST">
                <input type="text" name="username" placeholder="Email" />
                <input type="text" name="password" placeholder="Password" />
                <button type="submit">LOGIN</button>
            </form>
        </div>
    </div>
    </div>
</body>
<jsp:include page="admin-components/footer.jsp" />
</html>
