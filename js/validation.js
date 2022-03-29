
function Validation(){ 
    let userName= $('#userName').val();
    let password= $('#password').val();
    if(userName=='')
    {
        $('#userName').attr('placeholder',' Username required');
        $('#userName').css('border-color','#F00');
        return false;
    }
    else if(password=='')
    {
        $('#password').attr('placeholder','Password required');
        $('#password').css('border-color','#F00');
        return false;
    }
    else{
        return true;
    }                                       
}
function ValidationSignup(){ 
    let fullName= $('#fullName').val();
    let email   = $('#email').val();
    let userName= $('#userName').val();
    let password= $('#password').val();
    let cpassword= $('#cpassword').val();

    if(fullName=='')
    {
        $('#fullName').attr('placeholder','Full Name required');
        $('#fullName').css('border-color','#F00');
        return false;
    }
    if(email=='')
    {
        $('#email').attr('placeholder','Email required');
        $('#email').css('border-color','#F00');
        return false;
    }
    if(userName=='')
    {
        $('#userName').attr('placeholder',' Username required');
        $('#userName').css('border-color','#F00');
        return false;
    }
    else if(password=='')
    {
        $('#password').attr('placeholder','Password required');
        $('#password').css('border-color','#F00');
        return false;
    }
    else if(cpassword!=password)
    {
        $('#password').val('');
        $('#cpassword').val('');
        $('#password').attr('placeholder','Password and confirm password should be equal');
        $('#cpassword').attr('placeholder','Password and confirm password should be equal');
        $('#password').css('border-color','#F00');
        $('#cpassword').css('border-color','#F00');
        return false;
    }
    else{
        return true;
    }                                       
}		
function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;
   
    document.body.innerHTML = printContents;
   
    window.print();
   
    document.body.innerHTML = originalContents;
}