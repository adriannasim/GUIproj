<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--imports--%>
<%@page import="jpaEntity.Employee,java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--includes--%>
<jsp:include page="/ManageAccounts"/>
<jsp:include page="/RetrieveAccounts"/>

<% 
//Get the result from servlet
Employee emp = (Employee) request.getAttribute("emp");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/CheckAccountInput.js"></script>
        <title>Edit Products Menu</title>
        <!-- Include commonFiles.tag -->
        <custom:commonFilesAdm/>
    </head>

    <body class="text-center">
        <!--header-->
        <jsp:include page="components/adminheader.jsp" />
        
        <h1>Edit Employee Info</h1>
        <form action="ManageAccounts" method="post">
            <label>Employee Username:</label>
            <input type="text" name="empusername" values="<%= emp.getUsername() %>" disabled/><br/>
            
            <label>Employee ID:</label>
            <input type="text" name="empid" values="<%= emp.getEmpid() %>"/><br/>
            
            <label>Employee Email:</label>
            <input type="email" name="empemail" values="<%= emp.getEmail()%>"/><br/>
            
            <label>Employee First Name:</label>
            <input type="text" name="empfirst" values="<%= emp.getFirstname()%>"/><br/>
            
            <label>Employee Last Name:</label>
            <input type="text" name="emplast" values="<%= emp.getLastname()%>"/><br/>
            
            <label>Employee Contact No.</label>
            <input type="tel" name="empcontact" values="<%= emp.getContactno()%>"/><br/>
            
            <label>Employee Gender:</label>
            <input type="radio" id="male" name="gender" value="M"
                        <% 
                        if (emp.getGender().equals('M'))
                        {
                        %> checked
                        <%
                        }
                        %>
                   />
            <label for="male">Male</label>
            <input type="radio" id="female" name="gender" value="F"
                        <% 
                        if (emp.getGender().equals('F'))
                        {
                        %> checked
                        <%
                        }
                        %>
                    />
            <label for="female">Female</label>
            <input type="radio" id="others" name="gender" value="O"
                        <% 
                        if (emp.getGender().equals('O'))
                        {
                        %> checked
                        <%
                        }
                        %>
                   />
            <label for="others">Others</label>
            <br/>
            
            <label>Role:</label>
            <p><%= emp.getEmprole()%></p>
            <button type="button" id="chgRole">
                Change Role to 
                <%
                if (emp.getEmprole().equals("admin"))
                {
                %>
                    Staff
                <%
                }
                else
                {
                %>
                    Admin
                <%
                }
                %>
            </button>
            <br/>
            
            <button type="button" id="chgPsw" onclick="window.location.href = 'ResetPasswordAdm.jsp?id=<%= emp.getUsername()%>';>Reset Password</button><br/>
            
            <input type="submit" id="save" value="Save" />
            <button type="button" id="back" onclick="window.location.href = 'ManageAccountsMenu.jsp';">Back</button>
        </form>
    </body>
</html>