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
        <style>
            .dropdown-item {
                border: none;
                background-color: white;
            }
        </style>
    </head>
    <body style="background: #ecf0f3;">
        <div class="wrapper">
            <form class="p-3">
                <div class="logo">
                    <img src="img/images/bankImg.jpg" alt="">
                </div>

                <div class="text-center mt-4 name">
                    Online Banking Payment
                </div>

                <div class="dropdown text-center" style="position:relative;left:40px;">
                    <button class="dropbtn" id="btnFPXPayment"
                            role="button" style="width:80%">Bank Selection</button>

                    <br>

                    <div class="form-field">
                        <input type="text" class="bankSelection" id="bank" disabled 
                               style="margin-top:15px;height:35px;width:160%;">
                        <input type="hidden" class="bankSelection" id="selectedBank">
                    </div>


                    <div class="dropdown-content"  id="FPXBankDropdown">
                        <button class="dropdown-item" type="button"  value="Affin Bank">
                            <img src="img/images/affin_bank.png"width="20" height="15">Affin Bank
                        </button>
                        <button class="dropdown-item" type="button" value="Alliance Bank">
                            <img src="img/images/alliance_bank.png"width="20" height="15">Alliance Bank
                        </button>
                        <button class="dropdown-item" type="button" value="Ambank">
                            <img src="img/images/ambank.png"width="20" height="15">Ambank
                        </button>
                        <button class="dropdown-item" type="button" value="Bank Islam">
                            <img src="img/images/bank_islam.png"width="20" height="15">Bank Islam
                        </button>
                        <button class="dropdown-item" type="button" value="Cimb Bank">
                            <img src="img/images/cimb_bank.png"width="20" height="15">Cimb Bank
                        </button>
                        <button class="dropdown-item" type="button" value="Hong Leong Bank">
                            <img src="img/images/hongleong_bank.png"width="20" height="15">Hong Leong Bank
                        </button>
                        <button class="dropdown-item" type="button" value="HSBC Bank">
                            <img src="img/images/hsbc_bank.png"width="20" height="15">HSBC Bank
                        </button>
                        <button class="dropdown-item" type="button" value="Bank Rakyat">
                            <img src="img/images/bank_rakyat.png"width="20" height="15">Bank Rakyat
                        </button>
                        <button class="dropdown-item" type="button" value="Maybank">
                            <img src="img/images/maybank.png"width="20" height="15">Maybank
                        </button>
                        <button class="dropdown-item" type="button" value="OCBC Bank">
                            <img src=img/images/ocbc_bank.png"width="20" height="15">OCBC Bank
                        </button>
                        <button class="dropdown-item" type="button" value="Public Bank">
                            <img src="img/images/public_bank.png"width="20" height="15">Public Bank
                        </button>
                        <button class="dropdown-item" type="button" value="RHB Bank">
                            <img src="img/images/rhb_bank.png"width="20" height="15">RHB Bank
                        </button>
                        <button class="dropdown-item" type="button" value="UOB Bank">
                            <img src="img/images/uob_bank.png"width="20" height="15">UOB Bank
                        </button>
                    </div>
                </div>

                <button type="button" class="btn btn-primary profile-button" id="btnFPXPayment" 
                        style="margin-top:30px;">Proceed</button>
            </form>
        </div>

        <script>
            document.querySelectorAll('.dropdown-item').forEach(function (button) {
                button.addEventListener('click', function () {
                    var bankName = this.value;
                    document.getElementById('bank').value = bankName;
                    document.getElementById('selectedBank').value = bankName;
                });
            });
        </script>
    </body>
    
     <%--footer--%>
    <jsp:include page="components/footer.jsp" />
</html>