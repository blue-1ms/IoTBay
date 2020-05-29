<%-- 
    Document   : search
    Created on : 28/05/2020, 4:06:39 PM
    Author     : blue
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:derby://localhost:1527/iotdb";
String database = "IOTUSER";
String userid = "root";
String password = "";
String catalogue=request.getParameter("catalogue");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>
<h1>SEARCH RESULT </h1>
<link href="css/style.css" type="text/css" rel="stylesheet"/>
<table border="1">
<tr>
<td>CATALOGUE</td>
<td>CATALOGUEID</td>
<td>CATALOGUENAME</td>
<td>CATALOGUEPRICE</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from catalogue";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("catalogue") %></td>
<td><%=resultSet.getString("catalogueID") %></td>
<td><%=resultSet.getString("catalogueName") %></td>
<td><%=resultSet.getString("cataloguePrice") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>