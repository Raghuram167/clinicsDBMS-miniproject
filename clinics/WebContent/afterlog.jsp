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
<meta name="viewport" content="width=device-width, initial-scale=1">

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
<body>
<nav>
  <ul>
		<li><a  href="#" class="active"> clinic</a></li>
		<li><a  href="logdoc.html">doctors</a></li>
		<li><a  href="logrecep.html">receptionist</a></li>
		<li><a href="logpat.html">patients</a></li>
		<li><a href="logserv.html">services</a></li>
		<li><a href="login.html">logout</a></li>
   <!-- <li><a href="calc.html">calculator</a></li>-->
 
	</ul>
	
</nav>

<% String usr=(String)session.getAttribute("userid"); %>
user: <%=usr %>

  <h1>clinic</h1>
<div>
<table border="1">
<tr>
<td>name</td>
<td>email</td>
<td>clinic name</td>
<td>clinic type</td>
<td>address</td>
<td>userid</td>


</tr>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	 connection = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");

statement=connection.createStatement();
String sql ="select * from register_clinic where userid='"+usr+"'";
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

</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</table>
</div>



   
</body>
</html> 
