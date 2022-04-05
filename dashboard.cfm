<cfoutput>
    <cfinclude  template = "include/header.cfm"  runOnce = "true">
    <div class="container">
        <div class="container-fluid"><br>
            <div class="row">
                <div class="row boxForPrint">
                    <div class="col-9">
                        
                    </div>
                    <div class=" col-3">
                        <button onclick="printDiv('contentToPrint')" class="rightDiv"><i class="fa fa-2x fa-print"></i></button>
                        <a href="printPdf.cfm" class="rightDiv"><i class="fa fa-2x fa-file-pdf-o"></i></a>
                        <a href="PrintExcel.cfm" class="rightDiv"><i class="fa fa-2x fa-file-excel-o"></i></a>
                    </div>
                </div>
                <div class="col-md-3 side-profile justify-content-center text-center classWhite" style="width:25%;">
                    
                    <img src="./images/no-profile.png" class="profile-section" />
                    <h2 class="nameTag">
                        #session.userName#
                    </h2>
                    <button class="col-8 contact-create-btn" data-bs-toggle="modal" data-bs-target="##exampleModal">Create Contact</button>
                </div>
                
                <div class="col-md-8 forTableContent" id="contentToPrint">
                    <cfset variables.userId = Session.userID />
                    <cfset ContactObj=CreateObject("component","components.userDetails")/>
                    <cfset allcontacts=ContactObj.displayalldata(variables.userId)/>
                    <table class="table table-responsive" >
                        <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">Name</th>
                            <th scope="col">Email Id</th>
                            <th scope="col">Phone Number</th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                        </tr>
                        </thead>
                        <tbody>
                            <cfloop array="#allcontacts#" item="allcontacts">
                                <tr>
                                    <th scope="row"><img src="./images/#allcontacts.getImage()#" width="100px" height="100px" style="border-radius:50%"></th>
                                    <td>#allcontacts.getFirstName()&' '&allcontacts.getLastName()#</td>
                                    <td>#allcontacts.getEmail()#</td>
                                    <td>#allcontacts.getPhone()#</td>
                                    <td>
                                        <a class="btn btn btn-outline-primary btn-sm button-18 editbtn" data-conid="#allcontacts.getId()#" id="editbtn"  data-bs-toggle="modal" data-bs-target="##exampleModal">
                                            Edit
                                        </a>
                                    </td>
                                    <td><a href="deleteAction.cfm?id=#allcontacts.getId()#" class="button-18" onclick="return confirm('Are you sure?');" >Delete</a></td>
                                    <td><button class="button-18 viewBtn" data-bs-toggle="modal" data-conid="#allcontacts.getId()#" data-bs-target="##viewModal">View</button></td>
                                </tr>
                            </cfloop>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <div id="exampleModal" class="modal fade">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content tempBackground" >
                    <div class="row col-12" >
                        <div class="col-md-8 classWhite classMargin">
                            <div class="modal-header">
                                <h5 class="boxHead" id="boxHead">Create CONTACT</h5><br>
                            </div>
                            <div class="modal-body">
                                <form method="post" action="components/userDetails.cfc?method=contact" enctype="multipart/form-data" onsubmit="return ValidationAddForm()">
                                    <h5  class="forHr">Personal Contact</h5>
                                    <div class="input-group mt-3">
                                        <div class="form-group col-xs-3 col-md-3 classMargin">
                                            <label  for="tittle">Title <span id="tittle1">*</span></label>
                                            <select  name="title" class="form-control w3-input" id="Contacttitle" >
                                                <option value="">Select</option>
                                                <option  value="1">Mr</option>
                                                <option  value="2">Mrs</option>
                                                <option  value="3">Ms</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-xs-4 col-md-4 classMargin">
                                            <label  for="firstName">First Name <span id="fname1">*</span></label>
                                            <input name="fname" value="" type="text" id="fname" class="form-control" >
                                        </div>
                                        <div class="form-group col-xs-4 col-md-4 classMargin">
                                            <label for="LastName">Last Name <span id="lname1">*</span></label>
                                            <input name="lname" value="" type="text" id="lname" class="form-control" >
                                        </div>
                                    </div>
                                    <div class="input-group mt-3">
                                        <div class="form-group col-xs-6 col-md-6 classMargin">
                                            <label for="gender">Gender <span id="gender1">*</span></label>
                                            <select name="gender" class="form-control" id="Contactgender" >
                                                <option value="">Select</option>
                                                <option  value="1">Male</option>
                                                <option  value="2">Female</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-xs-5 col-md-5 classMargin">
                                            <label for="DOB">Date Of Birth <span id="dob1">*</span></label>
                                            <input name="dob" value="" type="date" id="dob" class="form-control" >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="pImage">Upload Photo</label>
                                        <input name="file" type="file" id="pImage" class="form-control" onchange="changeImage(this);" />
                                        <input type="hidden" name="old_file" id="old_file" value="" />
                                    </div>
                                    <br><h5  class="forHr"> Contact Details</h5>
                                    <div class="input-group mt-3">
                                        <div class="form-group col-xs-6 col-md-6 classMargin">
                                            <label for="address">Address </label>
                                            <input name="address" value="" type="text" id="Contactaddress" class="form-control" />
                                        </div>
                                        <div class="form-group col-xs-5 col-md-5 classMargin">
                                            <label for="street">Street </label>
                                            <input name="street" value="" type="text" id="Contactstreet" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="input-group mt-3">
                                        <div class="form-group col-xs-6 col-md-6 classMargin">
                                            <label for="email">Email <span id="email1">*</span></label>
                                            <input name="email" value="" type="email" id="Contactemail" class="form-control" />
                                        </div>
                                        <div class="form-group col-xs-5 col-md-5 classMargin">
                                            <label for="phone">Phone <span id="phone1">*</span></label>
                                            <input name="phone" value="" type="text" id="Contactphone" class="form-control" />
                                        </div>
                                        
                                    </div>
                                    <div class="form-group">
                                        <div>
                                            <input type="hidden" id="updatedata" name="updatedata" value=""/>
                                            <input type="hidden" id="user_id" name="user_id" value="#session.userID#"/>
                                            <button name="updateContact" type="submit" class="btn btn-primary">Save</button>
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <img src="./images/no-profile.png" class="forImage" id="imageDisplay" />
                        </div>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <div class="modal fade bd-example-modal-lg" id="viewModal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
                <form method="post" action="" enctype="multipart/form-data" >
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <h3>Personal Contact</h3>
                                    <hr>
                                </div>
                                <div class="col-md-3">
                                    Name 
                                </div>
                                <div class="col-md-9">
                                    : #allcontacts.getTitle#  #allcontacts.getFirstName# #allcontacts.getLastName#
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-3">
                                    Gender 
                                </div>
                                <div class="col-md-9">
                                    : #allcontacts.getGender#
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-3">
                                    DOB 
                                </div>
                                <div class="col-md-9">
                                    : #allcontacts.getDob#
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-3">
                                    Address 
                                </div>
                                <div class="col-md-9">
                                    : #allcontacts.getAddress#, #allcontacts.getStreet#
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-3">
                                    Email 
                                </div>
                                <div class="col-md-9">
                                    : #allcontacts.getEmail#
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-3">
                                    Phone 
                                </div>
                                <div class="col-md-9">
                                    : #allcontacts.getPhone#
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-3">
                                    Image 
                                </div>
                                <div class="col-md-9">
                                    : <img src="./images/#allcontacts.getImage#" width="100px" height="100px" style="border-radius:50%">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</cfoutput>
<script>
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
function changeImage(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#imageDisplay').attr('src', e.target.result).width(250).height(250);
        };
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
<cfinclude  template = "include/header.cfm"  runOnce = "true">   