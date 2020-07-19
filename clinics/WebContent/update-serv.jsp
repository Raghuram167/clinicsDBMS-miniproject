<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%

String sname=request.getParameter("sname");
String cost=request.getParameter("cost");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");
PreparedStatement ps = null;
ResultSet resultSet = null;
String sql="Update services set cost=? where sname='"+sname+"'";
ps = conn.prepareStatement(sql);
ps.setString(1,cost);


int i = ps.executeUpdate();
if(i > 0)
{
response.sendRedirect("dispserv.jsp");
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