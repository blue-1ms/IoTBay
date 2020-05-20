<jsp:useBean id="user" class="mypack.UserBean" scope="session"/>

<% 
     if (!user.isValid()) {
                response.sendRedirect("login.jsp");
            }
     
           String status=request.getParameter("status");
           String stat = "";
        
        if(status!=null){
        	if(status.equals("false")){
        		   stat = "Incorrect login details!";	           		
        	}
                else if(status.equals("logout")){
        		   stat = "You have successfully logged out.";	           		
        	}
                else if(status.equals("login")){
        		  stat = "You need to login to continue.";	           		
        	}
        	else{
        		stat = "Some error occurred!";
        	}
        }
        %>

<!DOCTYPE html>
<html>
    <head>
        <title>IoTBay - Login</title>
        <link href="css/style.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <div class="deletePage">
                        <img class="pagelogo" src="images/IoTBay.png" alt="logo">
        <form action="DeleteAccount" method="post" class="formStyle">
            <ul>
                <h1>Delete account</h1>
                <li name="customerID" class="hiddenli">
                        <label for="customerID">Your ID is</label>
                        <input readonly name="customerID" type="" value=${user.getID()}>
                </li>
                <li>
                    <input type="submit" value="Confirm">
                </li>
        
            </ul>
            <br>
            <p><a href="account.jsp" class="wlink"> Go Back </a> </p>
        </form> 
        </div>
    </body>
</html>