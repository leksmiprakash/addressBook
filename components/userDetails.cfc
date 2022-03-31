<cfcomponent displayname="userdata" hint="Data from user side">

    <cffunction name="authUser" access="public" >
        <cfquery name="usersData">
            SELECT * FROM usersTable WHERE user_id= <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#session.stLoggedInUser.userID#">
        </cfquery>
        <cfreturn usersData>
    </cffunction>

    <cffunction  name="selectContact" access="public" returnType="any">
        <cfquery name="usersData">
            SELECT * FROM contactNumbers WHERE user_id= #session.stLoggedInUser.userID#
        </cfquery>
        <cfreturn usersData>
    </cffunction>

    <cffunction  name="createContact" access="remote">
        <cfargument name="title" type="string"/> 
        <cfargument name="fname" type="string"/> 
        <cfargument name="lname" type="string"/> 
        <cfargument name="gender" type="string"/>
        <cfargument name="dob" type="string"/> 
        <cfargument name="address" type="string"/> 
        <cfargument name="street" type="string"/> 
        <cfargument name="email" type="string"/> 
        <cfargument name="phone" type="string"/>
        <cfset messageArray = ArrayNew(1) /> 
        <cfif arguments.title eq "">
            <cfset ArrayAppend(messageArray, "Please enter the title") />
        </cfif>
        <cfif arguments.fname eq "">
            <cfset ArrayAppend(messageArray, "Please enter the first name") />
        </cfif>
        <cfif arguments.lname eq "">
            <cfset ArrayAppend(messageArray, "Please enter the last Name") />
        </cfif>
        <cfif arguments.gender eq "">
            <cfset ArrayAppend(messageArray, "Please enter the gender") />
        </cfif>
        <cfif arguments.dob eq "">
            <cfset ArrayAppend(messageArray, "Please enter the dob") />
        </cfif>
        <cfif arguments.address eq "">
            <cfset ArrayAppend(messageArray, "Please enter the address") />
        </cfif>
        <cfif arguments.street eq "">
            <cfset ArrayAppend(messageArray, "Please enter the street") />
        </cfif>
        <cfif arguments.email eq "">
            <cfset ArrayAppend(messageArray, "Please enter the email") />
        </cfif>
        <cfif arguments.phone eq "">
            <cfset ArrayAppend(messageArray, "Please enter the phone") />
        </cfif>
        <cfif form.file != "">
            <cffile action="upload"
                fileField="file"
                destination="F:\ColdFusion2021\cfusion\wwwroot\addressBook\images\"
                nameconflict="makeunique"
                result="img">
            <cfset img = "#img.serverFile#">
        <cfelse>
            <cfset img = "no-profile.png">
        </cfif>
        <cfif ArrayIsEmpty(messageArray)>
            <cfquery result="result">
                INSERT INTO contactNumbers (user_id, title, firstName, lastName, gender, dob, image, address, street, email, phone)
                VALUES (
                    <cfqueryparam value="#session.stLoggedInUser.userID#" cfsqltype="CF_SQL_INTEGER">,
                    <cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.fname#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.lname#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.gender#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.dob#" cfsqltype="cf_sql_date">,
                    <cfqueryparam value="#img#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.street#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>
            <cfset  ArrayAppend(messageArray, "Inserted successfully")  />
        </cfif>
        <cfreturn messageArray>
    </cffunction>

    <cffunction  name="updateContact" access="remote">
        <cfargument name="title" type="string"/> 
        <cfargument name="fname" type="string"/> 
        <cfargument name="lname" type="string"/> 
        <cfargument name="gender" type="string"/>
        <cfargument name="dob" type="string"/> 
        <cfargument name="file" type="string"/> 
        <cfargument name="old_file" type="string"/> 
        <cfargument name="address" type="string"/> 
        <cfargument name="street" type="string"/> 
        <cfargument name="email" type="string"/> 
        <cfargument name="phone" type="string"/> 
		<cfargument name="updatedata" type="integer"/>
        <cfset messageArray = ArrayNew(1) />
        <cfif arguments.title eq "">
            <cfset ArrayAppend(messageArray, "Please enter the title") />
        </cfif>
        <cfif arguments.fname eq "">
            <cfset ArrayAppend(messageArray, "Please enter the first name") />
        </cfif>
        <cfif arguments.lname eq "">
            <cfset ArrayAppend(messageArray, "Please enter the last Name") />
        </cfif>
        <cfif arguments.gender eq "">
            <cfset ArrayAppend(messageArray, "Please enter the gender") />
        </cfif>
        <cfif arguments.dob eq "">
            <cfset ArrayAppend(messageArray, "Please enter the dob") />
        </cfif>
        <cfif arguments.address eq "">
            <cfset ArrayAppend(messageArray, "Please enter the address") />
        </cfif>
        <cfif arguments.street eq "">
            <cfset ArrayAppend(messageArray, "Please enter the street") />
        </cfif>
        <cfif arguments.email eq "">
            <cfset ArrayAppend(messageArray, "Please enter the email") />
        </cfif>
        <cfif arguments.phone eq "">
            <cfset ArrayAppend(messageArray, "Please enter the phone") />
        </cfif>
        <cfif arguments.file != "">
            <cffile action="upload"
                fileField="file"
                destination="F:\ColdFusion2021\cfusion\wwwroot\addressBook\images\"
                nameconflict="makeunique"
                result="img">
            <cfset variables.img = "#img.serverFile#">
        <cfelse>
            <cfset variables.img = "#arguments.old_file#">
        </cfif>
        <cfif ArrayIsEmpty(messageArray)>
            <cfquery name="updateData">
                UPDATE contactNumbers 
                SET title = <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.title#">, 
                    firstName = <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.fname#">,
                    lastName = <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.lname#">,
                    gender = <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.gender#">,
                    dob = <cfqueryparam CFSQLType="cf_sql_date" value="#arguments.dob#">,
                    image = <cfqueryparam CFSQLType="cf_sql_varchar" value="#variables.img#">,
                    address = <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.address#">,
                    street = <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.street#">,
                    email = <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.email#">,
                    phone = <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.phone#">
                WHERE id = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#arguments.updatedata#"> 
            </cfquery>
            <cflocation url="./dashboard.cfm" addtoken="no">
            <cfset  ArrayAppend(messageArray, "Updated successfully")  />
        </cfif>
        <cfreturn messageArray>
    </cffunction>

    <cffunction name="deleteQuery" output="false" access="public">
        <cfquery name="DeleteData"> 
                DELETE FROM contactNumbers 
                WHERE id = #URL.id# 
        </cfquery> 
        <cfreturn>
    </cffunction>
    <cffunction name="displaydata" access="remote" returnType="any" returnFormat="JSON" output="false">
          <cfargument name="editid" required="true">
          <cfquery name = "local.getcontactbyid"    >
               select *  from contactNumbers where id=<cfqueryparam value="#arguments.editid#"  cfsqltype="cf_sql_integer">      
          </cfquery>
          <cfreturn getcontactbyid> 
     </cffunction>
</cfcomponent>