<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--IMPORTANT-->
<!--Use this to include bootstrap in your code-->
<%--<%@ include file="css/bootstrapStyles.jsp" %>--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
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
      <style>
          
          /*Start of Home*/
          :root{
              --bs-black-rgb: 0, 0, 0;
          }
          .masthead {
            position: relative;
            width: 100%;
            height: auto;
            min-height: 35rem;
            padding: 15rem 0;
            margin-top: -16px;
            background: linear-gradient(to bottom, rgba(0, 0, 0, 0.3) 0%, rgba(0, 0, 0, 0.7) 75%, #000 100%), url("../img/home/pic-4.png");
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: scroll;
            background-size: cover;
          }
          .about-section {
            padding-top: 5rem;
            background: linear-gradient(to bottom, #000 0%, rgba(0, 0, 0, 0.9) 75%, rgba(0, 0, 0, 0.8) 100%);
          }
          .about-section p {
            margin-bottom: 5rem;
          }
          .projects-section {
            padding-top: 2rem; 
            padding-bottom: 5rem;
            margin-bottom: -8%;
          }
          .projects-section h2{
              padding: 2rem 0;
          }
          .projects-item{
              padding-bottom: 3rem;
          }
          .projects-section .featured-text {
            padding: 2rem;
          }
          @media (min-width: 992px) {
            .projects-section .featured-text {
              padding: 0 0 0 2rem;
              border-left: 0.5rem solid #64a19d;
            }
          }
          .projects-section .project-text {
            padding: 3rem;
            text-align: center !important;
            font-size: 90%;
          }
          @media (min-width: 992px) {
            .projects-section .project-text {
              padding: 5rem;
            }
          }
          #home-view{
              padding: 10px;
          }
          .img-fluid {
            max-width: 100%;
            height: auto;
          }
          .bg-black {
            --bs-bg-opacity: 1;
            background-color: rgba(var(--bs-black-rgb), var(--bs-bg-opacity)) !important;
          }
          .home-prod{
                width: 300px;
                height: 230px;
                display: inline-block;
                border-radius: 10px;
                padding: 15px;
                box-sizing: border-box;
                transition: transform 0.5s;
            }

            .home-prod:hover{
                transform: translateY(-10px);
            }
            .browse-btn{
                margin-bottom: 5%;
            }
          /*End of Home*/
          body{
              overflow-x: hidden;
          }
          footer.reset-margin{
              margin: 0 !important;
              padding: 0 !important;
          }
          
          /*Start of Header*/
          .search-btn{
              margin-right: 80px;
          }
          .nav-item-pd{
              margin: 0 20px;
          }
          /*End of Header*/
          
          /*Start of Sign In*/
            .si_title{
                text-align: right;
                margin: 8% 20%;
                margin-bottom: 80px;
            }
            .si_item-padding{
                padding-top: 10px;
                margin-left: -10px;
            }
            .si_backlink{
                margin-right: -9%;
                text-decoration: none;
                color:#28a745;
            }
            .si_btn-pd{
                margin-bottom: 10%;
            }
            .si_link{
                margin-top: 20px;
            }
            /*End of Sign In*/
            
            /*Start of Sign Up*/
            .so_title{
                margin: 50px 9%;
            }
            #signup-submit-button{
                margin-left: 70px;
                width: 120px;
            }
            .so_backlink{
                margin-top: -15px;
                margin-right: 47px; 
                text-decoration: none;
                color:#28a745;
            }
            .btn:hover{
                color: white !important;
            }
            /*End of Sign Up*/
            
            /*Start of Footer*/
            .footer{
                width: 100%;
            }
            .footer-img{
                margin-left: -60%;
            }
            .footer a{
                text-decoration: none;
                color: white;
            }
            .footer a:hover{
                color: #28a745;
            }
            .footer-mt{
                margin-top: 4%;
            }
            /*End of Footer*/
            
            /*Start of Sign Up Confirmation*/
            .soc-title{
                text-align: center;
                margin-top: 5%
            }
            .confirmation-box{
                width: 60%;
            }
            #so_confirm-btn{
                margin-top: 15px;
                margin-left: 39%;
            }
            #so_edit-btn{
                margin-top: -67px;
                margin-left: 51%;
            }
            /*End of Sign Up Confirmation*/
            /*Start of Product Page*/
            .prod_title{
                margin: 30px 0;
                margin-bottom: 50px;
                font-weight: bold;
            }
            .main-prod-img{
                width: 30%;
                margin-left: 20%;
            }
            .prod-img{
                width: 250px;
                height: 250px;
            }
            .all-prod-container{
                margin-top: 5%;
            }
            .card{
                height: 420px;
            }
            .main-desc{
                margin:  20% 0;
            }
            /*End of Product Page*/
            /*Start of Single Product Page*/
            .single-prod{
                margin: 5% 0;
                margin-left: 10%;
            } 
            .prod-details{
                text-align: left;
                align-content: center;
            }
            .detail-element{
                padding-bottom: 20px;
            }
            .atc-btn{
                margin-left: 30%;
            }
            .message{
                margin-top: -5px;
            }
            .sprod-rec{
                margin-top: 3%;
                margin-left: 6%;
            }
            .prod-backlink{
                text-align: left;
                margin: 30px 0;
                margin-left: 50px;
            }
            .prod-backlink a{
                color: black;
            }
            .prod-btn:hover{
                color: black !important;
            }
            .sprod-img{
                width: 300px;
                height: 250px;
            }
            /*End of Single Product Page*/
            /*Start of Cart*/
            .cart-title{
                margin: 30px 0;
                font-weight: bold;
            }
            .cart-spacing{
                margin: 13% 0;
            }
            /*End of Cart*/

        </style>
    </head>
    <body>
    </body>
</html>
