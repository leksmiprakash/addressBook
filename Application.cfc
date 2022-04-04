<cfcomponent>
    <cfset This.name = "TestApplication">
    <cfset This.clientmanagement="True">
    <cfset This.loginstorage="Session">
    <cfset This.sessionmanagement="True">
    <cfset This.datasource="cfsample">
    <cfset This.sessiontimeout="#createtimespan(0,0,10,0)#">
    <cfset This.applicationtimeout="#createtimespan(5,0,0,0)#">
    <cffunction name="OnRequestStart" access="public" returntype="boolean" output="false" hint="for logout">
        <cfargument name="requestname"> 
        <cfif not structKeyExists(session, "userID") or not structKeyExists(session, "loggedin")   >
            <cfif not (FindNoCase("index",requestname) gt 0 or FindNoCase("register",requestname) gt 0) >
                <cflocation  url="index.cfm" addtoken=false>
            </cfif>
        </cfif>
        <cfreturn true>
    </cffunction>
    <cffunction name="onError" returnType="void" output="true">
        <cfargument name="Exception" required="true">
        <cfargument name="EventName" type="string" required="true">
        <cfoutput>
            <center><h1>An error occurred</h1>
            <p>Please Contact the developer</p>
            <p>Error details: #Exception.message#</p></center>
        </cfoutput>
    </cffunction>
    <cffunction name="onMissingTemplate" output="true">
        <cfargument name="targetPage" required="true">
        <cfoutput> <center><h1>This Page is not avilable.</h1>
		<p>Please enter the correct URL</p></center>
        </cfoutput>
    </cffunction>
</cfcomponent>
