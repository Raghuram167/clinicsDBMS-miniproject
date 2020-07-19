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
<a href="logpat.html"> go back</a>
<h1>patients</h1>

<table border="1">
<tr>
<td>patient id</td>
<td>fname</td>
<td>lname</td>
<td>gender</td>
<td>City</td>
<td>case details</td>


</tr>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	 connection = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");

statement=connection.createStatement();
String sql ="select * from patient where userid='"+usr+"' order by pid";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){

//if(usr!=resultSet.getString("userid") )
//continue;

%>
<tr>
<td><%=resultSet.getString("pid") %></td>
<td><%=resultSet.getString("fname") %></td>
<td><%=resultSet.getString("lname") %></td>
<td><%=resultSet.getString("gender") %></td>
<td><%=resultSet.getString("city") %></td>
<td><%=resultSet.getString("casedetails") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<form action="uppat.jsp">
<input type="number" name="pid" required>
<button type="submit"> enter patient id to update</button></form>
<br><br>


<form action="delpat.jsp">
<input type="number" name="pid" required>
<button type="submit"> enter patient id to delete</button></form>

</body>
</html>