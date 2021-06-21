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
String user = request.getParameter("uname");    
String pwd = request.getParameter("pass");
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String email = request.getParameter("email");
String aadhar_no=request.getParameter("aadhar_no");
String confirm_pass=request.getParameter("confirm_pass");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:33065/test100","root", "admin");
Statement st = con.createStatement();
//ResultSet rs;
int i = st.executeUpdate("insert into members(first_name, last_name, email, uname, pass,regdate,aadhar_no,confirm_pass) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "',CURDATE(),'"+aadhar_no+"','"+confirm_pass+"' )");
if (i > 0 && confirm_pass.equals(pwd)) {
//session.setAttribute("userid", user);
response.sendRedirect("welcome.jsp");
// out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
} else {
	out.println("password not matched..<a href='index.jsp'>try again</a>");	
}
%>
