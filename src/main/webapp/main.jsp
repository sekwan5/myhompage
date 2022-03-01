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
                  <h1>ABOUT</h1>
                  <div class="contents1">우리는 귀찮은 요리는 하지않습니다. 자취생이니까.</div>
                  
                  <ul class="icons">
                    <li>
                      <div class="icon_img">
                        <img src="./img/icon3.svg">
                      </div>
                      <div class="contents1_bold">집에서 먹자</div>
                      <div class="contents2">
                          코로나는 무서우니까.. 친구가 없는게아니에요
                      </div>
                      <div class="container mt-3">
                        <button type="button" class="btn btn-primary">MORE</button>
                      </div>
                    </li>
          
                    <li>
                      <div class="icon_img">
                        <img src="./img/icon2.svg">
                      </div>
                      <div class="contents1_bold">배달도 좋습니다</div>
                      <div class="contents2">
                          치킨에 맥주는 못참지ㅋㅋ
                      </div>
                      <div class="container mt-3">
                        <button type="button" class="btn btn-primary">MORE</button>
                      </div>
                    </li>
          
                    <li>
                      <div class="icon_img">
                        <img src="./img/icon1.svg">
                      </div>
                      <div class="contents1_bold">칼질 못해도 괜찮아요</div>
                      <div class="contents2">
                          저도 귀찮아서 가위많이써요
                      </div>
                      <div class="container mt-3">
                        <button type="button" class="btn btn-primary">MORE</button>
                      </div>
                    </li>
                  </ul>
                </div>
          
                <div class="main_text1" id="link_main_text1">
                  <h1>RECIPE</h1>
                  <div class="contents1">마치 기사식당에 온것같아요!</div>
                  <div class="service">
                    <div class="food_photo">
                      <img src="./img/recipe1.jpg">
                    </div>
                    <div class="contents2">
                        <div class = "recipe_01">
                          <h2>제육볶음</h2>
                          <div>
                            <a href="#" title="TIP" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-content="
                            양념이 탈것 같을때에는 물을넣어 졸이듯이 볶아줘요.">TIP</a>
                          </div>
                          <script>
                            var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
                            var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
                              return new bootstrap.Popover(popoverTriggerEl)
                            })
                            </script>
                        </div>
                        
                        재료 : 돼지고기 앞다리살, 고추장, 고춧가루, 맛술, 올리고당, <br>
                        설탕, 간장, 마늘, 굴소스, 파, 당근, 양파, 참기름 <br><br>
                        돼지고기는 부위상관 없어요 저렴한 뒷다리살 OK<br>
                        맛술,올리고당,굴소스,당근 없어도 괜찮아요. <br>
                        재료 1/3이 없는데 괜찮냐구요? 안넣어도 잘몰라요. <br><br>
                        
                        1.진간장 2큰술, 설탕 2큰술, 고춧가루 2큰술, 고추장 2큰술, 맛술 2큰술,<br>
                        물엿(올리고당) 2큰술, 굴소스 1큰술, 다진 마늘 1큰술을 넣고 양념장을 만들어요. <br>
                        2.돼지고기 앞다리살(600g) 에 양념장을 섞어줘요. <br>
                        3.대파 100g, 양파 1개, 당근 1/3개,고추 2~3개를 썰어 준비해요. <br>
                        4.팬에 기름을 두르고 고기를 볶아줘요. <br>
                        5.고기가 80% 정도 익으면 채소를 넣고 볶아주세요.<br>
                        7.양파가 투명해지면 고추, 통깨, 참기름, 후추를 넣고 잘 섞어주면 완성이에요.<br><br>

                      
                    </div>
                  </div>
                </div>
                <div class="main_text1">
                    <h1>RECIPE</h1>
                    <div class="contents1">떠오르는 밥도둑,이모 밥 한공기추가요</div>
                    <div class="service">
                      <div class="food_photo">
                        <img src="./img/recipe2.png">
                      </div>
                      <div class="contents2">
                        <div class = "recipe_01">
                          <h2>두부조림</h2>
                          <div>
                            <a href="#" title="TIP" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-content="
                            간생강을 약간 넣어줘도 좋아요.">TIP</a>
                          </div>
                          <script>
                            var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
                            var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
                              return new bootstrap.Popover(popoverTriggerEl)
                            })
                            </script>
                        </div>
                          재료 : 두부1모, 새우젓, 고춧가루, 진간장, 설탕, 물1컵, 간마늘, 대파, 청양고추, 들기름 <br><br>
                          새우젓,청양고추는 없어도 괜찮아요. <br>
                          들기름은 없으면 큰일나요. <br><br>
                          
                          1. 두부를 반으로 갈라 두께 1cm로 자르고 얇은팬에 두부를 깔아줘요. <br>
                          2. 대파, 청양고추를 송송 썰어줘요. <br>
                          4. 두부가 반쯤 잠기도록 물을 부어줘요. <br>
                          5. 새우젓1큰술,고춧가루2큰술, 진간장2큰술, 황설탕1/3큰술, 간 마늘1/2큰술, <br>
                          청양고추, 대파를 넣고 졸여준다. <br>
                          6. 양념장이 반 정도 졸아들면 들기름을 넣어 졸여줘요.<br>
                          7. 양념장이 자작할 정도까지 졸으면 불을 끄면 완성이에요.<br><br>                                        
                      </div>
                    </div>
                  </div>
                  <br><br><br>
                <div class="main_text2" id="link_main_text2">
                  <ul>
                    <li>
                      <div><h1>MORE RECIPE</h1></div>
                      <div>더 많은 레시피를 보고싶다면 </div>
                      <a href="bbs.jsp" style="text-decoration-line: none; color:white">
                      <div class="more2" style="color:white">더알아보기
                      </div></a>
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
    


    </body>
</html>