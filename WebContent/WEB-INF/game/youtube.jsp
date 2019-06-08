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
.papage{position:absolute; top:100px;}
.choice1{cursor:pointer;}
.h1, .h2, .h3, .h4{font-family: 'Nanum Gothic', sans-serif;}
	</style>
</head>
<body>
	<script>
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
		<div class="row my">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center h1 pb-1 font-weight-bold">
				유튜브 검색으로 더 많은 자료를 찾아보세요 <hr style="border-bottom:1px solid #fff;">
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center h4 pb-1">
				키오스크 기계 사용 뿐만 아니라 더 많은 기술들을 배우고 접할 수 있습니다 <br>
				검색창에 단어를 입력해 관심있는 분야의 <b>유튜브</b> 영상을 직접 찾아보세요
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center my">
				<form name="form1" method="post" onSubmit="return false;">
					<div class="input-group mt-3 mb-3">
						<input type="text" id="search_box" class="form-control" placeholder="검색어를 입력하세요"
							aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button" id="button-addon2" onClick="fnGetList();">찾아보기</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center my ybtn">
			  <h1 class="h3 mt-4 mb-4">키워드를 선택해보세요!</h1>
				<button type="button" class="btn btn-primary btn-lg mt-2 mr-2">키오스크</button>
				<button type="button" class="btn btn-outline-primary btn-lg mt-2 mr-2">황혼</button>
				<button type="button" class="btn btn-secondary btn-lg mt-2 mr-2">디지털</button>
				<button type="button" class="btn btn-outline-secondary btn-lg mt-2 mr-2">무인기기</button>
				<button type="button" class="btn btn-success btn-lg mt-2 mr-2">카페</button>
				<button type="button" class="btn btn-outline-success btn-lg mt-2 mr-2">노년</button>
				<button type="button" class="btn btn-danger btn-lg mt-2 mr-2">노인복지</button>
				<button type="button" class="btn btn-outline-danger btn-lg mt-2 mr-2">영화관</button>
				<button type="button" class="btn btn-warning btn-lg mt-2 mr-2">뉴스</button>
				<button type="button" class="btn btn-outline-warning btn-lg mt-2 mr-2">한글자막</button>
				<button type="button" class="btn btn-info btn-lg mt-2 mr-2">유튜브</button>
				<button type="button" class="btn btn-outline-info btn-lg mt-2 mr-2">영어 외래어 메뉴</button>
				<button type="button" class="btn btn-dark btn-lg mt-2 mr-2">건강</button>
				<button type="button" class="btn btn-outline-dark btn-lg mt-2 mr-2">청춘</button>
			</div>
			<script>
				$('.ybtn').find('.btn').on('click', function(){
					$('#search_box').val($(this).text());
				});
			</script>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center my">
				<div class="row my mt-3">
					<div class="col-lg-8 col-md-6 col-sm-12 col-xs-12 text-center my">
						<h1 class="h3 mt-4 mb-4">추천영상</h1>
							<iframe class="mb-3" width="560" height="315" src="https://www.youtube.com/embed/VpAtI2rL1cU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							<iframe class="mb-3" width="560" height="315" src="https://www.youtube.com/embed/V6CQSfqv6_o" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							<iframe class="mb-3" width="560" height="315" src="https://www.youtube.com/embed/uFPUki6dmOU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 text-center my pt-4 pb-4 youtubeSearch">	
						<div id="get_view"></div>
						<div id="nav_view"></div>
					</div>
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
	
	<script>
		function fnGetList(sGetToken){
			var $getval = $("#search_box").val();
			if($getval==""){
				alert("검색어를 입력하세요!");
				$("#search_box").focus();
				return;
			}
			$("#get_view").empty();
			$("#nav_view").empty()


			var sTargetUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&order=relevance"
								+ "&q="+ encodeURIComponent($getval) +"&key=AIzaSyDewwT-s4TpkxoHRI206lpWrq7tl6jeQSk";
			if(sGetToken){
				sTargetUrl += "&pageToken="+sGetToken;
			}
			$.ajax({
				type: "POST",
				url: sTargetUrl,
				dataType: "jsonp",
				success: function(jdata) {
					console.log(jdata);

					$(jdata.items).each(function(i){
						//console.log(this.snippet.channelId);
						$("#get_view").append("<p class='box'><a href='https://youtu.be/"+this.id.videoId+"' target='_blank'><img src='"+this.snippet.thumbnails.default.url+"'><p class='h4 font-weight-bold text-white pb-3'>"+this.snippet.title+"</p></a></p>");
					}).promise().done(function(){
						if(jdata.prevPageToken){
							$("#nav_view").append("<button type='button' class='btn btn-primary mr-2'><a class='text-white' href='javascript:fnGetList(\""+jdata.prevPageToken+"\");'>이전페이지</a></button>");
						}
						if(jdata.nextPageToken){
							$("#nav_view").append("<button type='button' class='btn btn-primary'><a class='text-white' href='javascript:fnGetList(\""+jdata.nextPageToken+"\");'>다음페이지</a></button>");
						}
					});
				},
				error:function(xhr, textStatus) {
					console.log(xhr.responseText);
					alert("오류가 발생했습니다. 잠시 후 다시 접속하세요.");
					return;
				}
			});
		}
	</script>
	
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>