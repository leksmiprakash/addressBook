<cfparam name="form.userName" default="">
<cfparam name="form.password" default="">
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="./css/bootstrap.min.css" rel="stylesheet" >
        <link href="./css/style.css" rel="stylesheet" >
		<link rel="stylesheet" href="./font-awesome/css/font-awesome.min.css">
		<script src="./js/jquery-3.6.0.min.js"></script>
        <script src="./js/bootstrap.min.js"></script>
		<script src="./js/validation.js"></script>  
    </head>
    <body>		
		<nav class="navbar navbar-expand-lg navbar-dark forBackground">
			<div class="container-fluid">
				<a class="navbar-brand" href="##"><i class="fa fa-address-book-o" aria-hidden="true"></i>ADDRESS BOOK</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item">
							<a class="nav-link active" href="##">Home</a>
						</li>
					</ul>
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link active" href="##"><i class="fa fa-sign-out" aria-hidden="true"></i> Sign Out</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="##">&nbsp;</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="container">
			<div class="container-fluid">
                <div class="row">
                    <div class="col-md-3 side-profile justify-content-center text-center classWhite" >
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
                                        <form role="form" method="POST" action="">
                                            <h5  class="forHr">Personal Contact</h5>
                                            <div class="input-group mt-3">
                                                <div class="form-group col-xs-3 col-md-3 classMargin">
                                                    <label  for="tittle">Title*</label>
                                                    <select  name="title" class="form-control w3-input" id="title" required>
                                                        <option value="">Select</option>
                                                        <option value="Mr">Mr</option>
                                                        <option value="Mrs">Mrs</option>
                                                        <option value="Miss">Miss</option>
                                                        <option value="Ms">Ms</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-xs-4 col-md-4 classMargin">
                                                    <label  for="firstName">First Name*</label>
                                                    <input name="fname" type="text" id="firstName" class="form-control w3-input" required>
                                                </div>
                                                <div class="form-group col-xs-4 col-md-4 classMargin">
                                                    <label for="LastName">Last Name*</label>
                                                    <input name="lname" type="text" id="LastName" class="form-control w3-input" required>
                                                </div>
                                            </div>
                                            <div class="input-group mt-3">
                                                <div class="form-group col-xs-6 col-md-6 classMargin">
                                                    <label for="gender">Gender*</label>
                                                    <select name="gender" class="form-control w3-input" id="gender" required>
                                                        <option value="">Select</option>
                                                        <option value="male">Male</option>
                                                        <option value="female">Female</option>
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
                                                    <input name="address" type="text" id="address" class="form-control w3-input" />
                                                </div>
                                                <div class="form-group col-xs-5 col-md-5 classMargin">
                                                    <label for="street">Street</label>
                                                    <input name="street" type="text" id="street" class="form-control w3-input" />
                                                </div>
                                            </div>
                                            <div class="input-group mt-3">
                                                <div class="form-group col-xs-6 col-md-6 classMargin">
                                                    <label for="email">Email*</label>
                                                    <input name="email" type="email" id="email" class="form-control w3-input" required/>
                                                </div>
                                                <div class="form-group col-xs-5 col-md-5 classMargin">
                                                    <label for="phone">Phone*</label>
                                                    <input name="phone" type="text" id="phone" class="form-control w3-input" required/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div>
                                                    <button type="submit" class="btn btn-success" style="float:right;">
                                                        Register
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                               
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                    <div class="col-md-8 " id="tableDataView" style="background:#fff; margin-top:60px; margin-left: 20px;">
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
                                        <td><button class="button-18" data-bs-toggle="modal" data-bs-target=".exampleModal-#userData.id#" >Edit</button></td>
                                        <td><a href="delete.cfm?id=#userData.id#" class="button-18">Delete</a></td>
                                        <td><button class="button-18" data-bs-toggle="modal" data-bs-target=".viewModal-#userData.id#">View</button></td>
                                        <div class="modal fade bd-example-modal-lg exampleModal-#userData.id#" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-lg" role="document">
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
                                                                <div class="col-md-2">
                                                                    <label  for="tittle">Title*</label>
                                                                    <select  name="title" class="form-control" id="title" required>
                                                                        <option value="">Select</option>
                                                                        <option <cfif userData.title eq "Mr" >selected</cfif> value="Mr">Mr</option>
                                                                        <option <cfif userData.title eq "Mrs" >selected</cfif> value="Mrs">Mrs</option>
                                                                        <option <cfif userData.title eq "Miss" >selected</cfif> value="Miss">Miss</option>
                                                                        <option <cfif userData.title eq "Ms" >selected</cfif> value="Ms">Ms</option>
                                                                    </select>
                                                                </div>
                                                                <div class="col-md-5">
                                                                    <label  for="firstName">First Name*</label>
                                                                    <input name="fname" value="#userData.firstName#" type="text" id="firstName" class="form-control" required>
                                                                </div>
                                                                <div class="col-md-5">
                                                                    <label for="LastName">Last Name*</label>
                                                                    <input name="lname" value="#userData.lastName#" type="text" id="LastName" class="form-control" required>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-4">
                                                                <div class="col-md-6">
                                                                    <label for="gender">Gender*</label>
                                                                    <select name="gender" class="form-control" id="gender" required>
                                                                        <option value="">Select</option>
                                                                        <option <cfif userData.gender eq "male" >selected</cfif> value="male">Male</option>
                                                                        <option <cfif userData.gender eq "female" >selected</cfif> value="female">Female</option>
                                                                    </select>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label for="DOB">Date Of Birth*</label>
                                                                    <input name="dob" value="#userData.dob#" type="date" id="DOB" class="form-control" required>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-4">
                                                                <div class="col-md-6">
                                                                    <label for="pImage">Upload Photo</label>
                                                                    <input name="file" type="file" id="pImage" class="form-control" /><img src="#userData.image#" width="100px" height="100px" />
                                                                    <input type="hidden" name="old_file" value="#userData.image#" />
                                                                </div>
                                                            </div>
                                                            <div class="row mt-4">
                                                                <div class="col-md-12">
                                                                    <h3>Contact Details</h3>
                                                                    <hr>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label for="address">Address</label>
                                                                    <input name="address" value="#userData.address#" type="text" id="address" class="form-control" />
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label for="street">Street</label>
                                                                    <input name="street" value="#userData.street#" type="text" id="street" class="form-control" />
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label for="email">Email*</label>
                                                                    <input name="email" value="#userData.email#" type="email" id="email" class="form-control" required/>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label for="phone">Phone*</label>
                                                                    <input name="phone" value="#userData.phone#" type="text" id="phone" class="form-control" required/>
                                                                </div>
                                                            </div>
                                                            <input type="hidden" name="id" value="#userData.id#" />
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            <button name="updateContact" type="submit" class="btn btn-primary">Save</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
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
                </cfinvoke >
            </cfif>
        </div>
    </body> 
</html>

