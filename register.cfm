
<cfinclude  template = "include/header.cfm"  runOnce = "true">   
<cfoutput>
	<div class="container" >
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
							<cfif IsDefined("session.messageArray") >
								<div id="message" class="alert alert-success" role="alert">
									#session.messageArray[1]#
								</div>
							</cfif>
							<h3 class="forHeading">SIGN Up</h3>
							<form action="components/register.cfc?method=registerQuery" method="post" name="signup" id="signup"   onsubmit="return ValidationSignup()">
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
</cfoutput>
<cfinclude  template = "include/footer.cfm"  runOnce = "true">   