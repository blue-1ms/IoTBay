<jsp:useBean id="user" class="mypack.UserBean" scope="session"/>

<% 
     if (user.isValid()) {
                response.sendRedirect("welcome.jsp");
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
       <jsp:include page="/header.jsp"/>
        <form action="iot_login" method="post" class="formStyle">
            <h1>Login</h1>
            <p><%= stat%></p>
            <br>
            <ul>
                <li>
                    <label for="email">Email</label>
                    <input type="email" name="email">
                </li>
                <br>
                <li>
                    <label for="password">Password</label>
                    <input type="password" name="password">
                </li>
                <li>
                    <input type="submit" value="Login" >
                </li>
            </ul>
            <br>
            <p> Don't have an account? <a href="register.jsp" class="wlink"> Register here </a> </p>
        </form> 
    </body>
</html>