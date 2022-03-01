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


	String p_type = request.getParameter("p_type");
	String p_name = request.getParameter("p_name");
	String p_size = request.getParameter("p_size");
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	
	String sql = "insert into product(p_type,p_name,p_size,p_date) values(?, ?, ?,now())";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String DB_URL = "jdbc:mysql://localhost:3306/ems_demo";
		String DB_USER = "root";
		String DB_PASSWORD= "0000";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		// pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, p_type);
		pstmt.setString(2, p_name);
		pstmt.setString(3, p_size);
		
		int result = pstmt.executeUpdate();
		
		if(result == 1){
			%>
			<script type="text/javascript">
			alert("등록성공");
			</script>
			<%
			response.sendRedirect("index.jsp");
		} else{
			%>
			<script type="text/javascript">
			alert("등록실패");
			history.back();
			</script>
			<%
		}
	} catch(Exception e){
		%>
		<script type="text/javascript">
		alert("실패");
		history.back();
		</script>
		<%
	} finally{
		
		} 
	
%>
	

</body>
</html>