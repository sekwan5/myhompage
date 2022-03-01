<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>update info</title>
</head>
<body>
	<%
	String userID = (String) session.getAttribute("userID");
	if(userID == null){
		response.sendRedirect("login.jsp");
	}
	
	UserDAO dao = new UserDAO();
	User us = dao.getInfo(userID);
	

		%>
	
			<form method="post" action="updateAction.jsp" name="update">
			
			아이디 <input type="text" name="userID" value="<%=us.getUserID()  %>" readonly><br>
			비밀번호 <input type="text" name="userPassword"  placeholder="비밀번호를 입력하세요" required><br>
			이름 <input type="text" name="uerName" value="<%=us.getUserName() %>"><br>
			성별 
		<input type="radio" name="userGender" value="여자"
		<% if(us.getUserGender().equals("여")){ %>
			checked
		<%}%>
		> 여자
		<input type="radio" name="userGender" value="남자"
		<% if(us.getUserGender().equals("남")){ %>
			checked
		<%}%>
		> 남자<br>
		이메일 <input type="text" name="userEmail" value="<%=us.getUserEmail() %>"><br>
		<input type="submit" value="회원정보수정하기">
			</form>

		
</body>
</html>