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
		<script src="./js/validation.js"></script>
    </head>
    <body>		
		<nav class="navbar navbar-expand-lg navbar-dark forBackground">
			<div class="container-fluid">
				<a class="navbar-brand" href="#"><i class="fa fa-address-book-o" aria-hidden="true"></i>ADDRESS BOOK</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item">
							<a class="nav-link active" href="#">Home</a>
						</li>
					</ul>
					<ul class="navbar-nav">
					<li class="nav-item">
							<a class="nav-link active" href="register.cfm"><i class="fa fa-user-o" aria-hidden="true"></i> Sign Up</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active" href="#"><i class="fa fa-sign-in" aria-hidden="true"></i> Sign In</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">&nbsp;</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="" style="background:#d8e5f1;">
			<div class="container-fluid"><br><br>
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
									<form action="" method="post" name="login" id="login"  onsubmit="return Validation()">
										<div class="form-group mt-2">
											<td><input type="Text"  placeholder="Username" name="userName" class="form-control w3-input"  id="userName"></td>
										</div>
										<div class="form-group mt-2">
											<input type="password"  placeholder="Password" name="password" class="form-control w3-input"   id="password">
										</div>
										<div class="form-group mt-4" align="center">
											<input type="submit" class="button-17" name="formSubmit" id="formSubmit" value="Login">
										</div>
									</form>
									<p class="forText" >Or sign in using</p>
									<div class="img_container">
										<img src="./images/fb.png" />
										<img src="./images/google.png" />
									</div>
									<p class="forText" >Don't have an account?<a href="register.cfm"> Register Here</a><br></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<cfset variables.errors="">
			<cfif structKeyExists(form,"formSubmit")>
				<cfinvoke component="components.login" method="authUser" returnvariable="result">
					<div class="err text-center">#errors# </div>
					<cfinvokeargument name="username" value="#form.userName#"/> 
					<cfinvokeargument name="password" value="#form.password#"/> 
				</cfinvoke>
				<cfdump var="#result#">
				<cfif result EQ "true">
						<cflocation url="dashboard.cfm" addtoken="no"> 
				<cfelse>
					<cfset variables.errors="Enter a valid username or password">
					<cfset StructDelete(Session, "stLoggedInUser")/>
					<cfset  StructClear(Session) />
				</cfif>
			</cfif>
			
		</div>
	</body>
</html>
<script type="text/javascript">
	
	function Validation(){ 
		let userName= $('#userName').val();
		let password= $('#password').val();
		if(userName=='')
		{
			$('#userName').attr('placeholder',' User Name is required');
			$('#userName').css('border-color','#F00');
			return false;
		}
		else if(password=='')
		{
			$('#password').attr('placeholder','Password are required');
			$('#password').css('border-color','#F00');
			return false;
		}
		else{
			return true;
		}                                       
	}	
</script>     