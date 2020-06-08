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
        <title>IoTBay</title>
        <link href="css/style.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <jsp:include page="/header.jsp"/>
        
        <div class="container">
            <div class="row">
                <div class="col">

                    <h1>Catalogue</h1>
                    <div style="display: flex">
                        <div><a href="product.jsp"><img src="images/googlehome.png" style="width: 200px; height: 200px" alt=""></a><p>Google home</p></div>
                        <div><a href="product2.jsp"><img src="images/IoT 2.jpg" style="width: 200px; height: 200px" alt=""></a><p>Product2</p></div>
                        <div><a href="product3.jsp"><img src="images/IoT 3.jpg" style="width: 200px; height: 200px" alt=""></a><p>Product3</p></div>
                    </div>        

                </div>
            </div>
        </div>
        
    </body>
    <jsp:include page="/footer.jsp"/>
</html>
