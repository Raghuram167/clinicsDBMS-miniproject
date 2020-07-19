<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String sname=request.getParameter("sname");
String cost=request.getParameter("cost");
 String userid=(String)session.getAttribute("userid"); 
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into services(sname,userid,cost)values('"+sname+"','"+userid+"','"+cost+"')");
response.sendRedirect("logserv.html");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>