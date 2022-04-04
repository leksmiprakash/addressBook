<cfscript>
    
</cfscript>>
<cfcomponent displayname="Insert" hint="Insert Different string">
    <cffunction name="authUser" access="public"  output="true">
        <cfargument name="userName" required="true">
        <cfargument name="password" required="true">
        <cfset variables.messageArray = ArrayNew(1) />
        <cfif arguments.userName eq "">
            <cfset ArrayAppend(messageArray, "Please enter the username") />
        </cfif>
        <cfif arguments.password eq "">
            <cfset ArrayAppend(messageArray, "Please enter the password") />
        </cfif>
        <cfset variables.isUserLoggedIn = "">
        <cfif ArrayIsEmpty(messageArray)>
            <cfquery name="checkUser"  result="logResult">
                SELECT user_id,userName
                FROM usersTable
                WHERE (usersTable.userName = <cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar" 
                maxlength="255"> AND usersTable.password = <cfqueryparam value="#hash(arguments.password)#">)
            </cfquery>
            <cfif checkUser.recordCount EQ 1>      
                <cfset Session.userID = checkUser.user_id>
                <cfset Session.userName = checkUser.userName>
                <cfset Session.loggedin = true /> 
                <cfset Session.message = "Logged In successfully" /> 
                <cfset ArrayAppend(messageArray, "Logeed In") />
                <cflocation url="dashboard.cfm" addtoken="no"> 
            <cfelse>
                <cfset ArrayAppend(messageArray, "Enter a valid username or password") />
            </cfif>
        </cfif>
        <cfreturn messageArray>    
    </cffunction>
</cfcomponent>
