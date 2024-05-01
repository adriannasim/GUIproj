<!-- This file is a guideline for all individual jsp files -->
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!--tags-->
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<!--imports-->

<!--includes-->
      
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Template</title>

        <!-- Include commonFiles.tag -->
        <custom:commonFiles />
        
        <!-- script to load servlet -->

    </head>
    
    <body class="text-center">
        <!--header-->
        <jsp:include page="header.jsp" />
    
        <!--start of content-->

        <!--end of content-->
        
        <!--footer-->
        <jsp:include page="footer.jsp" />
    </body>
</html>
