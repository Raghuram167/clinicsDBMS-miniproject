<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String kmc_no=request.getParameter("kmc_no");
String name=request.getParameter("name");
String city=request.getParameter("city");
String speciality=request.getParameter("speciality");
String amt_paid=request.getParameter("amt_paid");
 String userid=(String)session.getAttribute("userid"); 
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into doctor(kmc_no,name,city,speciality,amt_paid,userid)values('"+kmc_no+"','"+name+"','"+city+"','"+speciality+"','"+amt_paid+"','"+userid+"')");
response.sendRedirect("logdoc.html");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>