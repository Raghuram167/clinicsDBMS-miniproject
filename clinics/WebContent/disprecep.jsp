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
<style type="text/css">
  body{
				background-image:url(clinic.jpg);
				background-repeat: no-repeat;
				background-size: 100%;
			}
	  div{
				border-radius: 15px;
				background-color: #f2f2f2;
				padding: 15px;
				margin: -70px 400px 0px 400px;
				margin-top: 50px;
				
			}	
			
			h1{
			text-align: center;
			}
</style>
<body>
<% String usr=(String)session.getAttribute("userid"); %>
user: <%=usr %>
<a href="logrecep.html"> go back</a>
<h1>receptionists</h1>

<table border="1">
<tr>
<td>receptionist id</td>
<td>name</td>
<td>salary</td>
<td>email</td>
<td>City</td>


</tr>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	 connection = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");

statement=connection.createStatement();
String sql ="select * from receptionist where userid='"+usr+"' order by eid";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){

//if(usr!=resultSet.getString("userid") )
//continue;

%>
<tr>
<td><%=resultSet.getString("eid") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("salary") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("city") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<form action="uprecep.jsp">
<input type="number" name="eid" required>
<button type="submit"> enter  eid to update</button></form>
<br><br>


<form action="delrecep.jsp">
<input type="number" name="eid" required>
<button type="submit"> enter eid to delete</button></form>

</body>
</html>