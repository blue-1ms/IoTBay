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
        <div class="topheader">
            <ul class="tophead">
                <li><a class="welcome">Welcome!</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="register.jsp">Register</a></li>
            </ul>
        </div>    
        <header>
            <a href="index.jsp" class="logolink"><img class="logo" src="images/IoTBay.png" alt="logo"></a>
        <nav>
            <ul class="navlinks">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="catalogue.jsp">Products</a></li>
                <li><a href="account.jsp">Account</a></li>
                <li><a href="about.jsp">About Us</a></li>
            </ul>
        </nav>
            <a href="search.jsp"><img src="images/search.svg" class="searchIcon" href="cart.jsp"></a>
            <a href="cart.jsp"><img src="images/menucart.svg" class="cartIcon"></a>
        </header>
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