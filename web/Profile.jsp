<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- tags --%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <%-- Include commonFiles.tag --%>
        <custom:commonFiles />
    </head>
    <body>
        <%-- header --%>
        <jsp:include page="components/header.jsp" />

        <form id="logoutForm" action="Logout" method="post">
            <button type="submit">Logout</button>
        </form>

        <%-- footer --%>
        <jsp:include page="components/footer.jsp" />
    </body>
</html>
