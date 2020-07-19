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
<head>
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
</head>
<body><a href="index.html"> back</a>
<h1>Search Data</h1>
<table border="1">
<tr>
<td>service name</td>
<td>cost </td>
</tr>
<%
try{
	String clinicname=request.getParameter("clinicname");
connection = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");
statement=connection.createStatement();
String sql ="select sname,cost from v1 where clinicname='"+clinicname+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("sname") %></td>
<td><%=resultSet.getString("cost") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
	response.sendRedirect("error.html");
e.printStackTrace();
}
%>
</table>


</body>
</html>