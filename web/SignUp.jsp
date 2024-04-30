<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
    </head>
    <body>
        <h1>Sign Up</h1>
        <form action="signup" method="post">
            <label>Username</label>
            <input type="text"/><br/>

            <label>Full Name</label>
            <input type="text"/><br/>
            
            <label>Gender</label>
            <input type="radio" id="male" name="gender" value="male">
            <label for="male">Male</label>
            <input type="radio" id="female" name="gender" value="female">
            <label for="female">Female</label>
            <input type="radio" id="undefined" name="gender" value="undefined">
            <label for="undefined">Prefer not to say</label>
            <br/>

            <label>Email</label>
            <input type="email"/><br/>

            <label>Contact No</label>
            <input type="text"/><br/>

            <label>Password</label>
            <input type="text"/><br/>

            <label>Address</label>
            <input type="text"/><br/>

            <label>Postcode</label>
            <input type="text"/><br/>

            <label>Country</label>
            <input type="text"/><br/>

            <button type="submit">Sign Up</button>
        </form>
    </body>
</html>
