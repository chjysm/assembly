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
    <link rel="stylesheet" href="css/leftMenuSliderUp.css">
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
<title>학습1_7</title>
	<style>
		*{margin:0 auto;}
		.fixedMenu{position:fixed; background:#fff; z-index:999;}
		.fixedMenuNav{background:#007bff;}
		.fixedMenu .nav-link{color:#fff; font-weight:bold;}
		.jumbotron{padding-top:180px; background:#b8daff;}
		.mainPage{padding-top:200px; background:#F2F2F2;} /*수정*/
		.myCard{border:none;}
		.nav-tabs .nav-link{color:#000; font-weight:bold;}
		.tab-pane{padding:30px; background:#fff; border-radius:0 0 5px 5px; border-left:1px solid #ddd; border-right:1px solid #ddd; border-bottom:1px solid #ddd;}
		.myTitle{text-align:left; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;}
		.tabStuff{font-size:13px; color:#555;}
		.myBanner img{paddingtop:10px; width:90%; height:250px; border-radius:50%;}
		.footer{background:#b8daff;}
/* 		(위쪽)수정하지 마세요 */
		.my{border:1px solid #000;}
		.lcd{border:30px solid #000; border-bottom:55px solid #000; border-radius:5px;}
		.machine{width:100%; height:550px; background:url(img/mc_machine.png) no-repeat; background-size:cover;}
		.card{padding:10px 0px 0 0px;}
		.cardImg{display:inline-block; margin:0 auto;}
		.menuList{height:700px; overflow-y:auto;}
		.choice{cursor:pointer;}
		td{border:1px solid #000}
		.bounce{-webkit-transform-origin: center bottom; transform-origin: center bottom; position:absolute; width:50px; height:50px; border-radius:50%; background:yellow; opacity:0.6;}
	</style>
</head>
<body>
<!-- 스크립트 시작 -->
	<script>
		$(function(){
			$('#btnBefore').on('click', function(){
				window.history.back();
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
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
			<div class="col-lg-6 col-md-6col-sm-12 col-xs-12">
				<ul class="nav justify-content-center">
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
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
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
							<div id="fake" style="display:none;">주문이 완료되었습니다! 발급받은 영수증을 가지고 대기 후, 순번이 오면 카운터로 가서 음식을 받아가세요</div>
						    <input type="text" id="speakerTxt" class="text-center" style="width:100%; border:none; background:none;" disabled>
								<script>
									document.getElementById('speakerTxt').value=document.getElementById('fake').innerText;
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
						<script src="js/speaker.js"></script>
<!----------machine view start----------------------------------------------->
					<div class="row my">
						<div class="col-lg-10 col-md-12 col-sm-12 col-xs-12 pl-4 pr-4">
							<div class="row lcd" id="mcClick">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									영수증 이미지<br>
							          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center">
										<p class="h5" id="menuName">${burgerResult.menuName }</p>
										<p id="menuEng">${burgerResult.menuNameEng }</p>
										<p class="h5" id="price">${burgerResult.price }원</p>
									  </div>
								      	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center">
											<p class="h5" id="menuName">${sideResult.menuName }</p>
											<p id="menuEng">${sideResult.menuNameEng }</p>
										<p class="h5" id="price">${sideResult.price }원</p>
										  </div>
							      	 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my text-center">
										<p class="h5" id="menuName">${beverageResult.menuName }</p>
										<p id="menuEng">${beverageResult.menuNameEng }</p>
										<p class="h5" id="price">${beverageResult.price }원</p>
									  </div>
									  <p>총 결제금액 : ${burgerResult.price+sideResult.price+beverageResult.price }원</p>
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<p>결과 확인하기</p>
									<table>
										<tr><td colspan="4">요구사항</td></tr>
										<tr>
											<td>${dto.takeIOM }</td>
											<td>${dto.burgerNameM }</td>
											<td>${dto.sideNameM }</td>
											<td>${dto.beverageNameM }</td>
										</tr>	
										<tr><td colspan="4">내 답안<td></tr>
										<tr>
											<td>${dto.takeIOY }</td>
											<td>${dto.burgerNameY }</td>
											<td>${dto.sideNameY }</td>
											<td>${dto.beverageNameY }</td>
										</tr>	
									</table>
									<hr>
									<p>${dto.today } / 총 ${time }</p>
								<p>수고하셨습니다 이제 실제로 주변에 있는 매장을 찾아 주문해보세요!</p>
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<button id="goMain">게임 메인으로 가기</button>
									<button id="comp">게임 완료하기</button>
									<button id="findMap">지도 찾아보기</button>
									
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
								date:{
									brand:"mcdonald",
									answer:"${dto.takeIOY }:${dto.burgerNameY }:${dto.sideNameY }:${dto.beverageNameY }"
								}
							}).done(function(){
								$(location).attr("href", "returnMain.kiosk");
							});
						});
						$("#comp").on('click', function(){
							$.ajax({
								url : "insert.st",
								type : "post",
								date:{
									brand:"mcdonald",
									answer:"${dto.takeIOY }:${dto.burgerNameY }:${dto.sideNameY }:${dto.beverageNameY }"
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