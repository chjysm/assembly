<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<title>Insert title here</title>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
	<style>
		*{margin:0 auto;}
		.fixedMenu{position:fixed; background:#fff; z-index:999;}
		.fixedMenuNav{background:#007bff;}
		.fixedMenu .nav-link{color:#fff; font-weight:bold;}
		.jumbotron{padding-top:180px; background:#b8daff;}
		.mainPage{margin-top:-32px; background:#F2F2F2;}
		.carousel-indicators>li{width:15px; height:15px; border-radius:50%;}
		.myCard{border:none;}
		.nav-tabs .nav-link{color:#000; font-weight:bold;}
		.tab-pane{padding:30px; background:#fff; border-radius:0 0 5px 5px; border-left:1px solid #ddd; border-right:1px solid #ddd; border-bottom:1px solid #ddd;}
		.myTitle{text-align:left; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;}
		.tabStuff{font-size:13px; color:#555;}
		.myBanner img{paddingtop:10px; width:90%; height:250px; border-radius:50%;}
		.footer{background:#b8daff;}
		.more{text-align:right;}
       	a[class="more"]{color:black;}
       	a[class="more"]{color:black; font-weight:bold;}
	</style>
	<script>
		$(function(){
			$("#emailLogout").on("click",function(){
				location.href="logout.me";
			});
			$("#getPw").on("click",function(){
// 				location.href="getPw.me";
				open("getPw.me","_brank","width=600px,height=400px")
			});
		});
	</script>
</head>
<body>
<!-- 고정메뉴 -->
	<div class="container-fluid fixedMenu">
		<div class="row fixedMenuNav p-2">
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
			<div class="col-lg-6 col-md-6col-sm-12 col-xs-12">
				<ul class="nav justify-content-center">
				  <li class="nav-item">
				    <a class="nav-link active" href="#">메인페이지</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">메뉴1</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">메뉴2</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">메뉴3</a>
				  </li>
				</ul>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
		</div>	
		<div class="row p-1">
			<div class="col-lg-4 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
			<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
				<div class="input-group mt-3 mb-3">
				  <input type="search" class="form-control" placeholder="검색어를 입력하세요" aria-label="Search">
				  <div class="input-group-append">
				    <button class="btn btn-outline-secondary" type="button" id="button-addon2">찾아보기</button>
				  </div>
				</div>
			</div>
			<div class="col-lg-4 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
		</div>	
	</div>
<!-- 	점보트론 -->
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<div class="row startPage">
				<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 pb-5 pr-2 text-center">
					 <h1 class="display-4 font-weight-bold pt-2">시작하기</h1>
					 <p class="lead font-weight-bold pb-2">새로운 디지털 기술을 체험하고 이웃들과 공유하세요!</p>
					 <hr class="my-4">
					 <p class="pb-2">처음 방문하셨나요? <br> 아래 버튼을 누르시면 여러가지 사이트 소개를 볼 수 있습니다</p>
					 <a class="btn btn-primary btn-lg mr-2" href="#" role="button">둘러보기</a>
					 <a class="btn btn-primary btn-lg" href="#" role="button">체험 시작하기</a>
				</div>
				<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 text-center">
					<iframe width="95%" height="315" src="https://www.youtube.com/embed/1BzqctRGgaU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				</div>
			</div>		
		</div>		
	</div>
<!-- 	본문 -->
	<div class="container mainPage p-5">
		<div class="row mb-5">
	<!-- 	슬라이드 -->
			<div class="col-lg-8 col-md-12 col-sm-12 col-xs-12 order-lg-1 order-2">
				<div class="bd-example">
				  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
				    <ol class="carousel-indicators">
				      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
				      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
				      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
				    </ol>
				    <div class="carousel-inner">
				      <div class="carousel-item active">
				        <img src="https://scratch.mit.edu/images/scratch-og.png" class="d-block w-100" alt="slide_img1">
				        <div class="carousel-caption d-none d-md-block">
				          <h5>First slide label</h5>
				          <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
				        </div>
				      </div>
				      <div class="carousel-item">
				        <img src="https://img.docslide.net/img/1200x630/reader008/image/20180829/5790560c1a28ab900c978eab.png" class="d-block w-100" alt="slide_img2">
				        <div class="carousel-caption d-none d-md-block">
				          <h5>Second slide label</h5>
				          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
				        </div>
				      </div>
				      <div class="carousel-item">
				        <img src="https://holyokecodes.org/wp-content/uploads/2017/11/ScratchIntro-1200.jpg" class="d-block w-100" alt="slide_img3">
				        <div class="carousel-caption d-none d-md-block">
				          <h5>Third slide label</h5>
				          <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
				        </div>
				      </div>
				    </div>
				    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
				      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				      <span class="sr-only">Previous</span>
				    </a>
				    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
				      <span class="carousel-control-next-icon" aria-hidden="true"></span>
				      <span class="sr-only">Next</span>
				    </a>
				  </div>
				</div>
			</div>
	<!-- 	로그인 폼 -->
			<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12 order-lg-2 order-1 text-center pt-3 pb-5 login">
			<c:choose>
				<c:when test="${type==1}">
               		<form>
                 		<div class="form-group pb-1">
                   			<label for="comment">안녕하세요! ${nickname}님</label>
                 		</div>
                   		<button type="button" class="btn btn-outline-secondary mr-2">마이페이지</button>
                   		<button type="button" class="btn btn-outline-secondary mr-2">회원탈퇴</button>
                   		<br><br>
                   		<a href="logout.na"><img height="49" width="150" src="nlogout.PNG"/></a>
               		</form>
            	</c:when>
            	<c:when test="${type==2}">
               		<form>
                 		<div class="form-group pb-1">
                   			<label for="comment">안녕하세요! ${nickname}님</label>
                 		</div>
                   		<button type="button" class="btn btn-outline-secondary mr-2">마이페이지</button>
                   		<button type="button" class="btn btn-outline-secondary mr-2">회원탈퇴</button>
                   		<br><br>
 						<a href="logout.ka"><img height="49" width="222" src="klogout.PNG"/></a>
               		</form>
            	</c:when>
            	<c:when test="${type==3}">
               		<form>
                 		<div class="form-group pb-1">
                   			<label for="comment">안녕하세요! ${nickname}님</label>
                 		</div>
                   		<button type="button" class="btn btn-outline-secondary mr-2">마이페이지</button>
                   		<button type="button" class="btn btn-outline-secondary mr-2">회원탈퇴</button>
                   		<button type="button" class="btn btn-outline-secondary mr-2" id="emailLogout">로그아웃</button>
                   		<br><br>
               		</form>
            	</c:when>
            	<c:when test="${type==4}">
               		<form>
                 		<div class="form-group pb-1">
                   			<label for="comment">안녕하세요! admin님!</label>
                 		</div>
                   		<button type="button" class="btn btn-outline-secondary mr-2">로그아웃</button>
                   		<br><br>
               		</form>
            	</c:when>
             	<c:otherwise>
             		<form action="login.me" method="POST">
                 		<div class="form-group pb-1">
                   			<label for="exampleInputEmail1">아이디</label>
                   			<input type="email" name="id" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="아이디를 입력해주세요">
                 		</div>
                 		<div class="form-group pb-1">
                   			<label for="exampleInputPassword1">비밀번호</label>
                   			<input type="password" name="pw" class="form-control" id="exampleInputPassword1" placeholder="비밀번호를 입력해주세요">
                 		</div>
                   		<button type="submit" class="btn btn-outline-secondary mr-2">로그인</button>
                   		<button type="button" class="btn btn-secondary">가입하기</button>
                   		<button type="button" class="btn btn-secondary" id="getPw">비밀번호 찾기</button>
                   		<br>
                   		<br>
                   		<a id="kakao-login-btn"></a><a href="http://developers.kakao.com/logout"></a>
                   		<a href="login.na"><img height="49" width="222" src="naver.PNG"/></a>
               		</form>
             	</c:otherwise>
            </c:choose>
			</div>
		</div>	
<!-- 	본문2 -->
	<!-- 	학습 툴 -->
		<div class="row pt-5">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
				<h1 class="display-5 font-weight-bold">시작하기</h1>
				<p class="lead font-weight-bold">새로운 디지털 기술을 체험하고 이웃들과 공유하세요!</p>
			</div>	
		</div>
		<div class="row mb-4">
			<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12 text-center mt-4">
				<div class="card bg-success myCard" style="width: 18rem;">
				  <img src="https://scratch.mit.edu/images/ideas/activities/animate-a-name-thumb.jpg" class="card-img-top" alt="card_img1">
				  <div class="card-body">
				    <h5 class="card-title font-weight-bold">클릭 한 번으로 메뉴 이름 이해하기</h5>
				    <p class="card-text">모르는 단어를 클릭해보세요. 즉시 한글로 번역해 드립니다.</p>
				    <a href="#" class="btn btn-primary">체험하기</a>
				  </div>
				</div>
			</div>	
			<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12 text-center mt-4">
				<div class="card bg-danger myCard" style="width: 18rem;">
				  <img src="https://scratch.mit.edu/images/ideas/activities/animate-a-name-thumb.jpg" class="card-img-top" alt="card_img1">
				  <div class="card-body">
				    <h5 class="card-title font-weight-bold">키오스크 체험 시작하기</h5>
				    <p class="card-text">키오스크 사용법을 체험하고 연습해 보세요. 이제 혼자서도 주문할 수 있습니다.</p>
				    <a href="#" class="btn btn-primary">체험하기</a>
				  </div>
				</div>
			</div>	
			<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12 text-center mt-4">
				<div class="card bg-warning myCard" style="width: 18rem;">
				  <img src="https://scratch.mit.edu/images/ideas/activities/animate-a-name-thumb.jpg" class="card-img-top" alt="card_img1">
				  <div class="card-body">
				    <h5 class="card-title font-weight-bold">내 주변에 있는 매장 검색해보기</h5>
				    <p class="card-text">키오스크 사용법이 익숙해졌다면 실제 매장에 가서 주문해보세요!</p>
				    <a href="#" class="btn btn-primary">체험하기</a>
				  </div>
				</div>
			</div>	
		</div>
<!-- 	본문3 -->
		<div class="row pt-5">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
				<h1 class="display-5 font-weight-bold">소통하기</h1>
				<p class="lead font-weight-bold">모르는 게 있으면 망설이지 말고 물어보세요!</p>
			</div>	
		</div>
		<div class="row pb-5">
<!-- 	배너 -->
		<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12 mt-4">
			<div class="card text-center text-white bg-dark p-2">
			  <div class="bd-example">
			  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
			    <ol class="carousel-indicators my-card">
			      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
			      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
			      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
			    </ol>
			    <div class="carousel-inner pt-3 pb-1">
			      <div class="carousel-item active my-card myBanner">
			        <img src="https://uploads.scratch.mit.edu/projects/thumbnails/310945537.png" class="d-block" alt="1">
			        <div class="carousel-caption">
			          <h5>First slide</h5>
			          <p>Nulla vitae elit libero</p>
			        </div>
			      </div>
			      <div class="carousel-item my-card myBanner">
			        <img src="https://uploads.scratch.mit.edu/projects/thumbnails/310945537.png" class="d-block" alt="2">
			        <div class="carousel-caption">
			          <h5>Second slide</h5>
			          <p>Lorem ipsum dolor sit amet</p>
			        </div>
			      </div>
			      <div class="carousel-item my-card myBanner">
			        <img src="https://uploads.scratch.mit.edu/projects/thumbnails/310945537.png" class="d-block" alt="3">
			        <div class="carousel-caption">
			          <h5>Third slide</h5>
			          <p>Praesent commodo cursus magna</p>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
			  <div class="card-body">
			    <button type="button" class="btn btn-outline-secondary" data-toggle="tooltip" data-placement="top" title="Tooltip on top">배너 구경하기</button>
			  </div>
			</div>
		</div>	
<!-- 	공지사항, 게시판 -->
			<div class="col-lg-8 col-md-12 col-sm-12 col-xs-12 mt-5">
				<ul class="nav nav-tabs">
				  <li class="nav-item">
				    <a class="nav-link active" data-toggle="tab" href="#info">공지사항</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" data-toggle="tab" href="#freeBoard">자유게시판</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" data-toggle="tab" href="#qna">질문게시판</a>
				  </li>
				</ul>
				<div class="tab-content">
				  <div class="tab-pane fade show active" id="info">
				    <h5 class="font-weight-bold mb-3">새로운 정보를 알려드립니다</h5>
				    <div class="row text-center">
			  			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 font-weight-bold d-none d-sm-block">번호</div>
			  			<div class="col-lg-4 col-md-8 col-sm-10 col-xs-10 font-weight-bold myTitle d-none d-sm-block">글제목</div>
			  			<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 font-weight-bold d-none d-md-block">작성일</div>
			  			<div class="col-lg-2 col-md-6 col-sm-4 col-xs-4 font-weight-bold d-none d-lg-block">작성자</div>
			  			<div class="col-lg-2 col-md-6 col-sm-4 col-xs-4 font-weight-bold d-none d-lg-block">조회수</div>
					  			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">1</div>
					  			<div class="col-lg-4 col-md-8 col-sm-10 col-xs-10 myTitle">글 작성이 되는 칸 글 작성이 되는 칸 글 작성이 되는 칸</div>
					  			<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 tabStuff">2019.01.01</div>
					  			<div class="col-lg-2 col-md-6 col-sm-4 col-xs-4 tabStuff">작성자</div>
					  			<div class="col-lg-2 col-md-6 col-sm-4 col-xs-4 tabStuff">12</div>
					  			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">2</div>
					  			<div class="col-lg-4 col-md-8 col-sm-10 col-xs-10 myTitle">글 작성이 되는 칸 글 작성이 되는 칸 글 작성이 되는 칸</div>
					  			<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 tabStuff">2019.01.01</div>
					  			<div class="col-lg-2 col-md-6 col-sm-4 col-xs-4 tabStuff">작성자</div>
					  			<div class="col-lg-2 col-md-6 col-sm-4 col-xs-4 tabStuff">12</div>
					  			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">3</div>
					  			<div class="col-lg-4 col-md-8 col-sm-10 col-xs-10 myTitle">글 작성이 되는 칸 글 작성이 되는 칸 글 작성이 되는 칸</div>
					  			<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 tabStuff">2019.01.01</div>
					  			<div class="col-lg-2 col-md-6 col-sm-4 col-xs-4 tabStuff">작성자</div>
					  			<div class="col-lg-2 col-md-6 col-sm-4 col-xs-4 tabStuff">12</div>
					  			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">4</div>
					  			<div class="col-lg-4 col-md-8 col-sm-10 col-xs-10 myTitle">글 작성이 되는 칸 글 작성이 되는 칸 글 작성이 되는 칸</div>
					  			<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 tabStuff">2019.01.01</div>
					  			<div class="col-lg-2 col-md-6 col-sm-4 col-xs-4 tabStuff">작성자</div>
					  			<div class="col-lg-2 col-md-6 col-sm-4 col-xs-4 tabStuff">12</div>
					  			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">5</div>
					  			<div class="col-lg-4 col-md-8 col-sm-10 col-xs-10 myTitle">글 작성이 되는 칸 글 작성이 되는 칸 글 작성이 되는 칸</div>
					  			<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 tabStuff">2019.01.01</div>
					  			<div class="col-lg-2 col-md-6 col-sm-4 col-xs-4 tabStuff">작성자</div>
					  			<div class="col-lg-2 col-md-6 col-sm-4 col-xs-4 tabStuff">12</div>
					  			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">6</div>
					  			<div class="col-lg-4 col-md-8 col-sm-10 col-xs-10 myTitle">글 작성이 되는 칸 글 작성이 되는 칸 글 작성이 되는 칸</div>
					  			<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 tabStuff">2019.01.01</div>
					  			<div class="col-lg-2 col-md-6 col-sm-4 col-xs-4 tabStuff">작성자</div>
					  			<div class="col-lg-2 col-md-6 col-sm-4 col-xs-4 tabStuff">12</div>
					  			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">7</div>
					  			<div class="col-lg-4 col-md-8 col-sm-10 col-xs-10 myTitle">글 작성이 되는 칸 글 작성이 되는 칸 글 작성이 되는 칸</div>
					  			<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 tabStuff">2019.01.01</div>
					  			<div class="col-lg-2 col-md-6 col-sm-4 col-xs-4 tabStuff">작성자</div>
					  			<div class="col-lg-2 col-md-6 col-sm-4 col-xs-4 tabStuff">12</div>
			  		</div>
				  </div>
				  <div class="tab-pane fade" id="freeBoard">
				    <p>Nunc vitae turpis id nibh sodales commodo et non augue. Proin fringilla ex nunc. Integer tincidunt risus ut facilisis tristique.</p>
				  </div>
				  <div class="tab-pane fade" id="qna">
				    <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
				  </div>
				</div>
				<div class="more"><a href="list.board01" class="more">더 보기 ></a></div>
			</div>	
		</div>
	</div>
<!-- 	footer -->
	<div class="container-fluid footer pt-5">
		<div class="row pt-2 pb-5">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
				<h1 class="display-5 font-weight-bold">사이트맵</h1>
				<p class="lead font-weight-bold">ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ</p>
			</div>				
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
				홈페이지 이용약관 등
			</div>
		</div>
	</div>	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<!-- NAVER KAKAO -->
	<script type='text/javascript'>
		Kakao.init('49283e307f214dc8c2edee1cae89f2cb');
		Kakao.Auth.createLoginButton({
  			container: '#kakao-login-btn',
  			success: function(authObj) {
    			location.href="login.ka"; 
  			},
  			fail: function(err) {
     			alert(JSON.stringify(err));
 			}
		});
	</script>
</body>
</html>