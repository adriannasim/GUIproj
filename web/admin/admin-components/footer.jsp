<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String companyName = getServletContext().getInitParameter("companyName");
    String companyEmail = getServletContext().getInitParameter("companyEmail");
    String companyCopyrights = getServletContext().getInitParameter("companyCopyrights");
%>
<footer class="footer pt-5">
    <div class="container-fluid">
        <div class="row align-items-center justify-content-lg-between">
            <div class="col-lg-12 mb-lg-0 mb-4">
                <div
                    class="copyright text-center text-sm text-muted text-lg-start d-flex flex-wrap w-100"
                    >
                    <span class="flex-grow-1"><%= companyName%></span>
                    <span class="flex-grow-1"
                          ><a href="<%= companyEmail%>"><%= companyEmail%></a></span
                    >
                    <span class=""><%= companyCopyrights%></span>
                </div>
            </div>
        </div>
    </div>
</footer>
