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
    </head>
    <body>
		<div class="container">
			<div class="row">
					<cfparam name="form.userName" type="string" default="">
					<cfparam name="form.password" type="string" default="">
				<form action="" method="post" name="login" id="login">
					<div class="form-group">
						<label>User Name</label>
						<td><input type="Text" name="userName" class="form-control" message="User Name is required" required="Yes" size="10" maxlength="12" id="userName"></td>
					</div>
					<div class="form-group">
						<label>Password</label>
						<input type="password" name="password" class="form-control" message="Password is required" required="Yes"  id="password">
					</div>
					<div class="form-group">
						<label> </label>
						<input type="submit" class="btn btn-success" name="formSubmit" value="Login">
					</div>
				</form>
			</div>
			<cfset variables.errors="">
			<cfif structKeyExists(form,"formSubmit")>
				<cfinvoke component="components.task27" method="authUser" returnvariable="result">
					<div class="err text-center">#errors# </div>
					<cfinvokeargument name="username" value="#form.userName#"/> 
					<cfinvokeargument name="password" value="#form.password#"/> 
				</cfinvoke>
				<cfdump var="#result#">
				<cfif result EQ "true">
						<cflocation url="welcome.cfm" addtoken="no"> 
				<cfelse>
					<cfset variables.errors="Enter a valid username or password">
					<cfset StructDelete(Session, "stLoggedInUser")/>
					<cfset  StructClear(Session) />
				</cfif>
			</cfif>
			 <cfif NOT isDefined("SESSION.userName")>
				<b class="error">Logout Successful.</b>
			</cfif>
		</div>
	</body>
</html>