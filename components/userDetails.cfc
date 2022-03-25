<cfcomponent displayname="userdata" hint="Data from user side">

    <cffunction name="authUser" access="public" >
        <cfquery name="usersData">
            SELECT * FROM usersTable WHERE user_id= <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#session.stLoggedInUser.userID#">
        </cfquery>
        <cfreturn usersData>
    </cffunction>

    <cffunction  name="selectContact" access="public">
        <cfquery name="usersData">
            SELECT * FROM contactNumbers WHERE user_id= #session.stLoggedInUser.userID#
        </cfquery>
        <cfreturn usersData>
    </cffunction>

    <cffunction  name="updateContact" access="remote">
        <cfargument name="title" type="string"/>
        <cfargument name="fname" type="string"/>
        <cfargument name="lname" type="string"/>
        <cfargument name="gender" type="string"/>
        <cfargument name="dob" type="date"/>
        <cfargument name="address" type="string"/>
        <cfargument name="street" type="string"/>
        <cfargument name="email" type="string"/>
        <cfargument name="phone" type="string"/>
        <cfargument name="old_file" type="string"/>
        <cfargument name="id" type="integer"/>

        <cfif form.file != "">
            <cffile action="upload"
                fileField="file"
                destination="F:\ColdFusion2021\cfusion\wwwroot\addressBook\images\"
                nameconflict="makeunique"
                result="img">
            <cfset img = "images/#img.clientFile#">
        <cfelse>
            <cfset img = "#form.old_file#">
        </cfif>

        <cfquery name="updateData">
            UPDATE contactNumbers 
            SET title = <cfqueryparam CFSQLType="cf_sql_varchar" value="#form.title#">, 
                firstName = <cfqueryparam CFSQLType="cf_sql_varchar" value="#form.fname#">,
                lastName = <cfqueryparam CFSQLType="cf_sql_varchar" value="#form.lname#">,
                gender = <cfqueryparam CFSQLType="cf_sql_varchar" value="#form.gender#">,
                dob = <cfqueryparam CFSQLType="cf_sql_date" value="#form.dob#">,
                image = <cfqueryparam CFSQLType="cf_sql_varchar" value="#img#">,
                address = <cfqueryparam CFSQLType="cf_sql_varchar" value="#form.address#">,
                street = <cfqueryparam CFSQLType="cf_sql_varchar" value="#form.street#">,
                email = <cfqueryparam CFSQLType="cf_sql_varchar" value="#form.email#">,
                phone = <cfqueryparam CFSQLType="cf_sql_varchar" value="#form.phone#">
            WHERE id = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#form.id#"> 
        </cfquery>
        <cflocation url="./dashboard.cfm" >
    </cffunction>

    <cffunction name="deleteQuery" output="false" access="public">
        <cfquery name="DeleteData"> 
                DELETE FROM contactNumbers 
                WHERE id = #URL.id# 
        </cfquery> 
        <cfreturn>
    </cffunction>

</cfcomponent>