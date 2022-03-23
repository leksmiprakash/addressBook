<cfcomponent displayname="userdata" hint="Data from user side">
    <cffunction name="authUser" access="public" >
        <cfquery name="usersData">
            SELECT * FROM usersTable WHERE user_id= <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#session.stLoggedInUser.userID#">
        </cfquery>
        <cfreturn usersData>
    </cffunction>
    <cffunction  name="selectContact" access="public">
     <cfquery name="usersData">
            SELECT * FROM contact_number WHERE user_id= #session.stLoggedInUser.userID#
        </cfquery>
        <cfreturn usersData>
    </cffunction>
</cfcomponent>