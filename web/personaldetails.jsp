<%-- 
    Document   : welcome
    Created on : 23/04/2020, 12:52:26 PM
    Author     : charbelachmar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mypack.UserBean" %>
<jsp:useBean id="user" class="mypack.UserBean" scope="session"/>

<%
    if (!user.isValid()) {
        response.sendRedirect("login.jsp?status=login");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Main Page</title>
        <link href="css/style.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <div class="topheader">
            <ul class="tophead">
                <li><a href="account.jsp">My Account</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </div>    
        <header>
            <a href="index.jsp" class="logolink"><img class="logo" src="images/IoTBay.png" alt="logo"></a>
        <nav>
            <ul class="navlinks">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="login.jsp">Products</a></li>
                <li><a href="register.jsp">About Us</a></li>
            </ul>
        </nav>
            <a href="search.jsp"><img src="images/search.svg" class="searchIcon" href="cart.jsp"></a>
            <a href="cart.jsp"><img src="images/menucart.svg" class="cartIcon"></a>
        </header>
        <form action="logout.jsp" method="post" class="formStyle" id="account">
                <h1>Update Profile Details</h1>
                <br>
                <ul>
                    <li name="customerID">
                        <label for="customerID">Your ID is</label>
                        <%= user.getID()%>
                    </li>
                    <li name="firstName">
                        <label for="firstName">Your first name is</label>
                        <%= user.getFirstName()%>
                    </li>
                    <br>
                    <li name="lastName">
                        <label for="lastName">Your last name is</label>
                        <%= user.getLastName()%>
                    </li>
                    <br>
                    <li name="email">
                        <label for="email">Your email is</label>
                        <%= user.getEmail()%>
                    </li>
                    <br>
                    <li name="phone">
                        <label for="phone">Your phone number is</label>
                        <%= user.getPhone()%>
                    </li>
                    <br>
                    <li name="password">
                        <label for="password">Your password is</label>
                        <%= user.getPassword()%>
                    </li>
                    <li>
                        <input type="submit" value="Logout" >
                    </li>
                </ul>
                <br>

            </form>
    </body>
</html>

