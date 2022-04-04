<cfinclude  template = "include/header.cfm"  runOnce = "true">
	<div id="message" class="alert alert-primary" role="alert">
		<cfoutput>#messageArray[1]#</cfoutput>
	</div>
<div class="" >
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
							<form action="components/login.cfc?method=authUser" method="post" name="login" id="login"  onsubmit="return Validation()">
								<div class="form-group mt-5">
									<td><input type="Text"  placeholder="Username" name="userName" class="form-control w3-input"  id="userName"></td>
								</div>
								<div class="form-group mt-5">
									<input type="password"  placeholder="Password" name="password" class="form-control w3-input"   id="password">
								</div>
								<div class="form-group mt-5" align="center">
									<input type="submit" class="button-17" name="formSubmit" id="formSubmit" value="Login">
								</div>
							</form>
							<p class="forText" >Or sign in using</p>
							<div class="img_container">
								<img src="./images/fb.png" />
								<img src="./images/google.png" />
							</div>
							<p class="forText" >Don't have an account?<a href="register.cfm"> Register Here</a></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<cfinclude  template = "include/footer.cfm"  runOnce = "true">