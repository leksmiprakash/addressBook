<cfcomponent displayname="userdata" hint="Data from user side">

    <cffunction name="displayalldata" access="public" returnType="any" output="false">  
          <cfargument name="usersid" required="true">    
          <cfset variables.getcontacts = EntityLoad('Contacts',{user_id=arguments.usersid},'user_id desc')>
          <cfreturn variables.getcontacts>    
     </cffunction>

    <cffunction  name="contact" access="remote">
        
        <cfset session.messageArray = ArrayNew(1) /> 
        <cfif form.title eq "">
            <cfset ArrayAppend(session.messageArray, "Please enter the title") />
        </cfif>
        <cfif form.fname eq "">
            <cfset ArrayAppend(session.messageArray, "Please enter the first name") />
        </cfif>
        <cfif form.lname eq "">
            <cfset ArrayAppend(session.messageArray, "Please enter the last Name") />
        </cfif>
        <cfif form.gender eq "">
            <cfset ArrayAppend(session.messageArray, "Please enter the gender") />
        </cfif>
        <cfif form.dob eq "">
            <cfset ArrayAppend(session.messageArray, "Please enter the dob") />
        </cfif>
        <cfif form.address eq "">
            <cfset ArrayAppend(session.messageArray, "Please enter the address") />
        </cfif>
        <cfif form.street eq "">
            <cfset ArrayAppend(session.messageArray, "Please enter the street") />
        </cfif>
        <cfif form.email eq "">
            <cfset ArrayAppend(session.messageArray, "Please enter the email") />
        </cfif>
        <cfif form.phone eq "">
            <cfset ArrayAppend(session.messageArray, "Please enter the phone") />
        </cfif>
        <cfif ArrayIsEmpty(session.messageArray)>
            <cfif form.updateData gt 0>
                <cfif form.file != "">
                    <cffile action="upload"
                        fileField="file"
                        destination="F:\ColdFusion2021\cfusion\wwwroot\addressBook\images\"
                        nameconflict="makeunique"
                        result="img">
                    <cfset variables.img = img.serverFile>
                <cfelse>
                    <cfset variables.img = form.old_file>
                </cfif>
                <cfquery name="updateQuery">
                    UPDATE contactNumbers 
                    SET title = <cfqueryparam CFSQLType="cf_sql_varchar" value="#form.title#">, 
                        firstName = <cfqueryparam CFSQLType="cf_sql_varchar" value="#form.fname#">,
                        lastName = <cfqueryparam CFSQLType="cf_sql_varchar" value="#form.lname#">,
                        gender = <cfqueryparam CFSQLType="cf_sql_varchar" value="#form.gender#">,
                        dob = <cfqueryparam CFSQLType="cf_sql_date" value="#form.dob#">,
                        image = <cfqueryparam CFSQLType="cf_sql_varchar" value="#variables.img#">,
                        address = <cfqueryparam CFSQLType="cf_sql_varchar" value="#form.address#">,
                        street = <cfqueryparam CFSQLType="cf_sql_varchar" value="#form.street#">,
                        email = <cfqueryparam CFSQLType="cf_sql_varchar" value="#form.email#">,
                        phone = <cfqueryparam CFSQLType="cf_sql_varchar" value="#form.phone#">
                    WHERE id = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#form.updatedata#"> 
                </cfquery>
                <cflocation url="../dashboard.cfm" addtoken="no">
                <cfset ArrayAppend(session.messageArray, "Updated successfully") />
               
            <cfelse>
                <cfif form.file != "">
                    <cffile action="upload"
                        fileField="file"
                        destination="F:\ColdFusion2021\cfusion\wwwroot\addressBook\images\"
                        nameconflict="makeunique"
                        result="img">
                    <cfset img = img.serverFile>
                <cfelse>
                    <cfset img = "no-profile.png">
                </cfif>
                <cfquery result="result">
                    INSERT INTO contactNumbers (user_id, title, firstName, lastName, gender, dob, image, address, street, email, phone)
                    VALUES (
                        <cfqueryparam value="#session.userID#" cfsqltype="CF_SQL_INTEGER">,
                        <cfqueryparam value="#form.title#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#form.fname#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#form.lname#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#form.gender#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#form.dob#" cfsqltype="cf_sql_date">,
                        <cfqueryparam value="#img#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#form.address#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#form.street#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#form.phone#" cfsqltype="cf_sql_varchar">
                    )
                </cfquery>
                <cflocation url="../dashboard.cfm" addtoken="no">
                <cfset ArrayAppend(session.messageArray, "Inserted successfully") />
                
            </cfif>
            
        </cfif>
        <cfreturn session.messageArray>
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
          <cfquery name = "getcontactbyid"    >
               select *  from contactNumbers where id=<cfqueryparam value="#form.editid#"  cfsqltype="cf_sql_integer">      
          </cfquery>
          <cfreturn getcontactbyid> 
     </cffunction>
</cfcomponent>