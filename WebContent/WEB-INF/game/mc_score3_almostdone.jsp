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
    <link rel="stylesheet" href="Resources/css/leftMenuSliderUp.css">
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
		.lcd{min-height:700px; border:30px solid #000; border-bottom:55px solid #000; border-radius:5px; box-shadow:0 0 15px #ddd;}
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
		.bounce{-webkit-transform-origin: center bottom; transform-origin: center bottom; position:absolute; width:50px; height:50px;}
		.takeClick{cursor:pointer;}
 		#popup{background:#fff; width:100%; border:1px solid #ddd; border-radius:5px; box-shadow:0 0 15px; padding:10px; position:fixed; top:15%; z-index:9999;
    display: table-cell;
    text-align: center;
    vertical-align: middle;}
	</style>
</head>
<body>
<!-- 스크립트 시작 -->
	<script>
		$(function(){
			$('#btnBefore').on('click', function(){
				window.history.back();
			});
		});
	</script>
<!-- 스크립트 끝 -->
<!-- popup -->
	<div id="popup" class="d-none text-center">
		<h1 class="h4 mt-2 mb-2">결제방법은 영상으로 대체합니다. <br> 영상을 주의깊게 시청 후 아래 버튼을 누르세요.</h1>
		<iframe width="560" height="315" src="https://www.youtube.com/embed/xzGHzruXHbA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><br>
		<button id="close" class="text-center btn btn-primary mb-3">이곳을 눌러 결제완료를 진행하세요</button>	
	</div>
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
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center h1 pb-1 font-weight-bold">
				2단계 : 선택하고 싶은 품목을 자유롭게 골라 보세요! <hr style="border-bottom:1px solid #fff;">
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-3 my">
				<div class="row my text-center">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
						<form id="speakerForm">
							<div id="fake" style="display:none;">각 칸을 눌러 품목을 올바르게 선택했는지 확인 후, [장바구니]를 눌러 [결제하기]까지 진행하세요.</div>
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
						<p class="mb-2" style="font-size:16px; color:red;">&nbsp;&nbsp;※표시되는 가격은 실제와는 관련이 없으며, 임의 책정한 결과입니다. 정확한 가격은 매장에서 확인하세요.</p>
						<script src="Resources/js/speaker.js"></script>
