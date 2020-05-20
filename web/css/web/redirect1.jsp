<%-- 
    Document   : redirect1
    Created on : 07/05/2020, 5:31:10 PM
    Author     : charbelachmar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mypack.UserBean" %>
<jsp:useBean id="user" class="mypack.UserBean" scope="session"/>

<%
if (user.isValid()) {
                response.sendRedirect("account.jsp");
            }
else{
    response.sendRedirect("login.jsp");
}
 
%>