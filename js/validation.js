function validnum(a) { 
    if(a < 0 || a > 255) 
    {
        alert("");
        preventDefault();
    }
    
    else 
        return true;
} 
function validateForm() {
    let position = document.forms["form54"]["Field17"].value;
    var text = "";
    if (position == "") {
        text += "<span style='color: red'>Please select position </span>"+ "<br>"; 
        document.forms["form54"]["Field17"].focus();  
        document.getElementById("error").innerHTML = text;
        return false;
    }
    if (document.forms["form54"]["Field19"].value == "") {
        text += "<span style='color: red'>Please select willing to relocate </span>"+ "<br>"; 
        document.forms["form54"]["Field19"].focus();    
        document.getElementById("error").innerHTML = text;
        return false;
    }
    if (document.forms["form54"]["fld_userdob"].value == "") {
        text += "<span style='color: red'>Please select start date </span>"+ "<br>";
        document.forms["form54"]["fld_userdob"].focus();   
        document.getElementById("error").innerHTML = text;
        return false;
    } 
    if (document.forms["form54"]["Field22"].value == "") {
        text += "<span style='color: red'>Please enter firstname </span>"+ "<br>";
        document.forms["form54"]["Field22"].focus();    
        document.getElementById("error").innerHTML = text;
        return false;
    }
    if (document.forms["form54"]["Field23"].value == "") {
        text += "<span style='color: red'>Please enter lastname </span>"+ "<br>"; 
        document.forms["form54"]["Field23"].focus();  
        document.getElementById("error").innerHTML = text;
        return false;
    }
    if (document.forms["form54"]["Field13"].value == "") {
        text += "<span style='color: red'>Please enter email </span>"+ "<br>"; 
        document.forms["form54"]["Field13"].focus();  
        document.getElementById("error").innerHTML = text;
        return false;
    }
        if (document.forms["form54"]["Field25"].value == "" || document.forms["form54"]["Field25-1"].value == "" || document.forms["form54"]["Field25-2"].value == "") {
        text += "<span style='color: red'>Please enter phone </span>"+ "<br>"; 
        document.forms["form54"]["Field25"].focus(); 
        document.forms["form54"]["Field25-1"].focus(); 
        document.forms["form54"]["Field25-2"].focus();    
        document.getElementById("error").innerHTML = text;
        return false;
    }
    document.getElementById('form54').submit();
    return( true );  
}
function checkNumber(){
    let inputValue = document.forms['submitForm']['inputValue'].value;
    if (isNaN(inputValue)) {
        alert("Enter a numeric value");
        return false;
    }
}
