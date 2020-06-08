<%-- 
    Document   : search
    Created on : 28/05/2020, 4:06:39 PM
    Author     : blue
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<jsp:useBean id="user" class="mypack.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/>

<% 
    String bar1 = "Login";
    String bar2 = "Register";
    String logUser = "Welcome!";
    if (user.isValid()) {
        bar1 = "My Account";
        bar2 = "Logout";
        logUser = "Welcome, " + user.getFirstName() + "!";
    }
%>
<!DOCTYPE html>
<html>
<body> 
    <form method="post" action="header.jsp">
 <head>
        <title>Catalogue Search Result</title>
        <link href="css/style.css" type="text/css" rel="stylesheet"/>
    </head>
    <jsp:include page="/header.jsp"/>
    <center>    
        <h1> Search Result </h1>
        <table border="1" width="50%" height="50%">
            <th>Product ID</font>
            <th>Product Name</font></th>
            <th>Product Type</font></th>
            <th>Product Description</font></th>
            <th>Product Price</font></th>
            <th>Product Quantity</font></th>
            <th>Product Availability</font></th>
                <%
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/iotbay", "iotbay", "admin");
                    Statement st = con.createStatement();
                    ResultSet rs;
                    PreparedStatement ps = con.prepareStatement("select * from IOTBAY.catalogue where producttype =?");
                    ps.setString(1, request.getParameter("producttype"));
                    rs = ps.executeQuery();
                    while (rs.next()) {
                     out.println("<tr>");
                     out.println("<td>" + rs.getString("productid") + "<input type='hidden' name='id' value='" + rs.getString("PRODUCTID") + "'></td>");
                     out.println("<td>" + rs.getString("productname") + "<input type='hcatalogueidden' name='id' value='" + rs.getString("PRODUCTNAME") + "'></td>");
                     out.println("<td>" + rs.getString("producttype") + "<input type='hidden' name='id' value='" + rs.getString("producttype") + "'></td>");
                     out.println("<td>" + rs.getString("productdesc") + "<input type='hidden' name='id' value='" + rs.getString("productdesc") + "'></td>");
                     out.println("<td>" + rs.getString("productprice") + "<input type='hidden' name='id' value='" + rs.getString("productprice") + "'></td>");
                     out.println("<td>" + rs.getString("productquantity") + "<input type='hidden' name='id' value='" + rs.getString("productquantity") + "'></td>");
                     out.println("<td>" + rs.getString("productavailability") + "<input type='hidden' name='id' value='" + rs.getString("productavailability") + "'></td>");
                    }
                    st.close();
                %>
                </center>
        </table>
                <br>  <br><h4><a href='index.jsp'>Back to Home</a></h4>
</form>
        <jsp:include page="/footer.jsp"/>
</body> 
</html>
