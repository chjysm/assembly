<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<title>WUYAKO</title>
	<style>
	@import url('https://fonts.googleapis.com/css?family=Audiowide|Comfortaa|Gothic+A1|Nanum+Gothic|Nanum+Gothic+Coding|Noto+Sans+KR|Poiret+One|Syncopate&display=swap');		*{margin:0 auto;}
		.fixedMenu{position:fixed; background:#fff; z-index:999;}
		.fixedMenuNav{background:#007bff; box-shadow : 1px 1px 5px #444;}
		.fixedMenu .nav-link{color:#fff; font-weight:bold;}
		#logo{font-family: 'Poiret One', cursive; font-weight:bold; text-shadow: -1px -1px 0 #FFBF00, 1px -1px 0 #FFBF00, -1px 1px 0 #FFBF00, 1px 1px 0 #FFBF00;}
		.fixMenu-text{position: relative; top: 10px; }
		.logoLi{font-family: 'Noto Sans KR', sans-serif; text-shadow : 0 0 1px #5882FA;}
		.logoLi:hover{opacity:0.7;}
		.fixedMenu div{text-align: center; font-size:20px;} 
		.mainPage{padding-top:100px; margin-bottom:100px;} /*수정*/
		.myCard{border:none;}
		.nav-tabs .nav-link{color:#000; font-weight:bold;}
		.tab-pane{padding:30px; background:#fff; border-radius:0 0 5px 5px; border-left:1px solid #ddd; border-right:1px solid #ddd; border-bottom:1px solid #ddd;}
		.myTitle{text-align:left; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;}
		.tabStuff{font-size:13px; color:#555;}
		.myBanner img{paddingtop:10px; width:90%; height:250px; border-radius:50%;}
		.footer{background:#b8daff;}
/* 		(위쪽)수정하지 마세요 */
		.lcd{min-height:700px; min-width:600px; border:30px solid #000; border-bottom:55px solid #000; border-radius:5px; box-shadow:0 0 15px #ddd;}
		.card{padding:10px 0px 0 0px; border:none;}
		.cardImg{display:inline-block; margin:0 auto;}
		.menuList{height:700px; overflow-y:auto;}
		.choice1{cursor:pointer; border-radius:10px;}
		.bounce{-webkit-transform-origin: center bottom; transform-origin: center bottom; position:absolute; width:50px; height:50px; border-radius:50%; background:#0431B4; opacity:0.7;}
.insta{ color: #f442b3; }
.insta:hover{color: #ad2e7f;}
.facebook{color: #1448e5;}
.facebook:hover{color: #022a60;}
.youtube{color: #ff0000;}
.youtube:hover{color: #600202;}
.twitter{color:#00d0ff;}
.twitter:hover{color:#329bc1;}
.connectBox{text-align: right; position: absolute; right: 10px; bottom: 1px;}
.connect li{margin:0;}
.h1, .h2, .h3, .h4{font-family: 'Nanum Gothic', sans-serif;}
		.machine{width:100%; height:550px; background:url(Resources/img/mc_machine.png) no-repeat; background-size:cover;}
		.takeClick{cursor:pointer;}
	</style>
</head>
<body>
<!-- 스크립트 시작 -->
	<script>
	</script>
<!-- 스크립트 끝 -->
	<!-- 고정메뉴 -->
	<div class="container-fluid fixedMenu">
		<div class="row fixedMenuNav">
			<div class="col-lg-1 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
			<div class="col-lg-10 col-md-12 col-sm-12 col-xs-12">
				<ul class="nav justify-content-center fixMenu-text pb-3">
						<li id="logo" class="nav-item"><a class="nav-link active" href="#">WUYAKO</a></li>
						<li class="nav-item logoLi"><a class="nav-link" href="goMain.win">메인페이지</a></li>
						<li class="nav-item logoLi"><a class="nav-link" href="translateMenu.go">학습하기</a></li>
						<li class="nav-item logoLi"><a class="nav-link" href="goInfo.win">사이트 소개</a></li>
						<li class="nav-item logoLi"><a class="nav-link" href="list.board03?noticeCurrentPage=1">공지사항</a></li>
                        <li class="nav-item logoLi"><a class="nav-link" href="list.board01?freeCurrentPage=1">자유게시판</a></li>
                        <li class="nav-item logoLi"><a class="nav-link" href="list.board02?qnaCurrentPage=1">문의하기</a></li>
					<c:if test="${type==4}">
						<li class="nav-item"><a class="nav-link" href="goAdmin.admin">관리자 페이지</a></li>
					</c:if>
				</ul>
			</div>
			<div class="col-lg-1 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
		</div>
	</div>
<!-- 	본문 -->
	<div class="container mainPage text-center">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center h1 pb-1 font-weight-bold">
				주문이 완료되었습니다! <hr style="border-bottom:1px solid #fff;">
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-3 my">
				<div class="row my">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
						<form id="speakerForm">
							<div id="fake" style="display:none;">발급받은 영수증을 가지고 대기 후, 순번이 오면 카운터로 가서 음식을 받아가세요</div>
						    <textarea id="speakerTxt" class="text-center h3" style="width:100%; height:100%; border:none; background:none; display:block;" disabled></textarea>
								<script>
									document.getElementById('speakerTxt').value=document.getElementById('fake').innerText;
								</script>
						    <button id="play" class="btn btn-primary btn-lg mt-1 mb-3" type="submit"><img src="Resources/img/sound.png"/>&nbsp;버튼을 눌러 소리를 들어보세요</button>
						    <div style="display:none;">
						      <label for="rate">Rate</label><input type="range" min="0.5" max="2" value="1" step="0.1" id="rate">
						      <div class="rate-value">1</div>
						      <div class="clearfix"></div>
						    </div>
						    <div style="display:none;">
						      <label for="pitch">Pitch</label><input type="range" min="0" max="2" value="1" step="0.1" id="pitch">
						      <div class="pitch-value">1</div>
						      <div class="clearfix"></div>
						    </div>
						    <select id="speakerSelect" style="display:none;">
						    </select>
						</form>
						<script src="Resources/js/speaker.js"></script>
<!----------machine view start----------------------------------------------->
					<div class="row my">
						<div class="col-lg-10 col-md-12 col-sm-12 col-xs-12 pl-4 pr-4">
							<div class="row lcd" id="mcClick">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<h1 class="h3 mt-4 mb-4">주문내역을 확인하세요</h1><hr>
							          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center h4">
										<p class="h5 font-weight-bold" id="menuName">${burgerResult.menuName }</p>
										<p id="menuEng">${burgerResult.menuNameEng }</p>
										<p class="h5" id="price">${burgerResult.price }</p>
									  </div>
								      	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center h4">
											<p class="h5 font-weight-bold" id="menuName">${sideResult.menuName }</p>
											<p id="menuEng">${sideResult.menuNameEng }</p>
										<p class="h5" id="price">${sideResult.price }</p>
										  </div>
							      	 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center h4">
										<p class="h5 font-weight-bold" id="menuName">${beverageResult.menuName }</p>
										<p id="menuEng">${beverageResult.menuNameEng }</p>
										<p class="h5" id="price">${beverageResult.price }</p>
									  </div>
								      	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center h4">
											<p class="h5 font-weight-bold" id="menuName">${cafeResult.menuName }</p>
											<p id="menuEng">${cafeResult.menuNameEng }</p>
											<p class="h5" id="price">${cafeResult.price }</p>
										  </div>
								      	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center h4">
											<p class="h5 font-weight-bold" id="menuName">${desertResult.menuName }</p>
											<p id="menuEng">${desertResult.menuNameEng }</p>
											<p class="h5" id="price">${desertResult.price }</p>
										  </div>
<<<<<<< HEAD
									    <p class="h3 mt-4 mb-4">총 결제금액 : ${burgerResult.price+sideResult.price+beverageResult.price+cafeResult.price+desertResult.price }원</p>
=======
									  <p class="h3 mt-4 mb-4">총 결제금액 : ${burgerResult.price+sideResult.price+beverageResult.price+cafeResult.price+desertResult.price }원</p>
>>>>>>> 59fbec1aa6a5132b1bf5c523f70e65521451c19a
									<hr>
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
										<h1 class="h3 mt-4 mb-4">내 답안 확인하기</h1>
										<p class="h5">${dto.takeIOY }</p>
										<p class="h5">${dto.burgerNameY }</p>
										<p class="h5">${dto.sideNameY }</p>
										<p class="h5">${dto.beverageNameY }</p>
									<p class="h3 mt-3 mb-3">${dto.today } / 총 ${time }</p>
									<hr>
									<h1 class="h3 mt-4 mb-4">수고하셨습니다.<br> 이제 실제로 주변에 있는 매장을 찾아 주문해보세요!</h1>
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<button id="goMain" class="btn btn-primary mb-5 mr-2">메인으로 가기</button>
									<button id="findMap" class="btn btn-primary mb-5">지도 찾아보기</button>
								</div>
							</div>
						</div>
						<div class="col-lg-2 col-md-12 col-sm-12 col-xs-12 my card">
							<img class="cardImg" src="Resources/img/card.png" width="230" height="500">
						</div>
					</div>
					<script>

						$('#goMain').on('click', function(){
							$.ajax({
								url : "session_end.kiosk",
								type : "post"
							});
							$.ajax({
								url : "insert.st",
								type : "post",
								data:{
									brand:"mcdonald",
									answer:'${dto.takeIOY } : ${dto.burgerNameY } : ${dto.sideNameY } : ${dto.beverageNameY } : ${dto.beverageNameY } : ${dto.cafeNameY } : ${dto.desertNaemY }',
									id:'${id}'
								}
							}).done(function(){
								$(location).attr("href", "goMain.win");
							});
							
						});
						$('#findMap').on('click', function(){
							$.ajax({
								url : "session_end.kiosk",
								type : "post"
							});
							var width=window.screen.width/2-800/2;//에러 나는거 아닙니다. 강사님도 그냥 두라고 하셨어요! 
							var height=window.screen.height/2-600/2;
							open("goStoreSerch.win", "_brank","width=800px,height=600px,left="+width+",top="+height);
						});

					</script>
<!-- -------machine view end----------------------------------------------->
					</div>
				</div>
			</div>
		</div>
	</div>		
<!-- 	footer -->
	<div class="container-fluid footer pt-5">
		<div class="row pt-2 pb-5">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 text-center">
				<div class="">
					<span class="logo"><img src="/Resources/img/logo.png" width="150px" height="100px"></span>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 ">
				<div class="">
					<dl>
						<dt>Assembly(주)</dt>
						<dd>(04540)서울특별시 중구 남대문로 120 대일빌딩 2층, 3층</dd>
						<dd>대표이사: 홍길동 사업자등록번호 : 815-81-00000</dd>
						<dd>Tel: 1599-0000 Fax: 02-894-0000</dd>
						<dd>E-mail: custimerservice@aaaa.co.kr</dd>
					</dl>
				</div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
				 <div class="connectBox">
				  <ul class="nav connect">
                <li class="nav-item"><a href="#" class="nav-link active insta"><i class="fab fa-instagram fa-3x"></i></a></li>
                <li class="nav-item"><a href="#" class="nav-link facebook"><i class="fab fa-facebook-square fa-3x"></i></a></li>
                <li class="nav-item"><a href="#" class="nav-link youtube "><i class="fab fa-youtube fa-3x"></i></a></li>
                <li class="nav-item"><a href="#" class="nav-link twitter "><i class="fab fa-twitter-square fa-3x"></i></a></li>
            </ul>
            </div>
			</div>
		</div>
	</div>
</body>
</html>