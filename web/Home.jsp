<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Product,java.util.ArrayList, model.ProductDAO"%>

<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <h1>Home</h1>
        <a href="SignUp.jsp"><button>Sign in/Sign up</button></a>
        <button>All Artworks</button>
        <h2>Latest Artworks</h2>
        <div>
            <img src="img.png"/>
            Product name<br/>
            Product price
        </div>
    </body>
</html>

