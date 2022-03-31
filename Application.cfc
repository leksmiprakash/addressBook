<cfcomponent>
<cfset This.name = "TestApplication">
<cfset This.clientmanagement="True">
<cfset This.loginstorage="Session">
<cfset This.sessionmanagement="True">
<cfset This.datasource="cfsample">
<cfset This.stLoggedInUser.loggedin = true>
<cfset This.sessiontimeout="#createtimespan(0,0,10,0)#">
<cfset This.applicationtimeout="#createtimespan(5,0,0,0)#">
</cfcomponent>


