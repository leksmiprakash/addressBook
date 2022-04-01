<cfoutput>
    <cfset variables.q = queryNew("Name,Address,Gender,DOB,Email,Phone")> 
    <cfinvoke component="components.userDetails"  method="selectContact" returnvariable="userData">
    <cfloop query="userData">
        <cfset variables.fullname = userData.firstName & ' ' &userData.lastName />
        <cfset variables.address = userData.address & ","& userData.street />
        <cfif variables.userData.gender == 1>
            <cfset variables.gender = "Male" />
        <cfelse>
            <cfset variables.gender = "Female" /> 
        </cfif>
        <cfset queryAddRow(q)>
        <cfset querySetCell(q, "Name", fullname)>
        <cfset querySetCell(q, "Gender", gender)>
        <cfset querySetCell(q, "DOB", userData.dob)>
        <cfset querySetCell(q, "Address", address)>
        <cfset querySetCell(q, "Email", userData.email)>
        <cfset querySetCell(q, "Phone", userData.phone)>
    </cfloop>
    <cfset variables.filename = expandPath("./contacts.xls")>
    <cfset variables.s = spreadsheetNew()>
    <cfset spreadsheetAddRow(s, "Name,Address,Gender,DOB,Email,Phone")>
    <cfset spreadsheetFormatRow(s,{ bold=true, fontsize=10 }, 1)>
    <cfset spreadsheetAddRows(s, q)>
    <cfheader name="content-disposition" value="attachment; filename=contacts.xls">
    <cfcontent type="application/msexcel" variable="#spreadsheetReadBinary(s)#" reset="true">
</cfoutput>
