<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String pid=request.getParameter("pid");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");
Statement st=conn.createStatement();
int i=st.executeUpdate("delete from patient WHERE pid='"+pid+"'");
response.sendRedirect("disppat.jsp");
}
catch(Exception e)
{
	System.out.print(e);
	e.printStackTrace();
}
%>