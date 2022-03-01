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


	
	String p_name = request.getParameter("p_name");
	String p_count = request.getParameter("p_count");
	int int_p_count = Integer.parseInt(p_count);
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	String sql1 = "select p_count from product where p_name = ?";
	String sql2 = "update product set p_count = ? where p_name = ?";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String DB_URL = "jdbc:mysql://localhost:3306/ems_demo";
		String DB_USER = "root";
		String DB_PASSWORD= "0000";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		// pstmt 생성
		pstmt = conn.prepareStatement(sql1);
		pstmt.setString(1, p_name);
				
		rs = pstmt.executeQuery();
		
        while(rs.next()){
            int c = rs.getInt("p_count");
            pstmt = conn.prepareStatement(sql2);
            pstmt.setInt(1, c+int_p_count);
            pstmt.setString(2, p_name);
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
            
        }
	}catch(Exception e){
		%>
		<script type="text/javascript">
		alert("싪");
		history.back();
		</script>
		<%
	}

 	finally{
		
		} 
	
%>
	

</body>
</html>