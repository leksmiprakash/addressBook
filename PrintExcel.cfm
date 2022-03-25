<cfset q = queryNew("Name,Address,Gender,DOB,Email,Phone")> 
<cfinvoke component="components.userDetails"  method="selectContact" returnvariable="userData">
	<cfoutput query="userData">
        <cfset fullname = userData.firstName & ' ' &userData.lastName />
        <cfset address = userData.address & ","& userData.street />
		<cfset queryAddRow(q)>
		<cfset querySetCell(q, "Name", fullname)>
		<cfset querySetCell(q, "Gender", userData.gender)>
		<cfset querySetCell(q, "DOB", userData.dob)>
		<cfset querySetCell(q, "Address", address)>
		<cfset querySetCell(q, "Email", userData.email)>
		<cfset querySetCell(q, "Phone", userData.phone)>
    </cfoutput>
	
	<cfset filename = expandPath("./contacts.xls")>
	<cfset s = spreadsheetNew()>
	<cfset spreadsheetAddRow(s, "Name,Address,Gender,DOB,Email,Phone")>
	<cfset spreadsheetFormatRow(s,
			{
				bold=true,
				fontsize=10
			}, 
			1)>
	<cfset spreadsheetAddRows(s, q)>
	<cfheader name="content-disposition" value="attachment; filename=contacts.xls">
	<cfcontent type="application/msexcel" variable="#spreadsheetReadBinary(s)#" reset="true">
