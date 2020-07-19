<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String kmc_no=request.getParameter("kmc_no");
String amt_paid=request.getParameter("amt_paid");
String name=request.getParameter("name");
String city=request.getParameter("city");
String speciality=request.getParameter("speciality");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");
PreparedStatement ps = null;
ResultSet resultSet = null;
String sql="Update doctor set name=?,city=?,speciality=?,amt_paid=? where kmc_no='"+kmc_no+"'";
ps = conn.prepareStatement(sql);
ps.setString(1,name);
ps.setString(2,city);
ps.setString(3,speciality);
ps.setString(4,amt_paid);
int i = ps.executeUpdate();
if(i > 0)
{
response.sendRedirect("admindoc.jsp");
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