<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<% String usr=(String)session.getAttribute("userid"); %>
 <%=usr %>
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
<h1>Update data from database in jsp</h1>
<%
try{
	String kmc_no=request.getParameter("kmc_no");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	 connection = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");

statement=connection.createStatement();
String sql ="select * from doctor where kmc_no='"+kmc_no+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<form method="post" action="adup-doc.jsp">
amt paid:<br>
<input type="number" name="amt_paid" value="<%=resultSet.getString("amt_paid") %>">
<br>
<input type="hidden" name="kmc_no" value="<%=resultSet.getString("kmc_no") %>">
name:<br>
<input type="text" name="name" value="<%=resultSet.getString("name") %>">
<br>
city:<br>
<input type="text" name="city" value="<%=resultSet.getString("city") %>">
<br>
speciality:<br>
<input type="text" name="speciality" value="<%=resultSet.getString("speciality") %>">
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