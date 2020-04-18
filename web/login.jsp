<%-- 
    Document   : login
    Created on : 17/04/2020, 4:27:48 PM
    Author     : Group 31
    Summary: Page that allows the customer to login to their IoTBay account.
    
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Login Page</title>
    </head>
    <body>
        <form method push action="main.jsp">
            <table>
                <tr><td>Email </td><td><input type="text" placeholder="Enter Email" name="email" ></td></tr>
                <tr><td>Password:</td><td><input type="password" placeholder="Enter Password" name="password"></td></tr> 
            </table>
                   <a class="button" href="main.jsp" value="Login">Login</a> 
                    <a class="button" href="index.jsp" value="Cancel">Cancel</a>
        </form>
    </body>
</html>