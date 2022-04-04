
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

function ValidationAddForm(){ 
    let tittle= $('#Contacttitle').val();
    let fname   = $('#fname').val();
    let lname= $('#lname').val();
    let gender= $('#gender').val();
    let dob= $('#dob').val();
    let address= $('#Contactaddress').val();
    let street= $('#Contactstreet').val();
    let email= $('#Contactemail').val();
    let phone= $('#Contactphone').val();

    if(tittle=='')
    {
        $('#Contacttitle').attr('placeholder','Full Name required');
        $('#Contacttitle').css('border-color','#F00');
        return false;
    }
    else if(fname=='')
    {
        $('#fname').attr('placeholder',' First name required');
        $('#fname').css('border-color','#F00');
        return false;
    }
    else if(lname=='')
    {
        $('#lname').attr('placeholder','Last Name required');
        $('#lname').css('border-color','#F00');
        return false;
    }
    else if(gender=='')
    {
        $('#Contactgender').attr('placeholder',' Gender required');
        $('#Contactgender').css('border-color','#F00');
        return false;
    }
    else if(dob=='')
    {
        $('#dob').attr('placeholder','DOB required');
        $('#dob').css('border-color','#F00');
        return false;
    }
    else if(address=='')
    {
        $('#Contactaddress').attr('placeholder','Address required');
        $('#Contactaddress').css('border-color','#F00');
        return false;
    }
    else if(street=='')
    {
        $('#Contactstreet').attr('placeholder','Street required');
        $('#Contactstreet').css('border-color','#F00');
        return false;
    }
    else if(email=='')
    {
        $('#Contactemail').attr('placeholder','Email required');
        $('#Contactemail').css('border-color','#F00');
        return false;
    }
    else if(phone=='')
    {
        $('#Contactphone').attr('placeholder','Phone required');
        $('#Contactphone').css('border-color','#F00');
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
setTimeout(function() {
    $('#message').fadeOut('fast');
}, 3000); // <-- time in milliseconds

$(document).on('click', '.editbtn', function() {
    $("#boxHead").html("EDIT CONTACT");
    var _contactid = $(this).data('conid');
    $.ajax({
        type: "post",
        url: 'components/userDetails.cfc?method=displaydata',
        data: {
            editid: _contactid
        },
        beforeSend: function() {
            $("#updateContact").attr("disabled", true);
        },
        success: function(response) {
            p = JSON.parse(response);
            $("#updatedata").val(p.DATA[0][0]);
            $("#Contacttitle").val(p.DATA[0][2]).change();
            $("#fname").val(p.DATA[0][3]);
            $("#lname").val(p.DATA[0][4]);
            $("#Contactgender").val(p.DATA[0][5]).change();
            let dateStr = new Date(p.DATA[0][6]);
            var now = new Date(p.DATA[0][6]);
            var day = ("0" + now.getDate()).slice(-2);
            var month = ("0" + (now.getMonth() + 1)).slice(-2);
            var today = now.getFullYear() + "-" + (month) + "-" + (day);
            $('#dob').val(today);
            $("#Contactemail").val(p.DATA[0][10]);
            $("#Contactphone").val(p.DATA[0][11]);
            $("#Contactaddress").val(p.DATA[0][8]);
            $("#Contactstreet").val(p.DATA[0][9]);
            $("#old_file").val(p.DATA[0][7]);
            if (p.DATA[0][7] == "no-profile.png") {
                var newSrc = "./images/" + p.DATA[0][7];
            }
            else {
                var newSrc = "./images/" + p.DATA[0][7];
            }
            $("#imageDisplay").attr('src', newSrc);
            $("#updateContact").removeAttr("disabled");
        }
    });
});