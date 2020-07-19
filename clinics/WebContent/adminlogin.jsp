<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>logged in as admin</title>
</head>
<body>
<%
String userid=request.getParameter("userid");
String password=request.getParameter("password");

if((userid.equals("admin") && password.equals("admin")))
{
 response.sendRedirect("adminlog.jsp");
}
else
{
 response.sendRedirect("error.html");
}
%>

</body>
</html>