<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">        
        <link href="css/style.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <div class="topheader">
            <ul class="tophead">
                <li><a class="welcome"><%= logUser%></a></li>
                <li><a href="redirect1.jsp"><%= bar1%></a></li>
                <li><a href="redirect2.jsp"><%= bar2%></a></li>
                <li>
                    <div class="container">
                        <form class="form-inline" method="POST" action="searchResult.jsp">
                            <input type="text" name="producttype" class="form-control" placeholder="Search by Type (components, kit)" class="searchBar">
                            <input type="image" src="images/search.svg" name="save" class="searchIcon">
                        </form>
                    </div>
                </li>
            </ul>
        </div>    
        <header>
            <a href="index.jsp" class="logolink"><img class="logo" src="images/IoTBay.png" alt="logo"></a>
            <nav>

                <ul class="navlinks">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="product.jsp">Products</a></li>
                    <li><a href="about.jsp">About Us</a></li>
                    <li><a href="cart"><img src="images/menucart.svg" class="cartIcon"></a></li>
                </ul>
            </nav>
        </header>
    </body>
</html>