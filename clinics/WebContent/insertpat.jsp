<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String pid=request.getParameter("pid");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String gender=request.getParameter("gender");
String city=request.getParameter("city");
String casedetails=request.getParameter("casedetails");
 String userid=(String)session.getAttribute("userid"); 
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into patient(pid,fname,lname,gender,city,casedetails,userid)values('"+pid+"','"+fname+"','"+lname+"','"+gender+"','"+city+"','"+casedetails+"','"+userid+"')");
response.sendRedirect("logpat.html");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>