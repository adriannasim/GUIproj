<%-- This file is a guideline for all individual jsp files --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports-->%

<%--includes--%>
<jsp:include page="components/header.jsp" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <script src="js/AddProducts.js"></script>
        <title>Add Products</title>

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
            input[type="file"],
            textarea {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            #add-image,
            #add-keyword,
            input[type="submit"] {
                display: block;
                width: 100%;
                padding: 10px;
                border: none;
                background-color: #000; 
                color: white;
                border-radius: 5px;
                cursor: pointer;
            }

            #add-image:hover,
            #add-keyword:hover {
                background-color: #000; 
            }

            input[type="submit"]:hover {
                background-color: #800080; 
            }

            #image-col,
            #keyword-col {
                margin-bottom: 10px;
            }

            #images,
            #keywords {
                margin-bottom: 20px;
            }
</style>

        
    </head>
    
    <body class="text-center">
        <%--header--%>
        <jsp:include page="components/adminheader.jsp" />
    
        <!--start of content-->
        <div class="cont">
        <h1>Add Products Page</h1>
        <form action="AddProducts" method="post" enctype="multipart/form-data">
            <label>Product ID:</label>
            <input type="text" name="prodid"><br/>
            <label>Product Name:</label>
            <input type="text" name="prodname"><br/>
            <label>Description:</label>
            <textarea name="proddesc"></textarea><br/>
            <label>Price:</label>
            <input type="text" name="prodprice"><br/>
            <label>Quantity Available:</label>
            <input type="text" name="qtyavailable"><br/>
            <div id="images">
                <label>Product Image:</label>
                <button type="button" id="add-image">Add Images +</button>
                <div id="image-col">
                    <input type="file" name="prodimg" accept="image/*">
                </div>
            </div>
            <div id="keywords">
                <label>Product Keywords:</label>
                <button type="button" id="add-keyword">Add Keywords +</button>
                <div id="keyword-col">
                    <input type="text" name="prodkeyword">
                </div>
            </div>
            <input type="submit" value="Add Product">
        </form>
        </div>
        <!--end of content-->
    </body>
    
    <jsp:include page="components/footer.jsp" />
</html>
