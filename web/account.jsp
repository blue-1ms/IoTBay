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
    String logUser = "Welcome, " + user.getFirstName() + "!";
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Main Page</title>
        <link href="css/style.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <jsp:include page="/header.jsp"/>

        <div class="accountPage">
            <div class="accountFlex1">
                <img src="images/accountIcon.svg" class="accountIcon">
                <h1>Welcome, <%= user.getFirstName()%></h1>
                <h3>Your Customer ID is <%= user.getID() %></h3>
                <br><br><br><br>
                <a href="account.jsp" id="manageAccount">Manage your password</a>
                <br><br>
                <a href="deleteaccount.jsp" id="manageAccount">Delete Account</a>
            </div>

            <div class="accountFlex2">
                <!- Account Manage Page Item ->
                <div class="accountDetails">
                    <div class="subAccountDetails">
                        <div class="subAccountDetailsImg">
                            <img src="images/checklist.svg" class="manageImg">
                        </div>
                        <div class="subAccountDetailsTxt">
                            <h2>Manage Personal Details</h2>
                            <h3>View and update your personal information</h3>
                        </div>
                        <div class="subAccountDetailsBtn">
                            <a href="personaldetails.jsp" class="button">Manage</a>
                        </div>
                    </div>
                </div>
                <!- End Account Manage Page Item ->
                <!- Account Manage Page Item ->
                <div class="accountDetails">
                    <div class="subAccountDetails">
                        <div class="subAccountDetailsImg">
                            <img src="images/payment.svg" class="manageImg">
                        </div>
                        <div class="subAccountDetailsTxt">
                            <h2>Manage Payment Details</h2>
                            <h3>View and update your payment information</h3>
                        </div>
                        <div class="subAccountDetailsBtn">
                            <a href="register.jsp" class="button">Manage</a>
                        </div>
                    </div>
                </div>
                <!- End Account Manage Page Item ->
                <!- Account Manage Page Item ->
                <div class="accountDetails" id="lastChild">
                    <div class="subAccountDetails">
                        <div class="subAccountDetailsImg">
                            <img src="images/cart.svg" class="manageImg">
                        </div>
                        <div class="subAccountDetailsTxt">
                            <h2>Manage Orders</h2>
                            <h3>View and manage your orders</h3>
                        </div>
                        <div class="subAccountDetailsBtn">
                            <a href="register.jsp" class="button">Manage</a>
                        </div>
                    </div>
                </div>
                <!- End Account Manage Page Item ->

            </div>
        </div>
                <jsp:include page="/footer.jsp"/>
    </body>
</html>