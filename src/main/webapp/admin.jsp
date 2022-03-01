<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>



<html>
<body>
<h1 style="text-align: center;">회원정보</h1>
<table border="1" style="margin-left: auto; margin-right: auto;">

<tr>
<td>userID</td>
<td>userPassword</td>
<td>userName</td>
<td>userGender</td>
<td>userEmail</td>
<td>update</td>
</tr>
<%

Connection conn;
PreparedStatement pstmt;
ResultSet rs;

try{
	
	Class.forName("com.mysql.jdbc.Driver");
	String DB_URL = "jdbc:mysql://localhost:3306/hompage";
	String DB_USER = "root";
	String DB_PASSWORD= "0000";
	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	String sql ="select * from user";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery(sql);
while(rs.next()){
%>
<tr>
<td><%=rs.getString("userID") %></td>
<td><%=rs.getString("userPassword") %></td>
<td><%=rs.getString("userName") %></td>
<td><%=rs.getString("userGender") %></td>
<td><%=rs.getString("userEmail") %></td>
<td><a href="update_admin.jsp?userID=<%=rs.getString("userID")%>">update</a></td>
</tr>
<%
}
conn.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>