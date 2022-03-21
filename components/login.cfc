<cfcomponent displayname="Insert" hint="Insert Different string">
    <cffunction name="authUser" access="public" returnType="string" output="true">
        <cfargument name="username" required="true">
        <cfargument name="password" required="true">
           <cfset variables.isUserLoggedIn = "">
           <cfquery name="checkUser"  result="logResult">
                SELECT register_id,username
                FROM register
                WHERE (register.username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar" 
                maxlength="255"> AND register.password = <cfqueryparam value="#hash(arguments.password)#">)
            </cfquery>
            <cfif checkUser.recordCount EQ 1>      
                <cfset session.stLoggedInUser = {'loggedin'=true,'username' = checkUser.username, 'userID' = checkUser.register_id} />     
                <cfset variables.isUserLoggedIn = true>
            <cfelse>
                <cfset variables.isUserLoggedIn = false>
            </cfif>
        <cfreturn variables.isUserLoggedIn>    
    </cffunction>
</cfcomponent>
