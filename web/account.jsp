<%-- 
    Document   : welcome
    Created on : 23/04/2020, 12:52:26 PM
    Author     : charbelachmar
--%>

<jsp:useBean id="user" class="mypack.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/>

<jsp:include page="/header.jsp"/>

<%
    if (!user.isValid()) {
        response.sendRedirect("login.jsp?status=login");
    }
    String accType = user.getType();
    accType = accType.substring(0, 1).toUpperCase() + accType.substring(1);

%>


<div class="accountPage">
    <div class="accountFlex1">
        <img src="images/accountIcon.svg" class="accountIcon">
        <h1>Welcome, <%= user.getFirstName()%></h1>
        <h3>Your <%= accType%> ID is <%= user.getID() %></h3>
        <br><br><br><br>
        <a href="changepassword.jsp" id="manageAccount">Manage your password</a>
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
                    <a href="payment" class="button">Manage</a>
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