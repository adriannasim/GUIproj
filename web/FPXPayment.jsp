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
            background-image: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)),url('img/images/background1.png'); 
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
        
            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh; 
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover; 
                padding: 30px;
            }


            .container form{
                width: 300px;
                padding: 100px;
                background: #fff;
                border-radius: 20px;
            }


            .title {
                text-align: center;
                margin-bottom: 20px;
            }


            .bank-selection {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                margin-bottom: 20px;
            }

            .bank-selection label {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
                cursor: pointer;
                width: calc(50% - 10px);
                font-size: 14px;
            }

            .bank-selection img {
                margin-right: 10px;
                width: 60px;
                height: 15px;
            }

            .container form {
                width: 100%;
                max-width: 400px;
                padding: 20px;
                background: #fff;
                border-radius: 20px;
            }

            .title {
                text-align: center;
                margin-bottom: 20px;
                font-size: 24px; 
            }

            #proceed {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            #proceed:hover {
                background-color: #0056b3;
            }


    </style>
    
</head>
<body>
    <div class="container">
        <form action="">
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
