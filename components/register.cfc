<cfscript>
    component {
        remote function registerQuery (){
            var name       = form.fullName;
            var email      = form.email;
            var userName   = form.userName;
            var password   = form.password;
            var cpassword   = form.cpassword;
            Session.messageArray = ArrayNew(1);
            if(name eq ""){
                ArrayAppend(Session.messageArray, "Please enter the FullName","true"); 
            }
            else if(email eq ""){
                ArrayAppend(Session.messageArray, "Please enter the Email","true"); 
            }
            else if(userName eq ""){
                ArrayAppend(Session.messageArray, "Please enter the UserName","true"); 
            }
            else if(password eq ""){
                ArrayAppend(Session.messageArray, "Please enter the Password","true"); 
            }
            else if(cpassword eq ""){
                ArrayAppend(Session.messageArray, "Please enter the Confirm Password","true"); 
            }
            else if(ArrayIsEmpty(Session.messageArray)){
                var qService= new query();
                qService.setDatasource("cfsample");
                qService.setName("qRegisterQry");
                qService.addParam(name="fullName", value="#trim(form.fullName)#", cfsqltype="cf_sql_varchar");
                qService.addParam(name="email", value="#trim(form.email)#", cfsqltype="cf_sql_varchar");
                qService.addParam(name="userName", value="#trim(form.userName)#", cfsqltype="cf_sql_varchar");
                qService.addParam(name="password", value="#hash(trim(form.password))#", cfsqltype="cf_sql_varchar");
                qService.setSql("insert into  usersTable(fullName,email,userName,password) 
                values (:fullname, :email, :username, :password)");
                var result=qService.execute();
                var resultKey  = result.getPrefix().generatedkey;
                if(resultKey > 0){
                    ArrayAppend(Session.messageArray, "Successfully Registered","true"); 
                    location("/addressBook/register.cfm",false);
                }
                else{
                    ArrayAppend(Session.messageArray, "Something went wrong...","true"); 
                    location("/addressBook/register.cfm",false);
                }
            }
            return Session.messageArray ;
        }
    }
</cfscript>
