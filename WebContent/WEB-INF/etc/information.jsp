
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소개합니다!</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/650a47b167.js"></script>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Audiowide|Comfortaa|Gothic+A1|Nanum+Gothic|Nanum+Gothic+Coding|Noto+Sans+KR|Poiret+One|Syncopate&display=swap')
	;

* {
	margin: 0 auto;
}

.fixedMenu {
	position: fixed;
	background: #fff;
	z-index: 999;
}

.fixedMenuNav {
	background: #007bff;
	box-shadow: 1px 1px 5px #444;
}

.fixedMenu .nav-link {
	color: #fff;
	font-weight: bold;
	
}

#logo {
	font-family: 'Poiret One', cursive;
	font-weight: bold;
	text-shadow: -1px -1px 0 #FFBF00, 1px -1px 0 #FFBF00, -1px 1px 0 #FFBF00,
		1px 1px 0 #FFBF00;
}

.fixMenu-text {
	position: relative;
	top: 10px;
}

.logoLi {
	font-family: 'Noto Sans KR', sans-serif;
	text-shadow: 0 0 1px #5882FA;
}

.logoLi:hover {
	opacity: 0.7;
}

.fixedMenu div {
	text-align: center;
	font-size: 20px;
}

.container {
	padding-top: 250px;
}

h1 {
	font-size: 3.5rem;
	font-weight: bold;
	color: #819FF7;
}

h3 {
	color: #5882FA;
	font-size: 2.0rem;
}

.headerspan {
	font-size: 1.8rem;
	color: #6E6E6E;
}

.mainspan {
	color: #6E6E6E;
	font-size: 1.5rem;
}

.containermain {
	border: 1px solid black;
	border-radius: 10px;
	border-color: #D8D8D8;
}

.footer {
	background: #b8daff;
}

.containFont {
	font-family: "Jua", sans-serif;
}

strong {
	color: #819FF7;
}

.insta {
	color: #f442b3;
}

.insta:hover {
	color: #ad2e7f;
}

.facebook {
	color: #1448e5;
}

.facebook:hover {
	color: #022a60;
}

.youtube {
	color: #ff0000;
}

.youtube:hover {
	color: #600202;
}

.twitter {
	color: #00d0ff;
}

.twitter:hover {
	color: #329bc1;
}

.connectBox {
	text-align: right;
	position: absolute;
	right: 10px;
	bottom: 1px;
}

