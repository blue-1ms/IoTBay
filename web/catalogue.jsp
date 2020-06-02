<%-- 
    Document   : catalogue
    Created on : 25/05/2020, 12:44:43 PM
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
        <title>Catalogue</title>
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
                <li><a href="catalogue.jsp">Products</a></li>
                <li><a href="account.jsp">Account</a></li>
                <li><a href="about.jsp">About Us</a></li>
            </ul>
        </nav>
            <a href="search.jsp"><img src="images/search.svg" class="searchIcon"></a>
            <a href="cart.jsp"><img src="images/menucart.svg" class="cartIcon"></a>
        </header>
    <body>
        
        <div class="container">
            <div class="row">
                <div class="col">

                    <h1>Catalogue</h1>
                    <h2>Frequently Purchased Products</h2>
                    <!-- Insert A jumbotron or carosuel for images -->
                    <ul>
                        <li><a href="product.jsp">Product one</a></li>
                        <li><a href="product.jsp">Product two</a></li>
                        <li><a href="product.jsp">Product three</a></li>
                    </ul>        

                </div>
            </div>
        </div>
        
    </body>
</html>
