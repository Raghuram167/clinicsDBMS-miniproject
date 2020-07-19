<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String userid = request.getParameter("userid");
session.setAttribute("userid",userid);
String password = request.getParameter("password");
Class.forName("oracle.jdbc.driver.OracleDriver");
java.sql.Connection con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from register_clinic where userid='"+userid+"' and password='"+password+"'");
try{
	rs.next();
	if(rs.getString("password").equals(password) && rs.getString("userid").equals(userid))
	{
 	response.sendRedirect("afterlog.jsp");
	}
	else{
	out.println("Invalid password or username.");
	}
	}
	catch (Exception e) {
		response.sendRedirect("error.html");
}
%>