<!----------machine view start----------------------------------------------->
					<div class="row my">
					<p class="mb-2" style="font-size:16px; color:red;">&nbsp;&nbsp;※표시되는 가격은 실제와는 관련이 없으며, 임의 책정한 결과입니다. 정확한 가격은 매장에서 확인하세요.</p>
						<div class="col-lg-10 col-md-12 col-sm-12 col-xs-12 pl-4 pr-4">
							<div class="row lcd" id="mcClick">
				<!-- carousel start-->
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center">
								<div id="carouselExampleIndicators" class="carousel slide my">
								  <div class="carousel-inner">
								    <div class="carousel-item active">
	    					<!-- 		탭 화면 시작-->
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center">
										  <h1 class="h3 mt-4 mb-4">선택내역을 확인하세요</h1>
											<div class="accordion" id="accordionExample">
											  <div class="card">
											    <div class="card-header" id="headingOne">
											      <h2 class="mb-0">
											        <button class="btn btn-link font-weight-bold" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
											        	메인메뉴(주메뉴) 확인하기
											        </button>
											      </h2>
											    </div>
											    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
											      <div class="card-body">
											          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center h4">
														<img id="menuImg" src="${burgerResult.imgAddr}"><i></i>
														<p class="h5 font-weight-bold" id="menuName">${burgerResult.menuName }</p>
														<p id="menuEng">${burgerResult.menuNameEng }</p>
														<p class="h5" id="price">${burgerResult.price }</p>
													  </div>
											      </div>
											    </div>
											  </div>
											  <div class="card">
											    <div class="card-header" id="headingTwo">
											      <h2 class="mb-0">
											        <button class="btn btn-link collapsed h5 font-weight-bold" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
											          	사이드메뉴 확인하기
											        </button>
											      </h2>
											    </div>
											    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
											      <div class="card-body">
											      	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center h4">
														<img id="menuImg" src="${sideResult.imgAddr}"><i></i>
														<p class="h5 font-weight-bold" id="menuName">${sideResult.menuName }</p>
														<p id="menuEng">${sideResult.menuNameEng }</p>
														<p class="h5" id="price">${sideResult.price }</p>
													  </div>
											      </div>
											    </div>
											  </div>
											  <div class="card">
											    <div class="card-header" id="headingThree">
											      <h2 class="mb-0">
											        <button class="btn btn-link collapsed h5 font-weight-bold" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
											     	    음료, 커피, 디저트 확인하기
											        </button>
											      </h2>
											    </div>
											    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
											      <div class="card-body">
											      	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center h4">
														<img id="menuImg" src="${beverageResult.imgAddr}">
														<p class="h5 font-weight-bold" id="menuName">${beverageResult.menuName }</p>
														<p id="menuEng">${beverageResult.menuNameEng }</p>
														<p class="h5" id="price">${beverageResult.price }</p>
													  </div>
											      	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center h4">
														<img id="menuImg" src="${cafeResult.imgAddr}">
														<p class="h5 font-weight-bold" id="menuName">${cafeResult.menuName }</p>
														<p id="menuEng">${cafeResult.menuNameEng }</p>
														<p class="h5" id="price">${cafeResult.price }</p>
													  </div>
											      	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center h4">
														<img id="menuImg" src="${desertResult.imgAddr}">
														<p class="h5 font-weight-bold" id="menuName">${desertResult.menuName }</p>
														<p id="menuEng">${desertResult.menuNameEng }</p>
														<p class="h5" id="price">${desertResult.price }</p>
													  </div>
											      </div>
											    </div>
											  </div>
											</div>
										</div>
							<!-- 		탭 화면 끝 -->
										<button id="btnBefore" class="btn btn-secondary mt-5 mb-5 mr-2">이전단계</button>
										<button id="slideBtn2" class="btn btn-primary mt-5 mb-5">선택완료</button>
	   							</div>
							    <div class="carousel-item">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center">
									  <h1 class="h3 mt-4 mb-4">아래는 결제될 내역입니다</h1>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center h4">
								          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center">
											<img id="menuImg" src="${burgerResult.imgAddr}"><i></i>
											<p class="h5 font-weight-bold" id="menuName">${burgerResult.menuName }</p>
											<p id="menuEng">${burgerResult.menuNameEng }</p>
											<p class="h5" id="price">${burgerResult.price }</p>
										  </div>
									      	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center h4">
												<img id="menuImg" src="${sideResult.imgAddr}"><i></i>
												<p class="h5 font-weight-bold" id="menuName">${sideResult.menuName }</p>
												<p id="menuEng">${sideResult.menuNameEng }</p>
											<p class="h5" id="price">${sideResult.price }</p>
											  </div>
										      	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center h4">
													<img id="menuImg" src="${beverageResult.imgAddr}">
													<p class="h5 font-weight-bold" id="menuName">${beverageResult.menuName }</p>
													<p id="menuEng">${beverageResult.menuNameEng }</p>
													<p class="h5" id="price">${beverageResult.price }</p>
												  </div>
										      	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center h4">
													<img id="menuImg" src="${cafeResult.imgAddr}">
													<p class="h5 font-weight-bold" id="menuName">${cafeResult.menuName }</p>
													<p id="menuEng">${cafeResult.menuNameEng }</p>
													<p class="h5" id="price">${cafeResult.price }</p>
												  </div>
										      	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center h4">
													<img id="menuImg" src="${desertResult.imgAddr}">
													<p class="h5 font-weight-bold" id="menuName">${desertResult.menuName }</p>
													<p id="menuEng">${desertResult.menuNameEng }</p>
													<p class="h5" id="price">${desertResult.price }</p>
												  </div>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center">
									    <button id="slideBtn1"class="btn btn-secondary mt-5">이전단계</button>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center">
									    <button id="ordercancel" class="btn btn-primary mt-1 mb-5 mr-2">주문취소</button>
										<button id="payButton" class="btn btn-primary mt-1 mb-5">결제하기</button>
									</div>
							    </div>
							  </div>
							</div>
						</div>
						
<script>
	$('#carouselExampleIndicators').carousel("pause");
	$('#slideBtn2').on('click', function(){
		var index = $('.carousel-inner').find('.active').index();
		$('#slideBtn2').attr({"data-target" : "#carouselExampleIndicators", "data-slide-to" : index+1});
	});
	$('#slideBtn1').on('click', function(){
		var index = $('.carousel-inner').find('.active').index();
		$('#slideBtn1').attr({"data-target" : "#carouselExampleIndicators", "data-slide-to" : index-1});
	});
	$('#ordercancel').on("click", function(){
		alert('초기화면으로 돌아갑니다');
		$(location).attr("href", "canclegame.third");
	});
	$('#payButton').on("click", function(){
		$('#popup').removeAttr("class", "d-none");
	});
	$('#close').on('click', function(){
		$('#popup').attr("class", "d-none");
		$(location).attr("href", "mc_fin.third");
	});
</script>
				<!-- carousel end-->
						</div>
						</div>
						<div class="col-lg-2 col-md-12 col-sm-12 col-xs-12 my card">
							<img class="cardImg" src="Resources/img/card.png" width="230" height="500">
						</div>
					</div>
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