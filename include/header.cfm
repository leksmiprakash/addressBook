<!DOCTYPE html>
<html lang="en">
    <head>
        
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <cfheader name="cache-control" value="no-cache, no-store, must-revalidate"> 
        <cfheader name="pragma" value="no-cache">
        <cfheader name="expires" value="#getHttpTimeString(now())#">
        <title>Document</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" >
        <link href="css/style.css" rel="stylesheet" >
		<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
		<script src="js/jquery-3.6.0.min.js"></script>
		<script src="js/validation.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>		
		<nav class="navbar navbar-expand-lg navbar-dark forBackground">
			<div class="container-fluid">
				<a class="navbar-brand" href="##"><i class="fa fa-address-book-o" aria-hidden="true"></i>ADDRESS BOOK</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="##navbarContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item">
							<a class="nav-link active" href="##">&nbsp;</a>
						</li>
					</ul>
					<ul class="navbar-nav">
					    <cfif IsDefined ('session.userName')>
                            <li class="nav-item">
                                <a class="nav-link active" href="logout.cfm"><i class="fa fa-sign-out" aria-hidden="true"></i> Sign Out</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="##">&nbsp;</a>
                            </li>
                        <cfelse>
                            <li class="nav-item">
                                <a class="nav-link active" href="register.cfm"><i class="fa fa-user-o" aria-hidden="true"></i> Sign Up</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="index.cfm"><i class="fa fa-sign-in" aria-hidden="true"></i> Sign In</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="##">&nbsp;</a>
                            </li>
                        </cfif>
					</ul>
				</div>
			</div>
		</nav>