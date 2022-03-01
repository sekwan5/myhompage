<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


    </head>
    <body>
    <%
      String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
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
						<li><a href="login.jsp#link_main_text0">LOGIN</a></li>
 						<li><a href="join.jsp#link_main_text0">JOIN</a></li>
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
      
          
                <div class="main_text0" id="link_main_text0">
                  <h1>JOIN</h1>
                  <div >
                  <form method="post" action="joinAction.jsp">

					<div  style="text-align: center; margin:auto; width:200px" class="form-group" >
						<input class="form-control" type="text" placeholder="아이디" name="userID" maxlength="20">
					</div>
					<div  style="text-align: center; margin:auto; width:200px" class="form-group">
						<input class="form-control" type="password" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<div style="text-align: center; margin:auto; width:200px"class="form-group">
						<input class="form-control" type="text"  placeholder="이름" name="userName" maxlength="20">
					</div>
					<div  class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-secondary active">
								<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
							</label>
							<label class="btn btn-secondary active">
								<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
							</label>
						</div>
					</div>
					<div style="text-align: center; margin:auto; width:200px"class="form-group">
						<input class="form-control" type="email"  placeholder="이메일" name="userEmail" maxlength="20">
						</div>
					<div style="text-align: center; margin:auto; width:90px">
					<input class="btn btn-secondary " type="submit" value="회원가입">
					</div>
					
				</form>
				<br><br>
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