.connect li {
	margin: 0;
}
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
</style>
</head>
<body>
	<!-- 고정메뉴 -->

	<div class="container-fluid fixedMenu">
		<div class="row fixedMenuNav">
			<div class="col-lg-1 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
			<div class="col-lg-10 col-md-12 col-sm-12 col-xs-12">
				<ul class="nav justify-content-center fixMenu-text pb-3">
					<li id="logo" class="nav-item"><a class="nav-link active"
						href="#">WUYAKO</a></li>
					<li class="nav-item logoLi"><a class="nav-link"
						href="goMain.win">메인페이지</a></li>
					<li class="nav-item logoLi"><a class="nav-link"
						href="translateMenu.go">학습하기</a></li>
					<li class="nav-item logoLi"><a class="nav-link"
						href="goInfo.win">사이트 소개</a></li>
					<li class="nav-item logoLi"><a class="nav-link"
						href="list.board03?noticeCurrentPage=1">공지사항</a></li>
					<li class="nav-item logoLi"><a class="nav-link"
						href="list.board01?freeCurrentPage=1">자유게시판</a></li>
					<li class="nav-item logoLi"><a class="nav-link"
						href="list.board02?qnaCurrentPage=1">문의하기</a></li>
					<c:if test="${type==4}">
						<li class="nav-item"><a class="nav-link" href="goAdmin.admin">관리자
								페이지</a></li>
					</c:if>
				</ul>
			</div>
			<div class="col-lg-1 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
		</div>
	</div>
	<div class="container fluid containFont">
		<div class="pb-3">
			<h1>
				우야꼬<small>에 관하여 소개합니다!</small>
			</h1>
			<hr>
		</div>
		<div class="row ">
			<div class="col-lg-6">
				<p>
					<span class="headerspan"><strong>기술</strong>은 사람을 편하게 하기 위해
						존재합니다 하지만 아이러니하게도, 우리들은 기술 발전의 홍수 속에서 더욱 더 부지런히 살지 않으면 안 되게 되었습니다
						<Strong>그러나</Strong>, 모두가 앞만 보고 달려가는 무한경쟁 사회에선 그 레이스에 발맞추기 힘든 이들이
						생기기 마련입니다 </span>
				</p>
				<p>
					<span class="headerspan">오늘날 사회문제로 떠오른 디지털 소외계층도 그 일부라고 할 수
						있습니다. 대표적으로 <Strong>노인계층</Strong>을 들 수 있습니다.
					</span>
				</p>
				<p>
					<span class="headerspan"> 한국을 비롯한 전 세계는 고령화에 접어들고 있습니다. 이는
						더이상 개인이난 한 지역의 책임으로 돌릴 수 없습니다. 어떻게 이들을 끌어안아 함께 발맞춰갈 수 있을까? 이는 우리
						모두가 당면한 <Strong>문제</Strong>며, 당연히 고민해봐야 할 과제입니다
					</span>
				</p>
				<p>
					<span class="headerspan"> 그래서, 우리 <Strong>우야꼬</Strong>는 디지털
						소외계층에 대한 해결책 중 하나로 교육을 제시하고자 합니다. 웹이라는 세상에서, 시간과 공간에 큰 제약을 받지 않고도
						새로운 기술들을 접하고 배울 수 있는 컨텐츠를 만들었습니다.
					</span>
				</p>

			</div>
			<div class="col-lg-6">
				<div>
					<iframe width="80%" height="315"
						src="https://www.youtube.com/embed/bV6mNHSCdWs" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
				</div>
			</div>
		</div>
		<div class="containermain mt-4">
			<div class="row m-4">

				<div class="col-lg-6">
					<div style="width: 80%">
						<h3>누가 우야꼬를 사용하나요?</h3>
						<img class="rounded" src="Resources/img/information1.png"
							alt="왜안나오죵" width="384px" height="210px">
						<p class="mt-2">
							<span class="mainspan"><strong>우야꼬</strong>는 주로 디지털 소외계층을
								위해 만들어 졌습니다. 실제 상황 에서는 주변의 따가운 시선과 압박으로 연습은 커녕 주문할 기회조차 얻지 못하는
								분들을 위한 사이트 입니다. 우야꼬는 가정, 학원, 노인정, 지역센터, 도서관 등 다양하고 접하기 쉬운 환경에서
								디지털 소외계층 분들에게 제공될 것 입니다. </span>
						</p>
					</div>
				</div>

				
				<div class="col-lg-6  ">
					<div style="width: 80%">
						<h3 class="mt-3">다양한 환경</h3>
						<img class="rounded" src="Resources/img/information2.png"
							width="384px" height="210px">
						<p class="mt-2">
							<span class="mainspan"><strong>우야꼬</strong> 는 인터넷 접속, 회원
								가입, 인터넷과 관련된 모든 것에 힘들어 하시는 디지털 소외계층 분들을 위해 우야꼬는 가정, 학원, 노인정,
								지역센터, 도서관 등 다양하고 접하기 쉬운 환경과 도움을 드릴 수 있는 직원분들을 통해 지원을 받으실 수 있습니다.
							</span>
						</p>
					</div>
				</div>
				<div class="col-lg-6">
					<div style="width: 80%">
						<h3 class="mt-3">학교에서 쓰이는 우야꼬</h3>
						<img class="rounded" src="Resources/img/information3.png"
							alt="왜안나오죵">
						<p class="mt-2">
							<span class="mainspan"><strong>우야꼬</strong>는 디지털 소외계층 분들을
								위한 것입니다. 하지만 이 디지털 소외계층은 노년층만 해당하는 것이 아닙니다. 초등학생이나 유치원생들 또한 이러한
								키오스크를 접할 기회가 적기 때문에, 수업시간에 우야꼬를 통한 교육으로 빠른 성취를 이룰 수 있을것입니다.</span>
						</p>
					</div>
				</div>
				<div class="col-lg-6">
					<div style="width: 80%">
						<h3 class="mt-3">우야꼬에 대하여 자세히 알아보기</h3>
						<img class="rounded" src="Resources/img/info_ke.png"
							alt="왜안나오죵" height="210px">
						<p class="mt-2">
							<span class="mainspan"><strong>우야꼬</strong>는 여러 브랜드의 키오스크를
								연습하고 경험할 수 있는 사이트 입니다. 손쉬운 접근과 다양한 부가기능 제공으로 실제 상황이 되어도 좀더 편안한
								마음으로 키오스크를 사용 할 수 있게끔 만들어 드립니다. </span>
						</p>
					</div>
				</div>
				
				<div class="col-lg-6">
					<div style="width: 80%">
						<h3 class="mt-3">지원 및 자금 후원</h3>

						<p class="mt-2">
							<span class="mainspan"><strong>우야꼬</strong> 프로젝트는 National
								Science Foundation, Scratch Foundation, Siegel Family Endowment,
								Google, LEGO Foundation, Intel, Cartoon Network, Lemann
								Foundation, MacArthur Foundation의 재정적 지원을 받아왔습니다. 더 많은 정보는 기여자
								페이지에서 확인하십시오. 만약 우야꼬를 지원하고 싶으시다면, 우야꼬 재단 기부 페이지를 방문하시거나,
								donate@assembly.mit.edu로 문의하십시오.</span>
						</p>
					</div>
				</div>
				<div class="col-lg-6">
					<div style="width: 80%">
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid footer pt-5">
		<div class="row pt-2 pb-5">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 text-center">
				<div class="">
					<span class="logo"><img src="/Resources/img/logo.png"
						width="150px" height="100px"></span>
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
						<li class="nav-item"><a href="#"
							class="nav-link active insta"><i
								class="fab fa-instagram fa-3x"></i></a></li>
						<li class="nav-item"><a href="#" class="nav-link facebook"><i
								class="fab fa-facebook-square fa-3x"></i></a></li>
						<li class="nav-item"><a href="#" class="nav-link youtube "><i
								class="fab fa-youtube fa-3x"></i></a></li>
						<li class="nav-item"><a href="#" class="nav-link twitter "><i
								class="fab fa-twitter-square fa-3x"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

</body>
</html>