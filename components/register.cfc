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
</cfcomponent>
