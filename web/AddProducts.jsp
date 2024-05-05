<%-- This file is a guideline for all individual jsp files --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports-->%

<%--includes--%>
      
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <script src="js/ProductKeywords.js"></script>
        <title>Add Products</title>

        <!-- Include commonFiles.tag -->
        <custom:commonFilesAdm />
    </head>
    
    <body class="text-center">
        <%--header--%>
        <jsp:include page="components/adminheader.jsp" />
    
        <!--start of content-->
        <h1>Add Products Page</h1>
        <form action="addProduct" method="post" enctype="multipart/form-data">
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
            <label>Product Image:</label>
            <input type="file" name="prodimg"><br/>
            <div id="keywords">
                <label>Product Keywords:</label>
                <button type="button" id="add-keyword">Add Keywords +</button>
                <div id="keyword-col">
                    <input type="text" name="prodkeyword">
                </div>
            </div>
            <input type="submit" value="Add Product">
        </form>

        <!--end of content-->
    </body>
</html>
