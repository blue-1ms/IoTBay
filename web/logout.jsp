<%-- 
    Document   : logout
    Created on : 27/04/2020, 11:08:25 PM
    Author     : charbelachmar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="mypack.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/>

<% if (session != null) {
        session.removeAttribute("user");
        response.sendRedirect("index.jsp");
    } else {
        response.sendRedirect("login.jsp?status=login");
    }
%>