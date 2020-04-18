<%-- 
    Document   : welcome
    Created on : 18/04/2020, 2:14:20 PM
    Author     : blue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css">
        <title>Home Page</title>
    </head>
    <body>
        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            String colour = request.getParameter("colour");
            String ToS = request.getParameter("ToS");
            if (ToS !=null){
            %>    
            <h1>Welcome, <%=name %></h1>
            <div class="panel_div">
                <p class="p">Your Email: <%= email%></p>
                <p class="p">Your Password: <%= password%></p>
                <p class="p">Your Date of Birth <%= dob%></p>
                <p class="p">Your Gender is <%= gender%></p>
                <p class="p">Your Favorite colour is is <%= colour%></p>
                <a class="button" href="index.jsp">Cancel</a>
                <a class="button" href="login.jsp">Click Here to Login</a>
            <% } 
            else
   {   %>
   <p> Sorry, you must agree to the Terms of Service.</p>
   <p>Click <a class="button" href="register.jsp">here</a> to go back.</p>
<%   } %>
    </body>
</html>
