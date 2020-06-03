<%-- 
    Document   : welcome
    Created on : 23/04/2020, 12:52:26 PM
    Author     : charbelachmar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mypack.UserBean" %>
<jsp:useBean id="user" class="mypack.UserBean" scope="session"/>

<%
    if (!user.isValid()) {
        response.sendRedirect("login.jsp?status=login");
    }
String status = request.getParameter("status");
    String stat = "";
    if (status != null) {
        if (status.equals("false")) {
            stat = "An error has occured.";
        } else if (status.equals("newnotmatch")) {
            stat = "Your confirmed password does not match.";
        } else if (status.equals("oldnotmatch")) {
            stat = "Your old password does not match.";
        }
        else if (status.equals("empty")) {
            stat = "One or more fields are empty";
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Main Page</title>
        <link href="css/style.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <jsp:include page="/header.jsp"/>
        <form action="updatePassword" method="post" class="formStyle" id="account">
                <h1>Change your Password</h1>
                <p><%= stat %></p>
                <br>
                <ul>
                    <li name="customerID" class="hiddenli">
                        <label for="customerID">Your ID is</label>
                        <input readonly name="customerID" type="" value=${user.getID()}>
                    </li>
                    <li name="oldPassword">
                        <label for="oldPassword">Your Old Password</label>
                        <input name="oldPassword" type="password">
                    </li>
                    <br>
                    <li name="newPassword">
                        <label for="newPassword">Your New Password</label>
                        <input name="newPassword" type="password">
                    </li>
                    <br>
                    <li name="confirmPassword">
                        <label for="confirmPassword">Confirm New Password</label>
                        <input name="confirmPassword" type="password">
                    </li>
                    <br>
                    <li>
                        <input type="submit" value="Submit" >
                    </li>
                </ul>
                <br>

            </form>
    </body>
</html>

