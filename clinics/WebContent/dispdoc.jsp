<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.CallableStatement" %>
<%@page import="java.sql.*" %>
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
CallableStatement cs=null;
Connection connection1 = null;
%>
<!DOCTYPE html>
<html><head><style type="text/css">body{
				background-image:url(clinic.jpg);
				background-repeat: no-repeat;
				background-size: 100%;
			}</style></head>
<body>

<h1>Doctors</h1>
<% String usr=(String)session.getAttribute("userid"); %>
user: <%=usr %>

<table border="1">
<tr>
<td>kmc number</td>
<td>name</td>
<td>City</td>
<td>speciality</td>
<td>amt paid</td>

</tr>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	 connection = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");
	 connection1 = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");

statement=connection.createStatement();
cs=connection1.prepareCall("CALL cal_amt(?,?)");
cs.setString(1,usr);

String sql ="select * from doctor where userid='"+usr+"' order by kmc_no";
resultSet = statement.executeQuery(sql);
cs.registerOutParameter(2, Types.INTEGER);
cs.executeQuery();
int avg=cs.getInt(2);
while(resultSet.next()){

//if(usr!=resultSet.getString("userid") )
//continue;

%>
<tr>
<td><%=resultSet.getString("kmc_no") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("city") %></td>
<td><%=resultSet.getString("speciality") %></td>
<td><%=resultSet.getString("amt_paid") %></td>
</tr>

 
<%
}
%></table><p>the avg amount paid to doctor is <%=avg %></p>

<%
connection.close();
connection1.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

<form action="updoc.jsp">
<input type="number" name="kmc_no">
<button type="submit"> enter kmc no to update</button></form>

</body>
</html>