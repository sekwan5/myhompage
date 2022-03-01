<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY</title>
</head>
<body>
	<%
	String userID = (String) session.getAttribute("userID");
	if(userID == null){
		response.sendRedirect("login.jsp");
	}
	
	UserDAO dao = new UserDAO();
	User us = dao.getInfo(userID);
	
	if (us != null) {
		%>
		<h2>MYINFO</h2>
<table border="1">
	<tr>
		<td>아이디</td>
		<td><%=us.getUserID() %></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><%=us.getUserPassword() %></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=us.getUserName() %></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><%=us.getUserGender() %></td>
	</tr>
	<tr>
		<td>성별</td>
		<td><%=us.getUserEmail() %></td>
	</tr>
	<tr>
		<td><input type="button" value="뒤로가기" onclick="location.href='main.jsp'"></td>
		<td><input type="button" value="회원정보수정" onclick="location.href='update.jsp'"></td>
		
	</tr>
	
	 
	
	
	
</table>
<% 
} 
%>
	

</body>
</html>