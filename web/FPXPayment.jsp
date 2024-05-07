<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports--%>

<%--includes--%>
      
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>FPX Payment</title>

        <!-- Include commonFiles.tag -->
        <custom:commonFiles />

    </head>
    
    <body class="text-center">
        <%--header--%>
        <jsp:include page="components/header.jsp" />
    
        <!--start of content-->
        <h3>FPX Payment</h3>

        <!--end of content-->
    </body>
    <%--footer--%>
    <jsp:include page="components/footer.jsp" />
</html>
