<cfinclude  template = "include/header.cfm"  runOnce = "true">
<div class="container">
    <div class="container-fluid"><br>
        <div class="row">
            <div class="col-md-12 boxForPrint">
                <button onclick="printDiv('contentToPrint')" style="float:right!important;"><i class="fa fa-2x fa-print"></i></button>
                <a href="printPdf.cfm" ><i class="fa fa-2x fa-file-pdf-o"></i></a>
                <a href="PrintExcel.cfm"><i class="fa fa-2x fa-file-excel-o"></i></a>
            </div>
            <div class="col-md-3 side-profile justify-content-center text-center classWhite" style="width:25%;">
                <cfinvoke component="components.userDetails" method="authUser" returnvariable="result">
                <img src="./images/no-profile.png" class="profile-section" />
                <h2 class="nameTag">
                    <cfoutput>#result.fullName#</cfoutput>
                </h2>
                <button class="col-8 contact-create-btn" data-bs-toggle="modal" data-bs-target="#ModalLoginForm">Create Contact</button>
            </div>
            <!-- Modal HTML Markup -->
            <div id="ModalLoginForm" class="modal fade">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content" style=" background:#d8e5f1;">
                        <div class="col-md-8 classWhite classMargin">
                            <div class="modal-header">
                                <h5 class="boxHead">CREATE CONTACT</h5><br>
                            </div>
                            <div class="modal-body">
                                <form role="form" method="POST" action="" enctype="multipart/form-data">
                                    <h5  class="forHr">Personal Contact</h5>
                                    <div class="input-group mt-3">
                                        <div class="form-group col-xs-3 col-md-3 classMargin">
                                            <label  for="tittle">Title*</label>
                                            <select  name="title" class="form-control w3-input" id="title" required>
                                                <option value="">-----Select-----</option>
                                                <option value="1">Mr</option>
                                                <option value="2">Mrs</option>
                                                <option value="3">Ms</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-xs-4 col-md-4 classMargin">
                                            <label  for="firstName">First Name*</label>
                                            <input name="fname" placeholder="Your First Name" type="text" id="firstName" class="form-control w3-input" required>
                                        </div>
                                        <div class="form-group col-xs-4 col-md-4 classMargin">
                                            <label for="LastName">Last Name*</label>
                                            <input name="lname"  placeholder="Your Last Name" type="text" id="LastName" class="form-control w3-input" required>
                                        </div>
                                    </div>
                                    <div class="input-group mt-3">
                                        <div class="form-group col-xs-6 col-md-6 classMargin">
                                            <label for="gender">Gender*</label>
                                            <select name="gender" class="form-control w3-input" id="gender" required>
                                                <option value="">-----Select-----</option>
                                                <option value="1">Male</option>
                                                <option value="2">Female</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-xs-5 col-md-5 classMargin">
                                            <label for="DOB">Date Of Birth*</label>
                                            <input name="dob" type="date" id="DOB" class="form-control w3-input" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="pImage">Upload Photo</label>
                                        <input name="file" type="file" id="pImage" class="form-control w3-input" />
                                    </div>
                                    <br><h5  class="forHr"> Contact Details</h5>
                                    <div class="input-group mt-3">
                                        <div class="form-group col-xs-6 col-md-6 classMargin">
                                            <label for="address">Address</label>
                                            <input name="address" placeholder="Your Address" type="text" id="address" class="form-control w3-input" />
                                        </div>
                                        <div class="form-group col-xs-5 col-md-5 classMargin">
                                            <label for="street">Street</label>
                                            <input name="street" placeholder="Your Street Name" type="text" id="street" class="form-control w3-input" />
                                        </div>
                                    </div>
                                    <div class="input-group mt-3">
                                        <div class="form-group col-xs-6 col-md-6 classMargin">
                                            <label for="email">Email*</label>
                                            <input name="email" placeholder="Your Email ID" type="email" id="email" class="form-control w3-input" required/>
                                        </div>
                                        <div class="form-group col-xs-5 col-md-5 classMargin">
                                            <label for="phone">Phone*</label>
                                            <input name="phone" placeholder="Your Phone No" type="text" id="phone" class="form-control w3-input" required/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div>
                                            <button type="submit" name="addContact" class="btn btn-success"> Create </button>
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <div class="col-md-8 forTableContent" id="contentToPrint" style="">
                <cfinvoke component="components.userDetails"  method="selectContact" returnvariable="userData">
                <table class="table" >
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
                        <cfoutput query="userData">
                            <tr>
                                <th scope="row"><img src="#userData.image#" width="100px" height="100px" style="border-radius:50%"></th>
                                <td>#userData.firstName# #userData.lastName#</td>
                                <td>#userData.email#</td>
                                <td>#userData.phone#</td>
                                <td><button class="button-18" data-bs-toggle="modal" data-bs-target="##exampleModal-#userData.id#" >Edit</button></td>
                                <td><a href="deleteAction.cfm?id=#userData.id#" class="button-18" onclick="return confirm('Are you sure?');" >Delete</a></td>
                                <td><button class="button-18" data-bs-toggle="modal" data-bs-target=".viewModal-#userData.id#">View</button></td>
                                <div id="exampleModal-#userData.id#" class="modal fade">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <form method="post" action="" enctype="multipart/form-data" >
                                            <div class="modal-content tempBackground" >
                                                <div class="col-md-8 classWhite classMargin">
                                                    <div class="modal-header">
                                                        <h5 class="boxHead">UPDATE CONTACT</h5><br>
                                                    </div>
                                                    <div class="modal-body">
                                                        <h5  class="forHr">Personal Contact</h5>
                                                        <div class="input-group mt-3">
                                                            <div class="form-group col-xs-3 col-md-3 classMargin">
                                                                <label  for="tittle">Title*</label>
                                                                <select  name="title" class="form-control w3-input" id="title" required>
                                                                    <option value="">Select</option>
                                                                    <option <cfif userData.title eq "1" >selected</cfif> value="1">Mr</option>
                                                                    <option <cfif userData.title eq "2" >selected</cfif> value="2">Mrs</option>
                                                                    <option <cfif userData.title eq "3" >selected</cfif> value="3">Ms</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group col-xs-4 col-md-4 classMargin">
                                                                <label  for="firstName">First Name*</label>
                                                                <input name="fname" value="#userData.firstName#" type="text" id="firstName" class="form-control" required>
                                                            </div>
                                                            <div class="form-group col-xs-4 col-md-4 classMargin">
                                                                <label for="LastName">Last Name*</label>
                                                                <input name="lname" value="#userData.lastName#" type="text" id="LastName" class="form-control" required>
                                                            </div>
                                                        </div>
                                                        <div class="input-group mt-3">
                                                            <div class="form-group col-xs-6 col-md-6 classMargin">
                                                                <label for="gender">Gender*</label>
                                                                <select name="gender" class="form-control" id="gender" required>
                                                                    <option value="">Select</option>
                                                                    <option <cfif userData.gender eq "1" >selected</cfif> value="1">Male</option>
                                                                    <option <cfif userData.gender eq "2" >selected</cfif> value="2">Female</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group col-xs-5 col-md-5 classMargin">
                                                                <label for="DOB">Date Of Birth*</label>
                                                                <input name="dob" value="#userData.dob#" type="date" id="DOB" class="form-control" required>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="pImage">Upload Photo</label>
                                                            <input name="file" type="file" id="pImage" class="form-control" /><img src="#userData.image#" width="100px" height="100px" />
                                                            <input type="hidden" name="old_file" value="#userData.image#" />
                                                        </div>
                                                        <br><h5  class="forHr"> Contact Details</h5>
                                                        <div class="input-group mt-3">
                                                            <div class="form-group col-xs-6 col-md-6 classMargin">
                                                                <label for="address">Address</label>
                                                                <input name="address" value="#userData.address#" type="text" id="address" class="form-control" />
                                                            </div>
                                                            <div class="form-group col-xs-5 col-md-5 classMargin">
                                                                <label for="street">Street</label>
                                                                <input name="street" value="#userData.street#" type="text" id="street" class="form-control" />
                                                            </div>
                                                        </div>
                                                        <div class="input-group mt-3">
                                                            <div class="form-group col-xs-6 col-md-6 classMargin">
                                                                <label for="email">Email*</label>
                                                                <input name="email" value="#userData.email#" type="email" id="email" class="form-control" required/>
                                                            </div>
                                                            <div class="form-group col-xs-5 col-md-5 classMargin">
                                                                <label for="phone">Phone*</label>
                                                                <input name="phone" value="#userData.phone#" type="text" id="phone" class="form-control" required/>
                                                            </div>
                                                            <input type="hidden" name="id" value="#userData.id#" />
                                                        </div>
                                                        <div class="form-group">
                                                            <div>
                                                                <button name="updateContact" type="submit" class="btn btn-primary">Update</button>
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                </div><!-- /.modal -->
                                <div class="modal fade bd-example-modal-lg viewModal-#userData.id#"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                                            : #userData.title#  #userData.firstName# #userData.lastName#
                                                        </div>
                                                    </div>
                                                    <div class="row mt-4">
                                                        <div class="col-md-3">
                                                            Gender 
                                                        </div>
                                                        <div class="col-md-9">
                                                            : #userData.gender#
                                                        </div>
                                                    </div>
                                                    <div class="row mt-4">
                                                        <div class="col-md-3">
                                                            DOB 
                                                        </div>
                                                        <div class="col-md-9">
                                                            : #userData.dob#
                                                        </div>
                                                    </div>
                                                    <div class="row mt-4">
                                                        <div class="col-md-3">
                                                            Address 
                                                        </div>
                                                        <div class="col-md-9">
                                                            : #userData.address#, #userData.street#
                                                        </div>
                                                    </div>
                                                    <div class="row mt-4">
                                                        <div class="col-md-3">
                                                            Email 
                                                        </div>
                                                        <div class="col-md-9">
                                                            : #userData.email#
                                                        </div>
                                                    </div>
                                                    <div class="row mt-4">
                                                        <div class="col-md-3">
                                                            Phone 
                                                        </div>
                                                        <div class="col-md-9">
                                                            : #userData.phone#
                                                        </div>
                                                    </div>
                                                    <div class="row mt-4">
                                                        <div class="col-md-3">
                                                            Image 
                                                        </div>
                                                        <div class="col-md-9">
                                                            : <img src="#userData.image#" width="100px" height="100px" style="border-radius:50%">
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
                            </tr>
                        </cfoutput>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <cfif StructKeyExists(Form,'updateContact')>
        <cfinvoke component="components.userDetails"  method="updateContact" returnvariable="result">
            <cfinvokeargument name="title" value="#form.title#"/> 
			<cfinvokeargument name="fname" value="#form.fname#"/> 
            <cfinvokeargument name="lname" value="#form.lname#"/> 
			<cfinvokeargument name="dob" value="#form.dob#"/> 
            <cfinvokeargument name="gender" value="#form.gender#"/> 
            <cfinvokeargument name="file" value="#form.file#"/> 
			<cfinvokeargument name="address" value="#form.address#"/> 
            <cfinvokeargument name="street" value="#form.street#"/> 
			<cfinvokeargument name="email" value="#form.email#"/> 
			<cfinvokeargument name="phone" value="#form.phone#"/> 
			<cfinvokeargument name="id" value="#form.id#"/> 
        </cfinvoke>
    </cfif>
    <cfif StructKeyExists(Form,'addContact')>
        <cfinvoke component="components.userDetails"  method="createContact" returnvariable="result">
            <cfinvokeargument name="title" value="#form.title#"/> 
			<cfinvokeargument name="fname" value="#form.fname#"/> 
            <cfinvokeargument name="lname" value="#form.lname#"/> 
			<cfinvokeargument name="dob" value="#form.dob#"/> 
            <cfinvokeargument name="gender" value="#form.gender#"/> 
			<cfinvokeargument name="address" value="#form.address#"/> 
            <cfinvokeargument name="street" value="#form.street#"/> 
			<cfinvokeargument name="email" value="#form.email#"/> 
			<cfinvokeargument name="phone" value="#form.phone#"/> 
        </cfinvoke >
    </cfif>
</div>
<cfinclude  template = "include/header.cfm"  runOnce = "true">   