<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");

} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head><style type="text/css">body{
				background-image:url(clinic.jpg);
				background-repeat: no-repeat;
				background-size: 100%;
			}</style></head>
<body>
<% String usr=(String)session.getAttribute("userid"); %>
user: <%=usr %>
<a href="logserv.html"> go back</a>
<h1>services</h1>

<table border="1">
<tr>
<td>Service name</td>
<td>cost</td>


</tr>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	 connection = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");

statement=connection.createStatement();
String sql ="select * from services where userid='"+usr+"' order by sname";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){

//if(usr!=resultSet.getString("userid") )
//continue;

%>
<tr>
<td><%=resultSet.getString("sname") %></td>
<td><%=resultSet.getString("cost") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<form action="upserv.jsp">
<input type="text" name="sname" required>
<button type="submit"> enter service name to update</button></form>
<br><br>


<form action="delserv.jsp">
<input type="text" name="sname" required>
<button type="submit"> enter service name to delete</button></form>

</body>
</html>