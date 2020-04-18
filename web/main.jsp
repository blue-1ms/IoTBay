<%-- 
    Document   : newjspmain
    Created on : 17/04/2020, 4:28:06 PM
    Author     : blue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>IoTBay Web Store</title>
    </head>
    <body>
       
         <h1>IoTBay Main</h1>
         <div class="login">
        <p class="p">Hello!  <%= request.getParameter("email")%></p>
        <a href="index.jsp">Logout</a>
         </div>
    </body>
</html>