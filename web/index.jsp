<%-- 
    Document   : index
    Created on : 23/04/2020, 11:57:52 AM
    Author     : charbelachmar
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
        <div class="homePage">
            <div class="homeBanner">
                <div class="homefeatured">
                    <div id="featuredText">
                        <img class="featuredlogo" src="images/googlehomelogo.png" alt="googlehomelogo">
                        <br>
                        <br>
                        <img class="featuredwords" src="images/googlehomewords.png" alt="googlehomewords">
                        <br>
                        <br>
                        <br>
                        <br>
                        <a href="catalogue.jsp" class="button" id="featured">Find out more</a>
                    </div>
                    <div id="featuredImage">
                        <img class="featuredproduct" src="images/googlehome.png" alt="googlehome">
                    </div>
                </div>
            </div>
        <!--<div class="inline">
            <a href="login.jsp" class="button">Login</a>
            <div class="divider"></div>
            <a href="register.jsp" class="button">Register</a>
        </div> -->
    </div>
    </body>
</html>



