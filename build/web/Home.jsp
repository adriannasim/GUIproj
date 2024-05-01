<%-- Begin: Page Declaration --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<!--tags-->
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<!--imports-->
<%@page import="entity.Product,java.util.ArrayList, model.ProductDAO"%> 
<%-- End: Page Declaration --%>

<%-- Begin: Access RetrieveProducts Servlet (This servlet will run automatically when the page is loaded) --%>
<!--includes-->
<jsp:include page="/RetrieveProducts"/>
<%-- End: Access RetrieveProducts Servlet --%>

<%-- Begin: Retrieve Product List From Session (prodList) --%>
<%
    ArrayList<Product> sessProdList = new ArrayList<Product>();
    if (session.getAttribute("prodList") != null) {
        sessProdList = (ArrayList<Product>) session.getAttribute("prodList");
    }
%>
<%-- End: Retrieve Product List From Session (prodList) --%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Home Page</title>
        <!-- Include commonFiles.tag -->
        <%--<custom:commonFiles>--%>
            <!-- Begin: Import Bootstrap Libraries -->
            <link
                rel="stylesheet"
                href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
                rel="nofollow"
                integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I"
                crossorigin="anonymous"
                />
            <script
                src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
                crossorigin="anonymous"
            ></script>
            <script
                src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"
                integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/"
                crossorigin="anonymous"
            ></script>
            <!-- End: Import Bootstrap Libraries -->
        </head>

        <body class="text-center">
            <!--header-->
            <%--<jsp:include page="header.jsp" />--%>

            <!-- Begin: Sign In/Up Button -->
            <a href="SignUp.jsp"><button>Sign in/Sign up</button></a>
            <!-- End: Sign In/Up Button -->

            <!-- Begin: Link to All Products Page Button -->
            <a href="ProductPage.jsp?all=t"><button>All Artworks</button></a>
            <!-- End: Link to All Products Page Button -->

            <!-- Begin: Latest Artwork Section (This part will display the 4 recently added artworks) -->
            <h2>Latest Artworks</h2>
            <div class="d-flex margin-auto justify-content-center flex-row align-items-center">
                <%
                    Product product = null;
                    for (int i = 0; i < sessProdList.size(); i++) {
                        product = sessProdList.get(i);
                %>
                <a
                    href="ProductDetail.jsp?id=<%= product.getProdId()%>" style="text-decoration: none"
                    >
                    <div class="p-2">
                        <div>
                            <img
                                src="${pageContext.request.contextPath}<%= product.getProdImg()[0]%>"
                                width="200px"
                                height="auto"
                                />
                        </div>
                        <div><%= product.getProdName()%></div>
                        <div><%= product.getProdPrice()%></div>
                    </div>
                </a>
                <% }%>
            </div>
            <!-- End: Latest Artwork Section -->
            
            <!--footer-->
            <%--<jsp:include page="footer.jsp" />--%>
        </body>
    </html>
