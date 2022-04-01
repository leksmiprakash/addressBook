<cfset session.loggedin = false>
<cfset sessionInvalidate()/>
<cfcookie name="CFID" value="" expires="now">
<cfcookie name="CFTOKEN" value="" expires="now">
<cfset  StructClear(Session) />
<cflocation url = "index.cfm" addtoken="no">

