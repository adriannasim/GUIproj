<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="components/header.jsp" />

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width-device-width,initial-scale=1.0">
    <link rel="stylesheet" href="css/FPXPayment.css">
    <title>Online Banking</title>
    
</head>
<body class="FPXPaymentjsp">
    <div class="container FPXPaymentDiv">
        <form action="">
            <h1 class="title">Online Banking Payment</h1>
            <div class="dropdown">
                <button class="dropbtn">Bank Selection:</button>
                
                <div class="dropdown-content">
                    <a href="#">
                        <img src="img/images/affin_bank.png"width="20" height="15">Affin Bank</a>
                    <a href="#">
                        <img src="img/images/alliance_bank.png"width="20" height="15">Alliance Bank</a>
                    <a href="#">
                        <img src="img/images/ambank.png"width="20" height="15">Ambank</a>
                    <a href="#">
                        <img src="img/images/bank_islam.png"width="20" height="15">Bank Islam</a>
                    <a href="#">
                        <img src="img/images/bank_rakyat.png"width="20" height="15">Bank Rakyat</a>
                    <a href="#">
                        <img src="img/images/cimb_bank.png"width="20" height="15">Cimb Bank</a>
                    <a href="#">
                        <img src="img/images/hongleong_bank.png"width="20" height="15">Hong Leong Bank</a>
                    <a href="#">
                        <img src="img/images/hsbc_bank.png"width="20" height="15">HSBC Bank</a>
                    <a href="#">
                        <img src="img/images/maybank.png"width="20" height="15">Maybank</a>
                    <a href="#">
                        <img src=img/images/ocbc_bank.png"width="20" height="15">OCBC Bank</a>
                    <a href="#">
                        <img src="img/images/public_bank.png"width="20" height="15">Public Bank</a>
                    <a href="#">
                        <img src="img/images/rhb_bank.png"width="20" height="15">RHB Bank</a>
                    <a href="#">
                        <img src="img/images/uob_bank.png"width="20" height="15">UOB Bank</a>     
                    
            </div>
            <button type="submit" id="proceed">Proceed</button>
            </div>
        </form>
    </div>
</body>
  <%--footer--%>
  <jsp:include page="components/footer.jsp" />
</html>
