<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String eid=request.getParameter("eid");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");
Statement st=conn.createStatement();
int i=st.executeUpdate("delete from receptionist WHERE eid='"+eid+"'");
response.sendRedirect("disprecep.jsp");
}
catch(Exception e)
{
	System.out.print(e);
	e.printStackTrace();
}
%>