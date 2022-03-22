<cfif NOT IsDefined ('session.stLoggedInUser.username')>
    <cflocation url="index.cfm" addtoken="No">
</cfif>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="./css/bootstrap.min.css" rel="stylesheet" >
        <link href="./css/all.min.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="container">
	        <div class="row">
				<div class="col-md-12">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <a class="navbar-brand" href="##">Navbar</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                            <div class="navbar-nav">
                                <a class="nav-item nav-link active" href="##">Home</a>
                                <a href="logout.cfm" class="nav-item nav-link" >Logout</a><br>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </body> 
</html>

