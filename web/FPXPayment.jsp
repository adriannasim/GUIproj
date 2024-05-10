<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="components/header.jsp" />

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width-device-width,initial-scale=1.0">
    
    <title>Online Banking</title>
    
    <style>
   
    body {
        background-image: url('img/images/background1.png');
        background-size: cover;
        background-position: center;
        font-family: Arial, sans-serif;
    }

    .cont {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
        background-color: rgba(255, 255, 255, 0.8);
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .title {
        text-align: center;
    }

    .bank-selection {
        margin-top: 20px;
        overflow: hidden;
    }

    .bank-selection label {
        width: 50%; 
        float: left; 
        box-sizing: border-box;
    }

    .bank-selection img {
        vertical-align: middle;
        margin-right: 5px;
        width: 100px; 
    }

    #proceed {
        display: block;
        margin: 20px auto;
        padding: 10px 20px;
        border: none;
        background-color: #800080;
        color: white;
        border-radius: 5px;
        cursor: pointer;
    }

    #proceed:hover {
        background-color: #6a006a; 
    }


</style>

    
</head>
<body>
    <div class="container">
        <form action="OrderCreation" method="post">
            <h1 class="title">Online Banking Payment</h1>
            <div class="bank-selection">
                <label>
                    <input type="radio" name="bank" value="Affin Bank">
                    <img src="img/images/affin_bank.png" width="20" height="15">Affin Bank
                </label>
                <label>
                    <input type="radio" name="bank" value="Alliance Bank">
                    <img src="img/images/alliance_bank.png" width="20" height="15">Alliance Bank
                </label>
                <label>
                    <input type="radio" name="bank" value="Ambank">
                    <img src="img/images/ambank.png"width="20" height="15">Ambank
                </label>
                <label>
                    <input type="radio" name="bank" value="Bank Islam">
                    <img src="img/images/bank_islam.png"width="20" height="15">Bank Islam
                </label>
                <label>
                    <input type="radio" name="bank" value="Bank Rakyat">
                    <img src="img/images/bank_rakyat.png"width="20" height="15">Bank Rakyat
                </label>
                <label>
                    <input type="radio" name="bank" value="Cimb Bank">
                    <img src="img/images/cimb_bank.png"width="20" height="15">Cimb Bank
                </label>
                <label>
                    <input type="radio" name="bank" value="Hong Leong Bank">
                    <img src="img/images/hongleong_bank.png"width="20" height="15">Hong Leong Bank
                </label>
                <label>
                    <input type="radio" name="bank" value="HSBC Bank">
                    <img src="img/images/hsbc_bank.png"width="20" height="15">HSBC Bank
                </label>
                <label>
                    <input type="radio" name="bank" value="Maybank">
                    <img src="img/images/maybank.png"width="20" height="15">Maybank
                </label>
                <label>
                    <input type="radio" name="bank" value="OCBC Bank">
                    <img src="img/images/ocbc_bank.png"width="20" height="15">OCBC Bank
                </label>
                <label>
                    <input type="radio" name="bank" value="Public Bank">
                    <img src="img/images/public_bank.png"width="20" height="15">Public Bank
                </label>
                <label>
                    <input type="radio" name="bank" value="RHB Bank">
                    <img src="img/images/rhb_bank.png"width="20" height="15">RHB Bank
                </label>
                <label>
                    <input type="radio" name="bank" value="UOB Bank">
                    <img src="img/images/uob_bank.png"width="20" height="15">UOB Bank
                </label>
                    
            </div>
            <button type="submit" id="proceed">Proceed</button>
            </div>
        </form>
    </div>
</body>
  <%-- footer --%>
        <jsp:include page="components/footer.jsp" />
</html>
