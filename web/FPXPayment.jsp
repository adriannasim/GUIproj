<%@page contentType="text/html" pageEncoding="UTF-8"%> <%--tags--%> <%@ taglib
prefix="custom" tagdir="/WEB-INF/tags" %> <%--imports--%> <%--includes--%>

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
    <form action="OrderCreation" method="post">
      <label for="banks">Choose a bank:</label>
      <select name="banks" id="banks">
        <option value="bank1">Bank 1</option>
        <option value="bank2">Bank 2</option>
        <option value="bank3">Bank 3</option>
        <option value="bank4">Bank 4</option>
      </select>
      <button type="submit">Proceed</button>
    </form>
    <!--end of content-->
  </body>
  <%--footer--%>
  <jsp:include page="components/footer.jsp" />
</html>
