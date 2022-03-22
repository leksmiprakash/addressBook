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
							<a class="nav-link active" href="index.cfm"><i class="fa fa-sign-in" aria-hidden="true"></i> Sign In</a>
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
                                    <h3 class="forHeading">SIGN Up</h3>
									<form action="" method="post" name="signup" id="signup"   onsubmit="return validateSignup()">
                                        <div class="form-group mt-2">
											<td><input type="Text"  placeholder="Full Name" name="fullName" class="form-control w3-input"  id="fullName"></td>
										</div>
                                        <div class="form-group mt-2">
											<td><input type="Text" placeholder="Email" name="email" class="form-control w3-input"  id="email"></td>
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
    </body> 
</html>
