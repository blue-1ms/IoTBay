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
                        <h2>Product</h2>
                        <img style="width: 30%; height: 30%" src="images/i9.jpeg" />
                        <h3>Price :40</h3>
                        <h3>Description</h3>
                        <p>Core i9-9900K is a 64-bit octa-core high-end performance x86 desktop microprocessor introduced by Intel in late 2018. This processor, which is based on the Coffee Lake microarchitecture, is manufactured on Intel's 3rd generation enhanced 14nm++ process.</p>
                        <!-- Please provide product ID here -->
                        <input type="hidden" value="3" name="productID">
                        <button type="submit" name="action" value="add">Add to Cart</button>
                    </form>

                </div>
            </div>
        </div>

        <jsp:include page="/footer.jsp"/>

    </body>
    <jsp:include page="/footer.jsp"/>
</html>

