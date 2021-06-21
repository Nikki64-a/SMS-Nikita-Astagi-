<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Data Management System</title>
</head>
<body>
<style>
body{
background-image:url('img.jpg');
}
</style>
</body>
</html>
<%@ page import ="java.sql.*" %>
<% 
String userid = request.getParameter("uname");    
String pwd = request.getParameter("pass");
//String confirm_pass=request.getParameter("confirm_pass");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:33065/test100",
"root", "admin");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from members where uname='" + userid + "'and pass='" + pwd + "'");
  if(rs.next()) {
session.setAttribute("userid", userid);
response.sendRedirect("index1.jsp");
} else {
out.println("password not matched..<a href='index.jsp'>try again</a>");		
}
  %>

