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
<title>Insert title here</title>
	<style>
		*{margin:0 auto;}
		.fixedMenu{position:fixed; background:#fff; z-index:999;}
		.fixedMenuNav{background:#007bff;}
		.fixedMenu .nav-link{color:#fff; font-weight:bold;}
		.jumbotron{padding-top:180px; background:#b8daff;}
		.mainPage{padding-top:200px; background:#F2F2F2;} /*수정*/
		.carousel-indicators>li{width:15px; height:15px; border-radius:50%;}
		.myCard{border:none;}
		.nav-tabs .nav-link{color:#000; font-weight:bold;}
		.tab-pane{padding:30px; background:#fff; border-radius:0 0 5px 5px; border-left:1px solid #ddd; border-right:1px solid #ddd; border-bottom:1px solid #ddd;}
		.myTitle{text-align:left; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;}
		.tabStuff{font-size:13px; color:#555;}
		.myBanner img{paddingtop:10px; width:90%; height:250px; border-radius:50%;}
		.footer{background:#b8daff;}
/* 		(위쪽)수정하지 마세요 */
	</style>
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

<!-- 	본문 -->
	<div class="container mainPage">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
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
								data : { key : $(this).find('#menuName').text()}
							}).done(function(resp){
								$("#result").append(resp + "<br>");
							});
						});
					});
				</script>
				<div id="source" contenteditable="true" style="width:300px; height:200px; border:1px solid #000; overflow-y:auto;"></div>
				<button type="button" id="send">send</button>
				<div id="result" style="width:300px; height:200px; border:1px solid #000; overflow-y:auto;"></div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="accordion" id="accordionExample">
				  <div class="card">
				    <div class="card-header" id="headingOne">
				      <h2 class="mb-0">
				        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				          	맥도날드
				        </button>
				      </h2>
				    </div>
				
				    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
				      <div class="card-body">
							<div class="row">
								<c:forEach var="burger" items="${burgers }">
									<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
										<img id="menuImg" src="${burger.imgAddr}"><i></i>
										<p class="h5" id="menuName">${burger.menuName}</p>
										<p id="menuEng">${burger.menuNameEng }</p>
										<p class="h5" id="price">${burger.price }원</p>
									</div>
								</c:forEach>
								<c:forEach var="set_menu" items="${set_menus }">
									<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
										<img id="menuImg" src="${set_menu.imgAddr}"><i></i>
										<p class="h5" id="menuName">${set_menu.menuName}</p>
										<p id="menuEng">${set_menu.menuNameEng }</p>
										<p class="h5" id="price">${set_menu.price }원</p>
									</div>
								</c:forEach>
								<c:forEach var="mc_morning" items="${mc_mornings }">
									<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
										<img id="menuImg" src="${mc_morning.imgAddr}"><i></i>
										<p class="h5" id="menuName">${mc_morning.menuName}</p>
										<p id="menuEng">${mc_morning.menuNameEng }</p>
										<p class="h5" id="price">${mc_morning.price }원</p>
									</div>
								</c:forEach>
								<c:forEach var="happy" items="${happys }">
									<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
										<img id="menuImg" src="${happy.imgAddr}"><i></i>
										<p class="h5" id="menuName">${happy.menuName}</p>
										<p id="menuEng">${happy.menuNameEng }</p>
										<p class="h5" id="price">${happy.price }원</p>
									</div>
								</c:forEach>
								<c:forEach var="happy_meal" items="${happy_meals }">
									<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
										<img id="menuImg" src="${happy_meal.imgAddr}"><i></i>
										<p class="h5" id="menuName">${happy_meal.menuName}</p>
										<p id="menuEng">${happy_meal.menuNameEng }</p>
										<p class="h5" id="price">${happy_meal.price }원</p>
									</div>
								</c:forEach>
								<c:forEach var="snack_side" items="${snack_sides }">
									<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
										<img id="menuImg" src="${snack_side.imgAddr}"><i></i>
										<p class="h5" id="menuName">${snack_side.menuName}</p>
										<p id="menuEng">${snack_side.menuNameEng }</p>
										<p class="h5" id="price">${snack_side.price }원</p>
									</div>
								</c:forEach>
								<c:forEach var="mc_cafe" items="${mc_cafes }">
									<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
										<img id="menuImg" src="${mc_cafe.imgAddr}"><i></i>
										<p class="h5" id="menuName">${mc_cafe.menuName}</p>
										<p id="menuEng">${mc_cafe.menuNameEng }</p>
										<p class="h5" id="price">${mc_cafe.price }원</p>
									</div>
								</c:forEach>
								<c:forEach var="beverage" items="${beverages }">
									<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
										<img id="menuImg" src="${beverage.imgAddr}"><i></i>
										<p class="h5" id="menuName">${beverage.menuName}</p>
										<p id="menuEng">${beverage.menuNameEng }</p>
										<p class="h5" id="price">${beverage.price }원</p>
									</div>
								</c:forEach>
								<c:forEach var="desert" items="${deserts }">
									<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
										<img id="menuImg" src="${desert.imgAddr}"><i></i>
										<p class="h5" id="menuName">${desert.menuName}</p>
										<p id="menuEng">${desert.menuNameEng }</p>
										<p class="h5" id="price">${desert.price }원</p>
									</div>
								</c:forEach>
							</div>
				      </div>
				    </div>
				  </div>
				  <div class="card">
				    <div class="card-header" id="headingTwo">
				      <h2 class="mb-0">
				        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				          Collapsible Group Item #2
				        </button>
				      </h2>
				    </div>
				    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
				      <div class="card-body">
				        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
				      </div>
				    </div>
				  </div>
				  <div class="card">
				    <div class="card-header" id="headingThree">
				      <h2 class="mb-0">
				        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				          Collapsible Group Item #3
				        </button>
				      </h2>
				    </div>
				    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
				      <div class="card-body">
				        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
				      </div>
				    </div>
				  </div>
				</div>
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
</body>
</html>