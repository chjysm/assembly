<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<style>
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
}

.fixedMenu .nav-link {
	color: #fff;
	font-weight: bold;
}

.container {
	padding-top: 150px;
}

h1 {
	font-size: 3.5rem;
	font-weight: bold;
	color: #819FF7;
}

h3 {
	color: #5882FA;
	font-size: 1.8rem;
}

.headerspan {
	font-size: 1.5rem;
	color: #6E6E6E;
}

.mainspan {
	color: #6E6E6E;
	font-size: 1.2rem;
}

.containermain {
	border: 1px solid black;
	border-radius: 10px;
	border-color: #D8D8D8;
}
</style>
</head>
<body>
	<!-- 고정메뉴 -->
	<div class="container-fluid fixedMenu">
		<div class="row fixedMenuNav p-2">
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
			<div class="col-lg-6 col-md-6col-sm-12 col-xs-12">
				<ul class="nav justify-content-center">
					<li class="nav-item"><a class="nav-link active" href="#">메인페이지</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">메뉴1</a></li>
					<li class="nav-item"><a class="nav-link" href="#">메뉴2</a></li>
					<li class="nav-item"><a class="nav-link" href="#">메뉴3</a></li>
				</ul>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
		</div>
		<div class="row p-1">
			<div class="col-lg-4 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
			<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
				<div class="input-group mt-3 mb-3">
					<input type="search" class="form-control" placeholder="검색어를 입력하세요"
						aria-label="Search">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button"
							id="button-addon2">찾아보기</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
		</div>
	</div>
	<div class="container fluid">

		<div class="pb-3">

			<h1>
				스크래치<small>에 관하여 소개합니다!</small>
			</h1>
			<hr>

		</div>
		<div class="row ">
			<div class="col-lg-6">
				<p>
					<span class="headerspan"><strong>스크래치</strong>를 이용하면 인터렉티브한
						이야기, 게임, 애니메이션을 직접 만들 수 있고,그 작품을 온라인 커뮤니티에서 다른 사람들과 공유할 수 있습니다</span>
				</p>
				<p>
					<span class="headerspan"><strong>스크래치</strong>를 통해 어린이들은 창의적
						사고, 체계적 추론, 협동 작업을 배우게 됩니다. 이런 능력은 21세기를 살아가는데 필수적이죠.</span>
				</p>
				<p>
					<span class="headerspan"><strong>스크래치</strong>는 MIT 미디어랩의
						Lifelong Kindergarten Group 에서 운영하는 프로젝트이며 무료입니다!</span>
				</p>

			</div>
			<div class="col-lg-6">
				<div>
					<iframe width="80%" height="315"
						src="https://www.youtube.com/embed/cwdOMOdGgzU" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
				</div>
			</div>
		</div>
		<div class="containermain mt-4">
			<div class="row m-4">

				<div class="col-lg-6">
					<div style="width: 80%">
						<h3>누가 스크래치를 사용하나요?</h3>
						<img class="rounded" src="information1.png" alt="왜안나오죵">
						<p class="mt-2">
							<span class="mainspan"><strong>스크래치</strong>는 주로 8~16세를
								대상으로 만들어졌습니다만, 모든 연령층에서 사용하고 있습니다. 수백만의 사람들이 가정, 학교, 전시관, 도서관,
								지역 센터 등 다양한 환경에서 스크래치 프로젝트를 만들고 있습니다.</span>
						</p>
					</div>
				</div>

				<div class="col-lg-6">
					<div style="width: 80%">
						<h3>프로그래밍 교육, 프로그래밍을 통한 교육</h3>
						<div>
							<iframe width="100%" height="315"
								src="https://www.youtube.com/embed/fpBbvE0Jsz4" frameborder="0"
								allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
						</div>
					</div>
				</div>



				<div class="col-lg-6  ">
					<div style="width: 80%">
						<h3 class="mt-3">전세계의 여러 나라</h3>
						<img class="rounded" src="information2.png" alt="왜안나오죵">
						<p class="mt-2">
							<span class="mainspan"><strong>스크래치</strong>는 150개 이상의
								나라에서 40개 이상의 언어로 사용되고 있습니다. 언어를 바꾸려면 페이지의 맨 아래에 있는 메뉴를 클릭하세요.
								프로젝트 에디터에서는 페이지의 맨 위쪽에 있는 지구 모양을 클릭하세요. 번역이 되지 않은 부분을 번역하거나 번역된
								내용을 고치고 싶으시면 번역 페이지로 가 보세요</span>
						</p>
					</div>
				</div>
				<div class="col-lg-6">
					<div style="width: 80%">
						<h3 class="mt-3">학교에서 쓰이는 스크래치</h3>
						<img class="rounded" src="information3.png" alt="왜안나오죵">
						<p class="mt-2">
							<span class="mainspan">학생들은 모든 수준(초등학교에서 대학까지)과 다양한 과목(수학,
								컴퓨터 과학, 국어, 사회 등)에서 스크래치와 함께 학습하고 있습니다. 교육자들은 ScratchEd 웹사이트에서
								경험과 자료들을 공유하고, 질문을 하고, 사람들을 찾고 있습니다.</span>
						</p>
					</div>
				</div>
				<div class="col-lg-6">
					<div style="width: 80%">
						<h3 class="mt-3">???에 대하여 자세히 알아보기</h3>

						<p class="mt-2">
							<span class="mainspan">학생들은 모든 수준(초등학교에서 대학까지)과 다양한 과목(수학,
								컴퓨터 과학, 국어, 사회 등)에서 스크래치와 함께 학습하고 있습니다. 교육자들은 ScratchEd 웹사이트에서
								경험과 자료들을 공유하고, 질문을 하고, 사람들을 찾고 있습니다.</span>
						</p>
					</div>
				</div>
				<div class="col-lg-6">
					<div style="width: 80%">
						<h3 class="mt-3">지원 및 자금 후원</h3>

						<p class="mt-2">
							<span class="mainspan">스크래치 프로젝트는 National Science
								Foundation, Scratch Foundation, Siegel Family Endowment, Google,
								LEGO Foundation, Intel, Cartoon Network, Lemann Foundation,
								MacArthur Foundation의 재정적 지원을 받아왔습니다. 더 많은 정보는 기여자 페이지에서 확인하십시오.
								만약 스크래치를 지원하고 싶으시다면, 스크래치 재단 기부 페이지를 방문하시거나,
								donate@scratch.mit.edu로 문의하십시오.</span>
						</p>
					</div>
				</div>
			</div>


		</div>
	</div>
</body>
</html>