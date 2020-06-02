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
                <li>
                    <div class="container">
                        <form class="form-inline" method="post" action="searchResult.jsp">
                            <input type="text" name="catalogue" class="form-control" placeholder="Search Catalogue" class="searchBar">
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
                    <li><a href="cart.jsp"><img src="images/menucart.svg" class="cartIcon"></a></li>
                </ul>
            </nav>
        </header>
    </body>
</html>