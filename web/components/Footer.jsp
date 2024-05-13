<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String companyName = getServletContext().getInitParameter("companyName");
    String companyEmail = getServletContext().getInitParameter("companyEmail");
    String companyCopyrights = getServletContext().getInitParameter("companyCopyrights");
%>
    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footer</title>
    </head>
    <body>
        <!-- Start Footer Section -->
        <footer class="footer-section">
            <div class="container relative">
                <div class="row g-5 mb-5">
                    <div class="col-lg-4">
                        <div class="mb-4 footer-logo-wrap"><a href="#" class="footer-logo">Bong Bong<span>.</span></a></div>
                        <p class="mb-4">From humble beginnings to our current status as a cornerstone of the art community, we've remained dedicated to curating experiences that resonate. Our arts unfold our gallery's story in vivid detail.</p>

                        <ul class="list-unstyled custom-social">
                            <li><a href="#"><span class="fa fa-brands fa-facebook-f"></span></a></li>
                            <li><a href="#"><span class="fa fa-brands fa-twitter"></span></a></li>
                            <li><a href="#"><span class="fa fa-brands fa-instagram"></span></a></li>
                            <li><a href="#"><span class="fa fa-brands fa-linkedin"></span></a></li>
                        </ul>
                    </div>

                    <div class="col-lg-8">
                        <div class="row links-wrap">
                            <div class="col-1"></div>
                            <div class="col-6 col-sm-6 col-md-3">
                                <h4 class="mb-4">Contact Info</h4>
                                <p class="mt-4">Address: 73, Lebuh Campbell, George Town, 10100 GeorgeTown, Penang</p>
                                <p class="mt-4">Email: <a href="mailto:<%= companyEmail%>"><%= companyEmail%></a></p>
                                <p class="mt-4">Phone: <a href="tel:+6012-3456789">+6012-3456789</a></p>
                            </div>
                            <div class="col-2"></div>
                            <div class="col-12 col-sm-6 col-md-3">
                                <h4 class="mb-4">Map Directions</h4>
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d992.9995668143101!2d100.33414630961705!3d5.417230851844011!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x304ac3911f3128d9%3A0xec5a80ae0f691dec!2s73%2C%20Lebuh%20Campbell%2C%20George%20Town%2C%2010100%20George%20Town%2C%20Pulau%20Pinang!5e0!3m2!1sen!2smy!4v1715110229601!5m2!1sen!2smy" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="border-top copyright">
                    <div class="row pt-4">
                        <div class="col-lg-6">
                            <!-- <p class="mb-2 text-center text-lg-start">Copyright &copy;<script>document.write(new Date().getFullYear());</script>. All Rights Reserved. &mdash; Designed with love by <a href="https://untree.co">Untree.co</a> Distributed By <a hreff="https://themewagon.com">ThemeWagon</a>  -->
                            <!-- License information: https://untree.co/license/  </p> -->
                       
                            <p class="mb-2 text-center text-lg-start">
                                <%= companyCopyrights%> <%= companyName%>
                            </p>
                        </div>

                        <div class="col-lg-6 text-center text-lg-end">
                            <ul class="list-unstyled d-inline-flex ms-auto">
                                <li class="me-4"><a href="#">Terms &amp; Conditions</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                            </ul>
                        </div>

                    </div>
                </div>

            </div>
        </footer>
        <!-- End Footer Section -->	
    </body>
</html>
