<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
</head>
<body>
	<button id="btn1">버튼1 : 맥도날드</button>
	<button id="btn2">버튼2 : 맥도날드 DB테이블 값 삭제</button>
	<button id="btn3">버튼3 : 할리스커피</button>
	<button id="btn4">버튼4 : 할리스커피 DB테이블 값 삭제</button>
	<button id="btn5">버튼5 : 롯데리아</button>
	<button id="btn6">버튼6 : 롯데리아 DB테이블 값 삭제</button>
	<button id="btn7">버튼7 : 도미노피자</button>
	<button id="btn8">버튼8 : 도미노피자 DB테이블 값 삭제</button>
	<script>
		document.getElementById("btn1").addEventListener("click", function(){
			$(this).html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>' + $(this).text());
			location.href="mc.additems";
		});
		document.getElementById("btn2").addEventListener("click", function(){
			$(this).html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>' + $(this).text());
			location.href="updatemc.additems";
		});
		document.getElementById("btn3").addEventListener("click", function(){
			$(this).html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>' + $(this).text());
			location.href="coffee.additems";
		});
		document.getElementById("btn4").addEventListener("click", function(){
			$(this).html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>' + $(this).text());
			location.href="updatecoffee.additems";
		});
		document.getElementById("btn5").addEventListener("click", function(){
			$(this).html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>' + $(this).text());
			location.href="lotte.additems";
		});
		document.getElementById("btn6").addEventListener("click", function(){
			$(this).html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>' + $(this).text());
			location.href="updatelotte.additems";
		});
		document.getElementById("btn7").addEventListener("click", function(){
			$(this).html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>' + $(this).text());
			location.href="pizza.additems";
		});
		document.getElementById("btn8").addEventListener("click", function(){
			$(this).html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>' + $(this).text());
			location.href="updatepizza.additems";
		});
	</script>
</body>
</html>