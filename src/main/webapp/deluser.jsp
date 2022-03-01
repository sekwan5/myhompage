<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@page import="user.User"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="*" />

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>update3</title>
</head>
<body>

<%
String userID = (String) session.getAttribute("userID");
if(userID == null){
	response.sendRedirect("login.jsp");
}

	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	
	String sql = "delete from user where userID = ?";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String DB_URL = "jdbc:mysql://localhost:3306/hompage";
		String DB_USER = "root";
		String DB_PASSWORD= "0000";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		// pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userID);
		
		int result = pstmt.executeUpdate();
		
		if(result == 1){
			%>
			<script type="text/javascript">
			alert("탈퇴완료");
			</script>
			<%
			response.sendRedirect("main.jsp");
		} else{
			%>
			<script type="text/javascript">
			alert("-1");
			history.back();
			</script>
			<%
		}
	} catch(Exception e){
		%>
		<script type="text/javascript">
		alert("-1");
		history.back();
		</script>
		<%
	} finally{
		
		} 
	
%>
	

</body>
</html>