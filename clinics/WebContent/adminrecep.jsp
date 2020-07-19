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
		<li><a  href="adminlog.jsp" > clinic</a></li>
		<li><a  href="admindoc.jsp">doctors</a></li>
		<li><a  href="adminrecep.jsp" class="active">receptionist</a></li>
		<li><a href="adminserv.jsp">services</a></li>
		<li><a href="adminlogin.html">log out</a></li>
   <!-- <li><a href="calc.html">calculator</a></li>-->
	</ul>
	
</nav>

<h3>receptionists</h3>


<table border="1">
<tr>
<td>eid</td>
<td>name</td>
<td>salary</td>
<td>email</td>
<td>city</td>
<td>userid</td>


</tr>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	 connection = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");

statement=connection.createStatement();
String sql ="select * from receptionist";
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
<td><%=resultSet.getString("userid") %></td>
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