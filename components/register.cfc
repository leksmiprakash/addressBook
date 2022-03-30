<cfcomponent displayname="Insert" hint="Insert user">
    <cfif IsDefined("form.registerSubmit")>
        <cffunction name="registerQuery" output="false" access="public">
            <cfargument name="fullName" type="string"/> 
            <cfargument name="email" type="string"/> 
            <cfargument name="userName" type="string"/> 
            <cfargument name="password" type="string"/>
            <cfargument name="cpassword" type="string"/>
            <cfset messageArray = ArrayNew(1) />
            <cfif arguments.fullName eq "">
                <cfset ArrayAppend(messageArray, "Please enter the name") />
            </cfif>
            <cfif arguments.email eq "">
                <cfset ArrayAppend(messageArray, "Please enter the email") />
            </cfif>
            <cfif arguments.userName eq "">
                <cfset ArrayAppend(messageArray, "Please enter the userName") />
            </cfif>
            <cfif arguments.password eq "">
                <cfset ArrayAppend(messageArray, "Please enter the password") />
            </cfif>
            <cfif arguments.password neq arguments.cpassword>
                <cfset ArrayAppend(messageArray, "Password and confirm password must be equal") />
            </cfif>
            <cfquery name="emailcheck">
                select email 
                from usersTable
                where email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#" >
            </cfquery>
            <cfif emailcheck.recordcount gte 1 >
                <cfset  ArrayAppend(messageArray, "Email already exists")  />
            </cfif>
            <cfif ArrayIsEmpty(messageArray)>
                <cfquery name="local.regUsers"> 
                    INSERT INTO usersTable (fullName,email,userName,password)
                    VALUES (
                        <cfqueryparam value="#arguments.fullName#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#hash(arguments.password)#" cfsqltype="cf_sql_varchar">
                    ) 
                </cfquery> 
                <cfset  ArrayAppend(messageArray, "Inserted successfully")  />
            </cfif>
            <cfreturn messageArray>
        </cffunction>
    </cfif>
</cfcomponent>
