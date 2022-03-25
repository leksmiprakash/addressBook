<cfcomponent displayname="Insert" hint="Insert user">
    <cfif IsDefined("form.registerSubmit")>
        <cffunction name="registerQuery" output="false" access="public">
            <cfquery name="local.regUsers"> 
                INSERT INTO usersTable (fullName,email,userName,password)
                VALUES ('#Form.fullName#','#Form.email#','#Form.userName#', '#hash(Form.password)#') 
            </cfquery> 
            <cfreturn>
        </cffunction>
    </cfif>
    <cffunction name="getUser" access="remote" returnFormat="JSON">
    <cfargument name="EmailId" type="any" required="true">
       <cfquery name="getMail" >
         SELECT email
                FROM usersTable 
            WHERE email = "#emailId#"             
        </cfquery> 
       <cfset cfcResults = getMail.RecordCount>
        <cfif cfcResults NEQ 0>
            <cfset cfcResults1 = false>  
        <cfelse>
            <cfset cfcResults1 = true>  
                    
        </cfif>
        <cfreturn cfcResults1> 
    </cffunction>
</cfcomponent>
