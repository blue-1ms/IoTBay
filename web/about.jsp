<%-- 
    Document   : about
    Created on : 27/05/2020, 2:24:47 PM
    Author     : mscov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="mypack.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/>

<% 
    String bar1 = "Login";
    String bar2 = "Register";
    String logUser = "Welcome!";
    if (user.isValid()) {
        bar1 = "My Account";
        bar2 = "Logout";
        logUser = "Welcome, " + user.getFirstName() + "!";
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>IoTBay</title>
        <link href="css/style.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <jsp:include page="/header.jsp"/>
    <body>
        <h1>About Us!</h1>
        <p>
            At IoTBay our goal is to provide customers with the best quality IoT components at affordable prices. <br>
            With our online store, we hope to provide customers with around the clock access to everything IoT. <br>
            Items purchased from our site can be either picked up at your nearest store or shipped directly to you door, through the our registered shipping partners. <br>
        </p>
    </body>
</html>
