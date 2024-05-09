//CHECK IF PASSWORDS MATCH
//Adding event listeners to the password fields
document.getElementById("emppsw").addEventListener("keyup", validatePassword);
document.getElementById("emppswcon").addEventListener("keyup", validatePassword);

function validatePassword() 
{
    var password = document.getElementById("emppsw").value;
    var confirmPassword = document.getElementById("emppswcon").value;

    if (password !== confirmPassword) 
    {
        document.getElementById("chkPsw").html = "<p style='color: red'>Passwords do not match!</p>";    
        document.getElementById("submit").disabled = true;
    }
    else 
    {
        document.getElementById("chkPsw").html = "<p style='color: green'>Passwords match.</p>";
        document.getElementById("submit").disabled = false;
    }
}

//CHECK FOR EXISITING ID
//Adding event listener to the id field
document.getElementById("empid").addEventListener("keyup", validateId);
function validateId()
{
    var empId = document.getElementById("empid").value;
    
    //Send AJAX request to servlet
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'CheckAccountInput?empid=' + encodeURIComponent(empId), true);
    xhr.onload = function()
    {
        if (xhr.status === 200)
        {
            if (xhr.responseText.equals("ID Exists"))
            {
                document.getElementById("chkId").html = "<p style='color: red'>ID already exists!</p>";
                document.getElementById("submit").disabled = true;
            }
            else
            {
                document.getElementById("chkId").html = "<p style='color: green'>Valid ID</p>";
                document.getElementById("submit").disabled = false;
            }
        }
        else
        {
            console.error('Error occurred while checking ID.');
        }
    };
    xhr.send();
}

//CHECK FOR EXISITING USERNAME
//Adding event listener to the username field
document.getElementById("empusername").addEventListener("keyup", validateUsername);
function validateUsername()
{
   var empUsername = document.getElementById("empusername").value;
    
    //Send AJAX request to servlet
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'CheckAccountInput?empUsername=' + encodeURIComponent(empUsername), true);
    xhr.onload = function()
    {
        if (xhr.status === 200)
        {
            if (xhr.responseText.equals("Username Exists"))
            {
                document.getElementById("chkUsername").html = "<p style='color: red'>Username already exists!</p>";
                document.getElementById("submit").disabled = true;
            }
            else
            {
                document.getElementById("chkUsername").html = "<p style='color: green'>Valid Username</p>";
                document.getElementById("submit").disabled = false;
            }
        }
        else
        {
            console.error('Error occurred while checking Username.');
        }
    };
    xhr.send();
}