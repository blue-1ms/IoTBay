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
        <div class="topheader">
            <ul class="tophead">
                <li><a class="welcome"><%= logUser%></a></li>
                <li><a href="redirect1.jsp"><%= bar1%></a></li>
                <li><a href="redirect2.jsp"><%= bar2%></a></li>
            </ul>
        </div>    
        <header>
            <a href="index.jsp" class="logolink"><img class="logo" src="images/IoTBay.png" alt="logo"></a>
        <nav>
               
            <ul class="navlinks">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="login.jsp">Products</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="cart.jsp"><img src="images/menucart.svg" class="cartIcon"></a></li>
            </ul>
   <div class="container">
    <form class="form-inline" method="post" action="search.jsp">
    <input type="text" name="catalogue" class="form-control" placeholder="Search Catalogue">
    <button type="submit" name="save" class="SEARCH">SEARCH</button>
        </nav>

    

        </header>
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
                        <a href="login.jsp" class="button" id="featured">Find out more</a>
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



