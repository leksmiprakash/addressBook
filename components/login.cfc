<cfcomponent displayname="Insert" hint="Insert Different string">
    <cffunction name="authUser" access="public" returnType="string" output="true">
        <cfargument name="userName" required="true">
        <cfargument name="password" required="true">
           <cfset variables.isUserLoggedIn = "">
           <cfquery name="checkUser"  result="logResult">
                SELECT user_id,userName
                FROM usersTable
                WHERE (usersTable.userName = <cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar" 
                maxlength="255"> AND usersTable.password = <cfqueryparam value="#hash(arguments.password)#">)
            </cfquery>
            <cfif checkUser.recordCount EQ 1>      
                <cfset session.stLoggedInUser = {'loggedin'=true,'userName' = checkUser.userName, 'userID' = checkUser.user_id} />     
                <cfset variables.isUserLoggedIn = true>
            <cfelse>
                <cfset variables.isUserLoggedIn = false>
            </cfif>
        <cfreturn variables.isUserLoggedIn>    
    </cffunction>
</cfcomponent>
