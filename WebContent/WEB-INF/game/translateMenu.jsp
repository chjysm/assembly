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
<script src="https://kit.fontawesome.com/650a47b167.js"></script>
	<style>
		*{margin:0 auto;}
		.fixedMenu{position:fixed; background:#fff; z-index:999;}
		.fixedMenuNav{background:#007bff;}
		.fixedMenu .nav-link{color:#fff; font-weight:bold;}
		 .fixMenu-text{position: relative; top: 20px;}
		.fixedMenu div{text-align: center; font-size:30px;} 
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
						<div class="row">
					        <c:forEach var="pizza_seed" items="${pizza_seeds }">
									<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
										<img id="menuImg" src="${pizza_seed.imgAddr}"><i></i>
										<p class="h5" id="menuName">${pizza_seed.menuName}</p>
										<p id="menuEng">${pizza_seed.menuNameEng }</p>
										<p class="h5" id="price">${pizza_seed.price }원</p>
									</div>
								</c:forEach>
								<c:forEach var="pizza_prm" items="${pizza_prms }">
									<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
										<img id="menuImg" src="${pizza_prm.imgAddr}"><i></i>
										<p class="h5" id="menuName">${pizza_prm.menuName}</p>
										<p id="menuEng">${pizza_prm.menuNameEng }</p>
										<p class="h5" id="price">${pizza_prm.price }원</p>
									</div>
								</c:forEach>
								<c:forEach var="pizza_cls" items="${pizza_clss }">
									<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
										<img id="menuImg" src="${pizza_cls.imgAddr}"><i></i>
										<p class="h5" id="menuName">${pizza_cls.menuName}</p>
										<p id="menuEng">${pizza_cls.menuNameEng }</p>
										<p class="h5" id="price">${pizza_cls.price }원</p>
									</div>
								</c:forEach>
								<c:forEach var="pizza_side" items="${pizza_sides }">
									<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
										<img id="menuImg" src="${pizza_side.imgAddr}"><i></i>
										<p class="h5" id="menuName">${pizza_side.menuName}</p>
										<p id="menuEng">${pizza_side.menuNameEng }</p>
										<p class="h5" id="price">${pizza_side.price }원</p>
									</div>
								</c:forEach>
								<c:forEach var="pizza_beverage" items="${pizza_beverages }">
									<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
										<img id="menuImg" src="${lotte_chicken.imgAddr}"><i></i>
										<p class="h5" id="menuName">${pizza_beverage.menuName}</p>
										<p id="menuEng">${pizza_beverage.menuNameEng }</p>
										<p class="h5" id="price">${pizza_beverage.price }원</p>
									</div>
								</c:forEach>
								<c:forEach var="pizza_souce" items="${pizza_souces }">
									<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
										<img id="menuImg" src="${pizza_souce.imgAddr}"><i></i>
										<p class="h5" id="menuName">${pizza_souce.menuName}</p>
										<p id="menuEng">${pizza_souce.menuNameEng }</p>
										<p class="h5" id="price">${pizza_souce.price }원</p>
									</div>
								</c:forEach>
							</div>	
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
							<div class="row">
							<c:forEach var="lotte_burgerset" items="${lotte_burgersets }">
								<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
									<img id="menuImg" src="${lotte_burgerset.imgAddr}"><i></i>
									<p class="h5" id="menuName">${lotte_burgerset.menuName}</p>
									<p id="menuEng">${lotte_burgerset.menuNameEng }</p>
									<p class="h5" id="price">${lotte_burgerset.price }원</p>
								</div>
							</c:forEach>
							<c:forEach var="lotte_chickenset" items="${lotte_chickensets }">
								<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
									<img id="menuImg" src="${lotte_chickenset.imgAddr}"><i></i>
									<p class="h5" id="menuName">${lotte_chickenset.menuName}</p>
									<p id="menuEng">${lotte_chickenset.menuNameEng }</p>
									<p class="h5" id="price">${lotte_chickenset.price }원</p>
								</div>
							</c:forEach>
							<c:forEach var="lotte_good" items="${lotte_goods }">
								<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
									<img id="menuImg" src="${lotte_good.imgAddr}"><i></i>
									<p class="h5" id="menuName">${lotte_good.menuName}</p>
									<p id="menuEng">${lotte_good.menuNameEng }</p>
									<p class="h5" id="price">${lotte_good.price }원</p>
								</div>
							</c:forEach>
							<c:forEach var="lotte_burger" items="${lotte_burgers }">
								<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
									<img id="menuImg" src="${lotte_burger.imgAddr}"><i></i>
									<p class="h5" id="menuName">${lotte_burger.menuName}</p>
									<p id="menuEng">${lotte_burger.menuNameEng }</p>
									<p class="h5" id="price">${lotte_burger.price }원</p>
								</div>
							</c:forEach>
							<c:forEach var="lotte_chicken" items="${lotte_chickens }">
								<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
									<img id="menuImg" src="${lotte_chicken.imgAddr}"><i></i>
									<p class="h5" id="menuName">${lotte_chicken.menuName}</p>
									<p id="menuEng">${lotte_chicken.menuNameEng }</p>
									<p class="h5" id="price">${lotte_chicken.price }원</p>
								</div>
							</c:forEach>
							<c:forEach var="lotte_desert" items="${lotte_deserts }">
								<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
									<img id="menuImg" src="${coffee_bakery.imgAddr}"><i></i>
									<p class="h5" id="menuName">${coffee_bakery.menuName}</p>
									<p id="menuEng">${coffee_bakery.menuNameEng }</p>
									<p class="h5" id="price">${coffee_bakery.price }원</p>
								</div>
							</c:forEach>
							<c:forEach var="lotte_drink" items="${lotte_drinks }">
								<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
									<img id="menuImg" src="${lotte_drink.imgAddr}"><i></i>
									<p class="h5" id="menuName">${lotte_drink.menuName}</p>
									<p id="menuEng">${lotte_drink.menuNameEng }</p>
									<p class="h5" id="price">${lotte_drink.price }원</p>
								</div>
							</c:forEach>
							</div>
				      </div>
				    </div>
				  </div>
				  <div class="card">
				    <div class="card-header" id="headingFour">
				      <h2 class="mb-0">
				        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseThree">
				          Collapsible Group Item #3
				        </button>
				      </h2>
				    </div>
				    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
				      <div class="card-body">
						<div class="row">
							<c:forEach var="coffee_coffee" items="${coffee_coffees }">
								<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
									<img id="menuImg" src="${coffee_coffee.imgAddr}"><i></i>
									<p class="h5" id="menuName">${coffee_coffee.menuName}</p>
									<p id="menuEng">${coffee_coffee.menuNameEng }</p>
									<p class="h5" id="price">${coffee_coffee.price }원</p>
								</div>
							</c:forEach>
							<c:forEach var="coffee_latte" items="${coffee_lattes }">
								<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
									<img id="menuImg" src="${coffee_latte.imgAddr}"><i></i>
									<p class="h5" id="menuName">${coffee_latte.menuName}</p>
									<p id="menuEng">${coffee_latte.menuNameEng }</p>
									<p class="h5" id="price">${coffee_latte.price }원</p>
								</div>
							</c:forEach>
							<c:forEach var="coffee_holly" items="${coffee_hollys }">
								<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
									<img id="menuImg" src="${coffee_holly.imgAddr}"><i></i>
									<p class="h5" id="menuName">${coffee_holly.menuName}</p>
									<p id="menuEng">${coffee_holly.menuNameEng }</p>
									<p class="h5" id="price">${coffee_holly.price }원</p>
								</div>
							</c:forEach>
							<c:forEach var="coffee_tea" items="${coffee_teas }">
								<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
									<img id="menuImg" src="${coffee_tea.imgAddr}"><i></i>
									<p class="h5" id="menuName">${coffee_tea.menuName}</p>
									<p id="menuEng">${coffee_tea.menuNameEng }</p>
									<p class="h5" id="price">${coffee_tea.price }원</p>
								</div>
							</c:forEach>
							<c:forEach var="coffee_bakery" items="${coffee_bakerys }">
								<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my text-center choice1">
									<img id="menuImg" src="${coffee_bakery.imgAddr}"><i></i>
									<p class="h5" id="menuName">${coffee_bakery.menuName}</p>
									<p id="menuEng">${coffee_bakery.menuNameEng }</p>
									<p class="h5" id="price">${coffee_bakery.price }원</p>
								</div>
							</c:forEach>
						</div>
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