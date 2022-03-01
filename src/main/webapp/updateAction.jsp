<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>update3</title>
</head>
<body>

<%


	String userID = request.getParameter("userID");
	String userPassword = request.getParameter("userPassword");
	String uerName = request.getParameter("uerName");
	String userGender = request.getParameter("userGender");
	String userEmail = request.getParameter("userEmail");
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	
	String sql = "update user set userPassword = ?, userName = ?,userGender = ?,userEmail= ? where userID = ?";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String DB_URL = "jdbc:mysql://localhost:3306/hompage";
		String DB_USER = "root";
		String DB_PASSWORD= "0000";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		// pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userPassword);
		pstmt.setString(2, uerName);
		pstmt.setString(3, userGender);
		pstmt.setString(4, userEmail);
		pstmt.setString(5, userID);
		
		int result = pstmt.executeUpdate();
		
		if(result == 1){
			%>
			<script type="text/javascript">
			alert("회원정보수정 성공");
			</script>
			<%
			response.sendRedirect("main.jsp");
		} else{
			%>
			<script type="text/javascript">
			alert("실패 메롱");
			history.back();
			</script>
			<%
		}
	} catch(Exception e){
		%>
		<script type="text/javascript">
		alert("싪");
		history.back();
		</script>
		<%
	} finally{
		
		} 
	
%>
	

</body>
</html>