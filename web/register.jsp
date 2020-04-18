<%-- 
    Document   : register
    Created on : 17/04/2020, 4:28:15 PM
    Author     : blue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Registration Page</title>
    </head>
    <body>
        <h1>Welcome, Please Register Your Account</h1>
  <form method push action="welcome.jsp">
            <table align="center">
                <tr><td>Full Name:</td><td><input type="text" placeholder="Enter name" name="name"></td></tr>
                <tr><td>Email:</td><td><input type="text" placeholder="Enter email" name="email"></td></tr>
                <tr><td>Password:</td><td><input type="password" placeholder="Enter password" name="password"></td></tr>
                <tr><td>Date of Birth:</td><td><input type="date" name="dob"></td></tr>
             
                <tr><td>
                        Gender: </td><td>
                        <INPUT TYPE="radio" NAME="gender" VALUE="male" checked>Male<br/>
                        <INPUT TYPE="radio" NAME="gender" VALUE="female">Female</td><td>
                </td></tr>
                
           <tr><td>Your Favourite Colour:</td><td>
                   <select name="colour">
           <option>Red</option>
           <option>Blue</option>   
           <option>Green</option>
           <option>Pink</option>
           </select></td></tr>
           <tr><td>Agree to Terms of Service:</td><td><input TYPE="checkbox" NAME="ToS" VALUE="true"></td></tr>
</select>
                <tr><td></td><td><input type="submit" value="Sign Up"></td></tr>
            </table>
       </center>
    </body>
</html>