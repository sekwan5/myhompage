<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html> 
<html lan="ko">
    <head>
	<meta charset="UTF-8">
        <title>Sekwan's recipe</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta name="viewport" content="width-device-width", initial-scale="1">
		<link rel="stylesheet"  type="text/css" href="bootstrap.css">
    </head>
    <body>
   <%
		// 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		//해당 'bbsID'에 대한 게시글을 가져온 다음 세션을 통하여 작성자 본인이 맞는지 체크한다
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
	%>
     <div class="wrap" id="top">
            <div class="intro_bg">
            				<%
				// 로그인 하지 않았을 때 보여지는 화면
				if(userID == null){
			%>
                <div class="header" id="link_header">	
                    <ul class="nav">
                        <li><a href="main.jsp">HOME</a></li>
                        <li><a href="#link_main_text0">ABOUT</a></li>
                        <li><a href="bbs.jsp">RECIPE</a></li>
						<li><a href="login.jsp">LOGIN</a></li>
 						<li><a href="join.jsp">JOIN</a></li>
                    </ul>
                    <div class="search_area">
                        <form>
                        <input type="search" placeholder="Search">
                        <span>검색</span>
                    </form>
                    </div>
                </div>
              
              		<%
				// 로그인이 되어 있는 상태에서 보여주는 화면
				}else if (userID.equals("admin")){
					%>
					 <div class="header" id="link_header">	
			 		<ul class="nav">
                        <li><a href="main.jsp">HOME</a></li>
                        <li><a href="#link_main_text0">ABOUT</a></li>
                        <li><a href="bbs.jsp">RECIPE</a></li>
						<li><a href="logoutAction.jsp">LOGOUT</a></li>
						<li><a href="admin.jsp">ADMIN</a></li>

                    </ul>
                    <div class="search_area">
                        <form>
                        <input type="search" placeholder="Search">
                        <span>검색</span>
                    </form>
                    </div>
                </div>
                <%
				} else {
				%>            
			    <div class="header" id="link_header">	
			 		<ul class="nav">
                        <li><a href="main.jsp">HOME</a></li>
                        <li><a href="#link_main_text0">ABOUT</a></li>
                        <li><a href="bbs.jsp">RECIPE</a></li>
						<li><a href="logoutAction.jsp">LOGOUT</a></li>
						<li><a href="myinfo.jsp">MYINFO</a></li>

                    </ul>
                    <div class="search_area">
                        <form>
                        <input type="search" placeholder="Search">
                        <span>검색</span>
                    	</form>
                    </div>
                </div>
                <%
				}
			%>
              
                <div class="intro_text">
                    <h1>백개의 레시피</h1>
                    <h4 class="contents1">자취생의 야매요리 오늘부터 시작합니다.</h4>
                  </div>
                </div>
               
                <!-- intro end-->
                <ul class="amount">
                  <li>
                    <div>
                      <div class="contents1">레시피 개수</div>
                      <div class="result">2</div>
                    </div>
                  </li>
                  <li>
                    <div>
                      <div class="contents1">성공한 레시피 개수</div>
                      <div class="result">2</div>
                    </div>
                  </li>
                  <li>
                    <div>
                      <div class="contents1">실패한 레시피 개수</div>
                      <div class="result">0</div>
                    </div>
                  </li>
                  <li>
                      <div>
                        <div class="contents1">술안주로 good</div>
                        <div class="result">2</div>
                      </div>
                  </li>
                </ul>
                <!-- amount end -->
                
		<div class="container">
		<div class="row">
			<form method="post" action="updatebbsAction.jsp?bbsID=<%= bbsID %>">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"
								value="<%=bbs.getBbsTitle() %>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048"
								style="height: 350px;"><%=bbs.getBbsContent() %></textarea></td>
						</tr>
					</tbody>
				</table>
				<!-- 글쓰기 버튼 생성 -->
				<input type="submit" class="btn btn-secondary" style="width:80px; margin-left:90%; " value="수정하기 ">
			</form>
		</div>
	</div>
   
                  <br><br><br>
                <div class="main_text2" id="link_main_text2">
                  <ul>
                    <li>
                      <div><h1>MORE RECIPE</h1></div>
                      <div>더 많은 레시피를 보고싶다면 </div>
                      <div class="more2">더 알아보기</div>
                    </li>
                    <li></li>
                  </ul>
                </div>
          
                <div class="footer">
                  <div>RECIPE</div>
                  <div>
                    백개의 레시피 <br>
                    Addr. 서울특별시 송파구 올림픽로 240 <br>
                    Fax/Tel. 02 - 111 -2222~3 <br>
                
                  </div>
                </div>
          
        </div>
        <a style="display:scroll;position:fixed;bottom:80px; right:30px;" rel="nofollow"
         href="#" style="font-size:2.0em"><img src="./img/up.png"></a>
     <a style="display:scroll;position:fixed;bottom:40px; right:30px;" rel="nofollow"
     href="#link_main_text2" style="font-size:2.0em"><img src="./img/down.png"></a>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


    </body>
</html>