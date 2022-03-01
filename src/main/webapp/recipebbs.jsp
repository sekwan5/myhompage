<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
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
		
		<style type="text/css">
	a, a:hover{
		color: #000000;
		text-decoration: none;
	}
</style>
    </head>
    <body>
    <%
      String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		
		int pageNumber = 1;
		
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
                        <li><a href="bbs.jsp#link_main_text0">RECIPE</a></li>
						<li><a href="login.jsp#link_main_text0">LOGIN</a></li>
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
                        <li><a href="bbs.jsp#link_main_text0">RECIPE</a></li>
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
                        <li><a href="bbs.jsp#link_main_text0">RECIPE</a></li>
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
      
          
                <div class="main_text0" id="link_main_text0">
                  <h1>레시피신청</h1>
                  
                  	<div class="container" style="width:100%">
					<div class="row">
					<div align="right">
					<form method="post" name="search" action="searchbbs.jsp">
				<table class="pull-right" >
					<tr >
						<td><select class="form-control" name="searchField">
								<option value="0">선택</option>
								<option value="bbsTitle">제목</option>
								<option value="userID">작성자</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="searchText" maxlength="100"></td>
						<td><button type="submit" class="btn btn-secondary">검색</button></td>
					</tr>

				</table>
			</form>
			</div>
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++){
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<!-- 게시글 제목을 누르면 해당 글을 볼 수 있도록 링크를 걸어둔다 -->
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>">
							<%= list.get(i).getBbsTitle() %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
							+ list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
					</tr>
					<%
						}
					%>
				</tbody>
				<tr style="background-color: white;">
					<td colspan="3" style="text-align: left;">
					<%
				if(pageNumber != 1){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>"
					class="btn btn-success btn-arraw-left">이전</a>
			<%
				}if(bbsDAO.nextPage(pageNumber + 1)){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>"
					class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
					</td>

					<td style="text-align: right;">
					<a href="write.jsp#link_main_text0" class="btn btn-secondary" >글쓰기</a>
					</td>
				</tr>
			</table>
			

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