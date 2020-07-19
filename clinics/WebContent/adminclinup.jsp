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
<html><head><style type="text/css">body{
				background-image:url(clinic.jpg);
				background-repeat: no-repeat;
				background-size: 100%;
			}</style></head>
<body>
<h1>Update data from database in jsp</h1>
<%
try{
	String userid=request.getParameter("userid");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	 connection = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");

statement=connection.createStatement();
String sql ="select * from register_clinic where userid='"+userid+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<form method="post" action="adup-clin.jsp">
owner name:<br>
<input type="text" name="name" value="<%=resultSet.getString("name") %>">
<br>
email:<br>
<input type="email" name="email" value="<%=resultSet.getString("email") %>">
<br>
clinic name:<br>
<input type="text" name="clinicname" value="<%=resultSet.getString("clinicname") %>">
<br>
clinic type:<br>
<input type="text" name="clinictype" value="<%=resultSet.getString("clinictype") %>">
<br>
address:<br>
<input type="text" name="address" value="<%=resultSet.getString("address") %>">
<input type="hidden" name="userid" value="<%=resultSet.getString("userid") %>">
<br>
<br>
<br><br>
<input type="submit" value="submit">
</form>


<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</body>
</html>