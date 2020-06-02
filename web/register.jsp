<jsp:useBean id="user" class="mypack.UserBean" scope="session"/>

<%-- 
    Document   : register
    Created on : 23/04/2020, 11:52:52 AM
    Author     : charbelachmar
--%>
<%
    if (user.isValid()) {
        response.sendRedirect("welcome.jsp");
    }

    String status = request.getParameter("status");
    String stat = "";
    if (status != null) {
        if (status.equals("false")) {
            stat = "This email has been taken!";
        } else if (status.equals("empty")) {
            stat = "One or more fields are empty.";
        } else if (status.equals("email")) {
            stat = "Email is invalid.";
        }
    }
%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>IoTBay Register</title>
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
        <form action="iot_register" method="post" class="formStyle">
            <h1>Register</h1>
            <p><%= stat %></p>
            <br>
            <ul>
                <li>
                    <label for="firstName">First Name</label>
                    <input type="text" name="firstName">
                </li>
                <br>
                <li>
                    <label for="lastName">Last Name</label>
                    <input type="text" name="lastName">
                </li>
                <br>
                <li>
                    <label for="email">Email</label>
                    <input type="email" name="email">
                </li>
                <br>
                <li>
                    <label for="phone">Phone Number</label>
                    <input type="text" name="phone">
                </li>
                <br>
                <li>
                    <label for="password">Password</label>
                    <input type="password" name="password">
                </li>
                <li>
                    <input type="submit" value="Register" >
                </li>
            </ul>
            <br>
            <p> Have an account? <a href="login.jsp" class="wlink"> Login here </a> </p>
        </form> 
    </body>
</html>



