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
        </style>
    </head>
    <body>
    </body>
</html>
