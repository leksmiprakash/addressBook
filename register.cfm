
<cfinclude  template = "include/header.cfm"  runOnce = "true">   
<cfparam name="form.fullName" default="">
<cfparam name="form.email" default="">
<cfparam name="form.userName" default="">
<cfparam name="form.password" default="">
<cfparam name="form.cpassword" default="">

<div class="" style="background:#d8e5f1;">
<div class="container-fluid">
	<div class="row">
		<div class="mt-5 ">
			<div class="col-7 card shadow mb-5 bg-white rounded forMargin" style="border-radius: 250px;">
				<div class="card-horizontal">
					<div class="img-square-wrapper col-md-4 image">
						<div class="vertical-center">
							<img class="img-fluid " src="./images/logo.png" alt="Card image cap">
						</div>
					</div>
					<div class="card-body col-md-8">
						<cfparam name="form.userName" type="string" default="">
						<cfparam name="form.password" type="string" default="">
						<h3 class="forHeading">SIGN Up</h3>
						<form action="" method="post" name="signup" id="signup"   onsubmit="return ValidationSignup()">
							<div class="form-group mt-2">
								<td><input type="Text"  placeholder="Full Name" name="fullName" class="form-control w3-input"  id="fullName"></td>
							</div>
							<div class="form-group mt-2">
								<td><input type="email" placeholder="Email" name="email" class="form-control w3-input"  id="email"></td>
							</div>
							<div class="form-group mt-2">
								<td><input type="Text"  placeholder="Username" name="userName" class="form-control w3-input"  id="userName"></td>
							</div>
							<div class="form-group mt-2">
								<input type="password"  placeholder="Password" name="password" class="form-control w3-input"   id="password">
							</div>
							<div class="form-group mt-2">
								<input type="password"  placeholder="Confirm Password" name="cpassword" class="form-control w3-input"   id="cpassword">
							</div>
							<div class="form-group mt-4" align="center">
								<input type="submit" class="button-17" name="formSubmit" value="Sign up">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<cfif StructKeyExists(Form,'formSubmit')>
	<cfinvoke component="components.register" method="registerQuery" returnvariable="result">
	<cfoutput>Inserted Successfully</cfoutput>
</cfif>
<cfinclude  template = "include/footer.cfm"  runOnce = "true">   