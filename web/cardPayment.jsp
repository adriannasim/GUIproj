<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE-edge">
        <meta name="viewport" content="width-device-width,initial-scale=1.0">
        <title>Payment Details</title>
        <link rel="stylesheet" href="payment.css">
    </head>
    <body>
        
        <div class="container">
            <form action="">
                <h3 class="title">Card Details</h3><br>
                
                        <div class="input-box">
                            <p>Cardholder's Name:</p>
                            <input type="text"
                                   placeholder="Tan Lily">
                        </div>
                        
                        <div class="input-box">
                            <span>Card Number :</span>
                            <input type="number"
                                   placeholder="xxxx xxxx xxxx xxxx">
                        </div>
                        
                        <div class="input-box">
                            <span>Expiration Date :</span>
                            <input type="number"
                                   placeholder="xx/xx">
                        </div>
                        
                        <div class="input-box">
                            <span>CVV</span>
                            <input type="number"
                                   placeholder="xxx">
                        </div>
                    
  
                <button type="submit" class="btn">Submit</button>
                </form>
            </div>
        

    </body>
</html>
