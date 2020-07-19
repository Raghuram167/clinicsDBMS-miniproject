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
<meta charset="ISO-8859-1">
<title>admin logged in</title>
<style type="text/css">
 nav ul{ list-style: none;text-align: center; padding: 0; margin: 0,10px;}
  li a {
    display: block;
    color: black;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-size: 18px;
    font-family: Comic Sans MS;
  }

  nav a{text-decoration:none;}
    nav li{display: inline-block;}

  nav a:hover{
    background-color: black;
    color: white;
    border-radius: 15px;
    opacity: 0.8;
  }
  li a.active{

    background-color: red;
    color: black;
    border-radius: 15px;}
    body{
				background-image:url(clinic.jpg);
				background-repeat: no-repeat;
				background-size: 100%;
			}

</style>
</head>
<body>
<nav>
  <ul>
		<li><a  href="adminlog.jsp" class="active"> clinic</a></li>
		<li><a  href="admindoc.jsp">doctors</a></li>
		<li><a  href="adminrecep.jsp">receptionist</a></li>
		<li><a href="adminserv.jsp">services</a></li>
		<li><a href="adminlogin.html">log out</a></li>
   <!-- <li><a href="calc.html">calculator</a></li>-->
	</ul>
	
</nav>

<h3>clinics</h3>


<table border="1">
<tr>
<td>name</td>
<td>email</td>
<td>clinic name</td>
<td>clinic type</td>
<td>address</td>
<td>userid</td>
<td>password</td>

</tr>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	 connection = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");

statement=connection.createStatement();
String sql ="select * from register_clinic";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){

//if(usr!=resultSet.getString("userid") )
//continue;

%>
<tr>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("clinicname") %></td>
<td><%=resultSet.getString("clinictype") %></td>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("userid") %></td>
<td><%=resultSet.getString("password") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<form action="adminclinup.jsp">
<input type="text" name="userid">
<button type="submit"> enter user id to update</button></form>
<br><br>



</body>
</html>