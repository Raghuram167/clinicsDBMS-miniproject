<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String eid=request.getParameter("eid");
String name=request.getParameter("name");
String salary=request.getParameter("salary");
String email=request.getParameter("email");
String city=request.getParameter("city");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-MN2GBQS:1521:xe","raghuram","dba123");
PreparedStatement ps = null;
ResultSet resultSet = null;
String sql="Update receptionist set name=?,salary=?,email=?,city=? where eid='"+eid+"'";
ps = conn.prepareStatement(sql);
ps.setString(1,name);
ps.setString(2,salary);
ps.setString(3,email);
ps.setString(4,city);


int i = ps.executeUpdate();
if(i > 0)
{
response.sendRedirect("disprecep.jsp");
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