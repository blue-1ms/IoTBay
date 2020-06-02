<%-- 
    Document   : search
    Created on : 28/05/2020, 4:06:39 PM
    Author     : blue
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>




<!DOCTYPE html>
<html>
<body> 
    <form method="post" action="reservations.jsp">
 <head>
        <title>Catalogue Search Result</title>
        <link href="css/style.css" type="text/css" rel="stylesheet"/>
    </head>
    </head>

    <center>    
        <table border="1" width="50%" height="50%">
            <th>Catalogue ID</font>
            <th>Product Name</font></th>
            <th>Product Type</font></th>
            <th>Product Description</font></th>
            <th>Product Price</font></th>
            <th>Stock</font></th>
                <%
                    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/catalogue", "catalogue", "catalogue");
                    Statement st = con.createStatement();
                    ResultSet rs;
                    PreparedStatement ps = con.prepareStatement("select * from catalogue");
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getString("catalogueid") + "<input type='hidden' name='id' value='" + rs.getString("catalogueid") + "'></td>");
                        out.println("<td>" + rs.getString("productname") + "<input type='hidden' name='id' value='" + rs.getString("catalogueid") + "'></td>");
                        out.println("<td>" + rs.getString("producttype") + "<input type='hidden' name='id' value='" + rs.getString("catalogueid") + "'></td>");
                        out.println("<td>" + rs.getString("description") + "<input type='hidden' name='id' value='" + rs.getString("catalogueid") + "'></td>");
                        out.println("<td>" + rs.getString("price") + "<input type='hidden' name='id' value='" + rs.getString("catalogueid") + "'></td>");
                        out.println("<td>" + rs.getString("stock") + "<input type='hidden' name='id' value='" + rs.getString("catalogueid") + "'></td>");

                    }
                    st.close();

                %>
                </center>
        </table>
        <br>  <br><a href='index.jsp'>Back to Index</a>
</form>
</body> 
</html>