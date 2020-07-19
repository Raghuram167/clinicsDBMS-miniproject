<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String eid=request.getParameter("eid");
String name=request.getParameter("name");
String salary=request.getParameter("salary");
String email=request.getParameter("email");
String city=request.getParameter("city");
 String userid=(String)session.getAttribute("userid"); 
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into receptionist(eid,name,salary,email,city,userid)values('"+eid+"','"+name+"','"+salary+"','"+email+"','"+city+"','"+userid+"')");
response.sendRedirect("logrecep.html");
}
catch(Exception e)
{response.sendRedirect("error.html");
System.out.print(e);
e.printStackTrace();
}
%>