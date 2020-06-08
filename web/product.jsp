<%-- 
    Document   : product
    Created on : 26/05/2020, 6:03:33 PM
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
        <title>IoTBay - Product</title>
        <link href="css/style.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
       <jsp:include page="/header.jsp"/>

        <div class="container">
            <div class="row">
                <div class="col product">
            
                    <form action="cart" method="post">
                        <h2>Google Home</h2>
                        <img style="width: 30%; height: 30%" src="images/googlehome.png" />
                        <h3>Price :40$</h3>
                        <h3>Description</h3>
                        <p>Google Nest, previously named Google Home, is a line of smart speakers developed by Google under the Google Nest brand. The devices enable users to speak voice commands to interact with services through Google Assistant, the company's virtual assistant.</p>
                        <!-- Please provide product ID here -->
                        <input type="hidden" value="2" name="productID">
                        <button type="submit" name="action" value="add">Add to Cart</button>
                    </form>

                </div>
            </div>
        </div>

        <jsp:include page="/footer.jsp"/>

    </body>
    <jsp:include page="/footer.jsp"/>
</html>

