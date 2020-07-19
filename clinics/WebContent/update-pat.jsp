<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String pid=request.getParameter("pid");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String gender=request.getParameter("gender");
String city=request.getParameter("city");
String casedetails=request.getParameter("casedetails");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");
PreparedStatement ps = null;
ResultSet resultSet = null;
String sql="Update patient set fname=?,lname=?,gender=?,city=?,casedetails=? where pid='"+pid+"'";
ps = conn.prepareStatement(sql);
ps.setString(1,fname);
ps.setString(2,lname);
ps.setString(3,gender);
ps.setString(4,city);
ps.setString(5,casedetails);

int i = ps.executeUpdate();
if(i > 0)
{
response.sendRedirect("disppat.jsp");
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