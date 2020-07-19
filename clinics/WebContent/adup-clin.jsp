<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String clinicname=request.getParameter("clinicname");
String clinictype=request.getParameter("clinictype");
String address=request.getParameter("address");
String userid=request.getParameter("userid");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");
PreparedStatement ps = null;
ResultSet resultSet = null;
String sql="Update register_clinic set name=?,email=?,clinicname=?,clinictype=?,address=? where userid='"+userid+"'";
ps = conn.prepareStatement(sql);
ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,clinicname);
ps.setString(4,clinictype);
ps.setString(5,address);
int i = ps.executeUpdate();
if(i > 0)
{
response.sendRedirect("adminlog.jsp");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}

%>