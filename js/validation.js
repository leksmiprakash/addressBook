

function validateform(){  
    var name= document.forms["login"]["userName"].value;
    var password= document.forms["login"]["password"].value;
    if (name==null || name==""){  
      alert("UserName can't be blank");  
      return false;  
    }
    else if(password==null || password=="" || password.length<6){  
      alert("Password cannot be null and must be at least 6 characters long.");  
      return false;  
    }  
}  
function validateSignup(){  
    var name= document.forms["signup"]["userName"].value;
    var password= document.forms["signup"]["password"].value;
    var cPassword= document.forms["signup"]["cpassword"].value;
    if (name==null || name==""){  
        alert("UserName can't be blank");  
        return false;  
    }
    else if(password==null || password=="" || password.length<6){  
        alert("Password cannot be null and must be at least 6 characters long.");  
        return false;  
    }  
    else if(password!= cPassword){  
        alert("Password and confirm password doesnt match.");  
        return false;  
    }  
}  
