<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String name=request.getParameter("name");
String clinicname=request.getParameter("clinicname");
String email=request.getParameter("email");
String clinictype=request.getParameter("clinictype");
String address=request.getParameter("address");
String userid=request.getParameter("userid");
String password=request.getParameter("password");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into register_clinic(name,email,clinicname,clinictype,address,userid,password)values('"+name+"','"+email+"','"+clinicname+"','"+clinictype+"','"+address+"','"+userid+"','"+password+"')");
out.println("Thank you for register ! Please <a href='login.html'>Login</a> to continue.");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>