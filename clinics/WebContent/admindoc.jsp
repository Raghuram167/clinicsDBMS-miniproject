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
Connection connection1 = null;
Statement statement1 = null;
ResultSet resultSet1 = null;

%>
<!DOCTYPE html>
<html>
<head><style type="text/css">
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
p{color: red;}
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
		<li><a  href="admindoc.jsp" class="active">doctors</a></li>
		<li><a  href="adminrecep.jsp">receptionist</a></li>
		<li><a href="adminserv.jsp">services</a></li>
		<li><a href="adminlogin.html">log out</a></li>
   <!-- <li><a href="calc.html">calculator</a></li>-->
	</ul>
	
</nav>
<h1>Doctors</h1>

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
statement1=connection1.createStatement();
String sql ="select * from doctor order by kmc_no";
String sql1 ="select * from pat_count";
resultSet = statement.executeQuery(sql);
resultSet1 = statement1.executeQuery(sql1);
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
resultSet1.next();
%>
</table>
<p>the number of doctors are:<%=resultSet1.getString("pcount") %></p>
<%
connection.close();
connection1.close();
} catch (Exception e) {
e.printStackTrace();
}
%>


<form action="admindocup.jsp">
<input type="number" name="kmc_no">
<button type="submit"> enter kmc no to update</button></form>
<br><br>


<form action="deldoc.jsp">
<input type="number" name="kmc_no" required>
<button type="submit"> enter kmc number to delete</button></form>


</body>
</html>