<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel="stylesheet" href="Resources/css/leftMenuSliderUp.css">
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
<title>학습1_3</title>
	<style>
		*{margin:0 auto;}
		.fixedMenu{position:fixed; background:#fff; z-index:999;}
		.fixedMenuNav{background:#007bff;}
		.fixedMenu .nav-link{color:#fff; font-weight:bold;}
		 .fixMenu-text{position: relative; top: 20px;}
		.fixedMenu div{text-align: center; font-size:30px;} 
		.jumbotron{padding-top:180px; background:#b8daff;}
		.mainPage{padding-top:200px; background:#F2F2F2;} /*수정*/
		.myCard{border:none;}
		.nav-tabs .nav-link{color:#000; font-weight:bold;}
		.tab-pane{padding:30px; background:#fff; border-radius:0 0 5px 5px; border-left:1px solid #ddd; border-right:1px solid #ddd; border-bottom:1px solid #ddd;}
		.myTitle{text-align:left; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;}
		.tabStuff{font-size:13px; color:#555;}
		.myBanner img{padding-top:10px; width:90%; height:250px; border-radius:50%;}
		.footer{background:#b8daff;}
/* 		(위쪽)수정하지 마세요 */
		.my{border:1px solid #000;}
		.lcd{border:30px solid #000; border-bottom:55px solid #000; border-radius:5px;}
		.machine{width:100%; height:550px; background:url(img/Resources/mc_machine.png) no-repeat; background-size:cover;}
		.card{padding:10px 0px 0 0px;}
		.cardImg{display:inline-block; margin:0 auto;}
		.menuList{height:700px; overflow-y:auto;}
		.choice{cursor:pointer;}
		.bounce{-webkit-transform-origin: center bottom; transform-origin: center bottom; position:absolute; width:50px; height:50px; border-radius:50%; background:yellow; opacity:0.6;}
	</style>
</head>
<body>
<!-- 스크립트 시작 -->
	<script>
		$(function(){
			$('#btnBefore').on('click', function(){
				$(location).attr('href', 'mc_score1_2.jsp');
			}); //뒤로가면 이전 단계로 새로고침
			$('.device-slider__item img').on('click', function(){
				$('.device-slider__item img').css("opacity", "0.4");
				$(this).css("opacity", "1.0");
			});
			$('.choice1').on('click', function(){
				$('.choice1').css("background", "none");
				$(this).css("background", "rgba(0,0,0,0.6)");
			});
		});
	</script>
<!-- 스크립트 끝 -->
<!-- 고정메뉴 -->
<div class="container-fluid fixedMenu">
		<div class="row fixedMenuNav p-2">
			<div class="col-lg-2 col-md-3 col-sm-12 col-xs-12 " ><img src="/Resources/img/logo.png" width="150px" height="100px"></div>
			<div class="col-lg-8 col-md-9 col-sm-12 col-xs-12">
				<ul class="nav justify-content-center fixMenu-text">
				<li class="nav-item"><a class="nav-link active" href="goMain.win">메인페이지</a></li>
					<li class="nav-item"><a class="nav-link" href="startGame.kiosk">학습하기</a></li>
					<li class="nav-item"><a class="nav-link" href="goInfo.win">사이트 소개</a></li>
					<li class="nav-item"><a class="nav-link" href="list.board03?noticeCurrentPage=1">공지사항</a></li>
                        <li class="nav-item"><a class="nav-link" href="list.board01?freeCurrentPage=1">자유게시판</a></li>
                        <li class="nav-item"><a class="nav-link" href="list.board02?qnaCurrentPage=1">문의하기</a></li>
					<c:if test="${type==4}">
						<li class="nav-item"><a class="nav-link" href="goAdmin.admin">관리자 게시판</a></li>
					</c:if>
				</ul>
			</div>
			<div class="col-lg-2 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
		</div>
	</div>

<!-- 	본문 -->
	<div class="container mainPage">
		<div class="row my text-center">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-3 my">
				<div class="row my">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
						광고
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
						<form id="speakerForm">
							<div id="fake" style="display:none;">${burgers.get(Math.floor(Math.random()*(5+1))).menuName }</div>
						    <input type="text" id="speakerTxt" class="text-center" style="width:100%; border:none; background:none;" disabled>
								<script>
									document.getElementById('speakerTxt').value="①왼쪽 메뉴에서 '버거'를 고르고, ②"+document.getElementById('fake').innerText+" 를 선택한 후, ③[다음]버튼을 누르세요";
								</script>
						    <button id="play" type="submit">Play</button>
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
						<div class="col-lg-10 col-md-12 col-sm-12 col-xs-12">
							<div class="row lcd">
					<!-- 	좌측메뉴 슬라이드 시작 -->
								<div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 my">
							      <div class="device-slider js-device-slider">
							          <button type="button" class="device-slider__up js-device-slider-up"></button>
							          <button type="button" class="device-slider__down js-device-slider-down"></button>
							        <div class="device-slider__wrapper">
							          <ul class="device-slider__list js-device-slider-list">
							            <li class="device-slider__item selected active">
							               <img src="Resources/img/mcdonald1.jpg"/>
							            </li>
							            <li class="device-slider__item">
							               	<img src="Resources/img/menu1.png"/>
							            </li>
							            <li class="device-slider__item">
							               <img src="Resources/img/menu2.png"/>
							            </li>
							            <li class="device-slider__item">
							               <img src="Resources/img/menu3.png"/>
							            </li>
							            <li class="device-slider__item">
							               <img src="Resources/img/menu4.png"/>
							            </li>
							            <li class="device-slider__item">
							               <img src="Resources/img/menu5.png"/>
							            </li>
							            <li class="device-slider__item">
							               <img src="Resources/img/mcdonald1.jpg"/>
							            </li>
							          </ul>
							        </div>
							      </div>
							  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
							  <script  src="Resources/js/leftMenuSliderUp.js"></script> 
							</div>	
				<!-- 	좌측메뉴 슬라이드 끝 -->
				<!-- 	우측메뉴 슬라이드 시작 -->
						<div class="col-lg-9 col-md-6 col-sm-6 col-xs-6 my">
							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my menuList">
								  <h1 class="h1">(1)메인메뉴 주문하기</h1>
									<div class="row">
										<c:forEach var="burger" items="${burgers }">
											<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 my text-center choice1">
												<img id="menuImg" src="${burger.imgAddr}"><i></i>
												<p class="h5" id="menuName">${burger.menuName }</p>
												<p id="menuEng">${burger.menuNameEng }</p>
												<p class="h5" id="price">${burger.price }원</p>
											</div>
										</c:forEach>
									</div>
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my nextAnimated">
									<button id="btnBefore">이전</button>
									<button class="nextViewBtn d-none">다음</button><i></i>
								</div>
							</div>
						</div>
						<script>
							$(function(){
								var burgerNameY;
								$('.device-slider__item:nth-child(2)').prepend("<span class='animated infinite bounce'></span>");
								$('.device-slider__item:nth-child(2)').on("click", function(){
									$('.device-slider__item').css("pointer-events","none");
									var boxValue = $('#fake').text();
									var result = $('.choice1').find('#menuName');
									var tag="<span class='animated infinite bounce'></span>";
									for(var i=0; i<$('.choice1').length; i++){
										if(result[i].textContent==boxValue){
											$( ".animated" ).remove();
											$('.choice1').find('i')[i].innerHTML=tag;
											break;
										}
									}
									$('.animated').parent().parent().on("click", function(){
										burgerNameY=$('.animated').parent().parent().find('#menuName').html();
// 										console.log(chooseBurgerY);
										$( ".animated" ).remove();
										$('.choice1').css("pointer-events","none");
										$('.nextViewBtn').removeAttr("class", "d-none");
										$('.nextAnimated').find('i').append("<span class='animated infinite bounce'></span>");
									});
								});
								$('.nextViewBtn').on('click', function(){
									$.ajax({
										url : "burger_value.kiosk",
										type : "post",
										data : {key1 : $('#fake').html(), key2 : burgerNameY}
									}).done(function(resp){
										alert(resp);
									});
									$(location).attr('href', 'mc_sideMenu.kiosk');
								});
							});
						</script>
				<!-- 	우측메뉴 슬라이드 끝 -->
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
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
				<div class="">
					<span class="logo">Logo</span>
					<dl>
						<dt>Assembly(주)</dt>
						<dd>(04540)서울특별시 중구 남대문로 120 대일빌딩 2층, 3층</dd>
						<dd>대표이사: 홍길동 사업자등록번호 : 815-81-00000</dd>
						<dd>Tel: 1599-0000 Fax: 02-894-0000</dd>
						<dd>E-mail: custimerservice@aaaa.co.kr</dd>
					</dl>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>