<%-- 
    Document   : product
    Created on : 26/05/2020, 6:03:33 PM
    Author     : mscov
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
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
                        <h2>Raspberry pi model 4B</h2>
                        <img style="width: 30%; height: 30%" src="images/R4.jpeg" />
                       
                        <h3>Description</h3>
                        <p>A 1.5GHz quad-core 64-bit ARM Cortex-A72 CPU (~3× performance) 1GB, 2GB, or 4GB of LPDDR4 SDRAM. Full-throughput Gigabit Ethernet. Dual-band 802.11ac wireless networking.</p>
                        <!-- Please provide product ID here -->
                        <input type="hidden" value="1" name="productID">
                        <input type="hidden" value="1" name="productID">
                        
                        <button type="submit" name="action" value="add">Add to Cart</button>
                    </form>

                </div>
            </div>
        </div>

        <jsp:include page="/footer.jsp"/>

    </body>
    <jsp:include page="/footer.jsp"/>
</html>

