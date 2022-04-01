component{
    
    This.name = "TestApplication";
    This.clientmanagement="True";
    This.loginstorage="Session";
    This.sessionmanagement="True";
    This.datasource="cfsample";
    This.sessiontimeout=createtimespan(0,0,10,0);
    This.applicationtimeout=createtimespan(5,0,0,0);

   function onRequestStart(requestname){ 

        if(!structKeyExists(session, "userID") or !structKeyExists(session, "loggedin") ){
            if(!(FindNoCase("index",requestname) > 0 or FindNoCase("register",requestname) > 0 or FindNoCase("login",requestname) > 0 or FindNoCase("google",requestname) > 0)){
               location("/addressBook/index.cfm",false);
            }
        }
    }

    function onError(Exception,EventName){
        writeOutput('<center><h1>An error occurred</h1>
		<p>Please Contact the developer</p>
		<p>Error details: #Exception.message#</p></center>');
    }

    function onMissingTemplate(targetPage){
        writeOutput('<center><h1>This Page is not avilable.</h1>
		<p>Please go back:</p></center>');
    }
}


