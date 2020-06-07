<jsp:useBean id="user" class="mypack.UserBean" scope="session"/>

<%-- 
    Document   : register
    Created on : 23/04/2020, 11:52:52 AM
    Author     : charbelachmar
--%>
<%
    if (user.isValid()) {
        response.sendRedirect("account.jsp");
    }

    String status = request.getParameter("status");
    String stat = "";
    if (status != null) {
        if (status.equals("false")) {
            stat = "This email has been taken!";
        } else if (status.equals("empty")) {
            stat = "One or more fields are empty.";
        } else if (status.equals("email")) {
            stat = "Email is invalid.";
        }
    }
%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>IoTBay Register</title>
        <link href="css/style.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <jsp:include page="/header.jsp"/>
        <form action="iot_register" method="post" class="formStyle">
            <h1>Register</h1>
            <p><%= stat %></p>
            <br>
            <ul>
                <li>
                    <label for="firstName">First Name</label>
                    <input type="text" name="firstName">
                </li>
                <br>
                <li>
                    <label for="lastName">Last Name</label>
                    <input type="text" name="lastName">
                </li>
                <br>
                <li>
                    <label for="email">Email</label>
                    <input type="email" name="email">
                </li>
                <br>
                <li>
                    <label for="phone">Phone Number</label>
                    <input type="text" name="phone">
                </li>
                <br>
                <li>
                    <label for="password">Password</label>
                    <input type="password" name="password">
                </li>
                <li>
                    <input type="submit" value="Register" >
                </li>
            </ul>
            <br>
            <p> Have an account? <a href="login.jsp" class="wlink"> Login here </a> </p>
        </form> 
    </body>
    <jsp:include page="/footer.jsp"/>
</html>



