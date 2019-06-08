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
	<script src="https://kit.fontawesome.com/650a47b167.js"></script>
<title>WUYAKO</title>
	<style>
	@import url('https://fonts.googleapis.com/css?family=Audiowide|Comfortaa|Gothic+A1|Nanum+Gothic|Nanum+Gothic+Coding|Noto+Sans+KR|Poiret+One|Syncopate&display=swap');		*{margin:0 auto;}
	*{line-height:140%;}
		.fixedMenu{position:fixed; background:#fff; z-index:999;}
		.fixedMenuNav{background:#007bff; box-shadow : 1px 1px 5px #444;}
		.fixedMenu .nav-link{color:#fff; font-weight:bold;}
		#logo{font-family: 'Poiret One', cursive; font-weight:bold; text-shadow: -1px -1px 0 #FFBF00, 1px -1px 0 #FFBF00, -1px 1px 0 #FFBF00, 1px 1px 0 #FFBF00;}
		.fixMenu-text{position: relative; top: 10px; }
		.logoLi{font-family: 'Noto Sans KR', sans-serif; text-shadow : 0 0 1px #5882FA;}
		.logoLi:hover{opacity:0.7;}
		.fixedMenu div{text-align: center; font-size:20px;} 
		.jumbotron{padding-top:180px; background:#b8daff;}
		.mainPage{padding-top:160px;} /*수정*/
		.myCard{border:none;}
		.nav-tabs .nav-link{color:#000; font-weight:bold;}
		.tab-pane{padding:30px; background:#fff; border-radius:0 0 5px 5px; border-left:1px solid #ddd; border-right:1px solid #ddd; border-bottom:1px solid #ddd;}
		.myTitle{text-align:left; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;}
		.tabStuff{font-size:13px; color:#555;}
		.myBanner img{paddingtop:10px; width:90%; height:250px; border-radius:50%;}
		.footer{background:#b8daff;}
/* 		(위쪽)수정하지 마세요 */
		.lcd{border:30px solid #000; border-bottom:55px solid #000; border-radius:5px;}
		.machine{width:100%; height:550px; background:url(img/mc_machine.png) no-repeat; background-size:cover;}
		.card{padding:10px 0px 0 0px; box-shadow:0 0 15px #ddd;}
		.cardImg{display:inline-block; margin:0 auto;}
		.menuList{height:700px; overflow-y:auto;}
		.choice{cursor:pointer;}
		td{border:1px solid #000}
		.bounce{-webkit-transform-origin: center bottom; transform-origin: center bottom; position:absolute; width:50px; height:50px; border-radius:50%; background:yellow; opacity:0.6;}
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
.h1{font-family: 'Nanum Gothic', sans-serif;}
.papage{position:absolute; top:100px;}
.choice1{cursor:pointer;}
	</style>
</head>
<body>
	<script>
		$(function(){
			$("#send").on("click", function(){
				$.ajax({
					url : "papago.go",
					type : "post",
					data : {source : $("#source").text()}
				}).done(function(resp){
					$("#result").text(resp);
				});
			});	
			$(".choice1").on("click", function(){
				$.ajax({
					url : "menupapago.go",
					type : "post",
					data : { key : $(this).find('#menuEng').text()}
				}).done(function(resp){
					$("#result").append(resp + "<br>");
				});
			});
		});
	</script>
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
	<div class="container mainPage">
		<div class="row pb-5">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center h1 pb-1 font-weight-bold">
				체험하실 단계를 선택하세요 <hr style="border-bottom:1px solid #fff;">
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center h4 pb-1">
				키오스크 기계 사용을 위한 체험을 제공해드리고 있습니다<br>
				첫 단계인 <b>지시사항에 따라 주문하기</b>를 먼저 선택해서 주문법을 익히는 것을 추천합니다
			</div>
			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 p-5 text-center">
				<div class="card">
				  <img src="Resources/img/card1.jpg" class="card-img-top">
				  <div class="card-body">
				    <h5 class="card-title font-weight-bold">지시사항에 따라 주문하기</h5>
				    <p class="card-text">지시사항에 기재된 품목을 선택해서 주문까지 완료해보세요! <br>무엇을 골라야 하는지 도와드립니다.</p>
				    <a href="goFirstStep.kiosk" class="btn btn-primary">체험하기</a>
				  </div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 p-5 text-center">
				<div class="card">
				  <img src="Resources/img/card2.png" class="card-img-top">
				  <div class="card-body">
				    <h5 class="card-title font-weight-bold">자유롭게 선택해서 주문하기</h5>
				    <p class="card-text">이제 선택하고 싶은 품목들을 자유롭게 골라보세요. <br>이 과정이 익숙해진다면 실제 매장에서도 문제 없습니다!</p>
				    <a href="startGame.third" class="btn btn-primary">체험하기</a>
				  </div>
				</div>
			</div>
		</div>
		<div class="row pb-5">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center h1 pb-1 font-weight-bold">
				메뉴 이름이 생소하신가요? <hr style="border-bottom:1px solid #fff;">
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center h4 pb-1">
				키오스크 주문 체험에 앞서, 메뉴 이름이 생소할 수 있습니다<br>
				메뉴 목록을 보며 어떤 종류의 메뉴들이 있는지 확인하세요
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-5 text-center">	
				<div class="row" style="height:600px; overflow-y:auto;">
						<c:forEach var="burger" items="${burgers }">
							<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
								<img id="menuImg" src="${burger.imgAddr}"><i></i>
								<p class="h5" id="menuName">${burger.menuName}</p>
								<p id="menuEng">${burger.menuNameEng }</p>
							</div>
						</c:forEach>
						<c:forEach var="set_menu" items="${set_menus }">
							<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
								<img id="menuImg" src="${set_menu.imgAddr}"><i></i>
								<p class="h5" id="menuName">${set_menu.menuName}</p>
								<p id="menuEng">${set_menu.menuNameEng }</p>
							</div>
						</c:forEach>
						<c:forEach var="mc_morning" items="${mc_mornings }">
							<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
								<img id="menuImg" src="${mc_morning.imgAddr}"><i></i>
								<p class="h5" id="menuName">${mc_morning.menuName}</p>
								<p id="menuEng">${mc_morning.menuNameEng }</p>
							</div>
						</c:forEach>
						<c:forEach var="happy" items="${happys }">
							<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
							<img id="menuImg" src="${happy.imgAddr}"><i></i>
							<p class="h5" id="menuName">${happy.menuName}</p>
							<p id="menuEng">${happy.menuNameEng }</p>
						</div>
					</c:forEach>
					<c:forEach var="happy_meal" items="${happy_meals }">
							<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
							<img id="menuImg" src="${happy_meal.imgAddr}"><i></i>
							<p class="h5" id="menuName">${happy_meal.menuName}</p>
							<p id="menuEng">${happy_meal.menuNameEng }</p>
						</div>
					</c:forEach>
					<c:forEach var="snack_side" items="${snack_sides }">
							<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
							<img id="menuImg" src="${snack_side.imgAddr}"><i></i>
							<p class="h5" id="menuName">${snack_side.menuName}</p>
							<p id="menuEng">${snack_side.menuNameEng }</p>
						</div>
					</c:forEach>
					<c:forEach var="mc_cafe" items="${mc_cafes }">
						<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
							<img id="menuImg" src="${mc_cafe.imgAddr}"><i></i>
							<p class="h5" id="menuName">${mc_cafe.menuName}</p>
							<p id="menuEng">${mc_cafe.menuNameEng }</p>
						</div>
					</c:forEach>
					<c:forEach var="beverage" items="${beverages }">
							<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
							<img id="menuImg" src="${beverage.imgAddr}"><i></i>
							<p class="h5" id="menuName">${beverage.menuName}</p>
							<p id="menuEng">${beverage.menuNameEng }</p>
						</div>
					</c:forEach>
					<c:forEach var="desert" items="${deserts }">
							<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
							<img id="menuImg" src="${desert.imgAddr}"><i></i>
							<p class="h5" id="menuName">${desert.menuName}</p>
							<p id="menuEng">${desert.menuNameEng }</p>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
<!-- 	footer -->
	<div class="container-fluid footer mt-5 pt-5">
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
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>