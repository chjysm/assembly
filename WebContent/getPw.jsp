<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<style>
		.container{
            padding: 20px 40px;
            margin-top:30px;
            margin-left: 20px;
            margin-right: 20px;
            border:1px solid;
            border-radius: 10px;
            border-color: #007bff;
            text-align: center;
            align-content: center;
            background-color: #007bff11;
		}
		.header{
			margin-top: 30px;
		}
		.input-group{
			margin-top:20px;
		}
		
	</style>
	<script>
		$(function(){
			$("#emailbtn").on("click",function(){
				$.ajax({
					url:"check.ma",
					data:{email : $("#email").val()},
					type:"get"
				}).done(function(resp){
					if(resp==0){
						$(".comment").text("해당 이메일로 가입 하신적이 없습니다! 다시 입력해주세요!");
					}else{
						$(".comment").text("해당 이메일로 인증 번호가 발송 되었습니다!");
						$.ajax({
							url:"post.ma",
							data:{email : $("#email").val()},
							type:"get"
						}).done(function(resp2){
							var certi=resp2;
							$("#certibtn").on("click",function(){
								if($("#certi").val()== certi ){
									if(alert("인증성공")!=0){
										location.href="goPwReset.me?email="+$("#email").val();
									}
								}else{
									alert("인증 실패! 이메일과 인증번호를 확인 하세요!");
								}
							});
						});
					}
				});
			});
		});
	</script>
</head>
<body>
	<div class="container ">
		<div class="row  header">
			<div class="col-lg-10 d-md-block">
				<h3 class="comment">찾으실 계정의 이메일을 입력 하세요!</h3>
			</div>
		</div>
		<div class="row ">
			<div class="col-lg-10 input-group mb-3">
				<input type="text" class="form-control" id="email" placeholder="이메일"
					aria-label="Recipient's username" aria-describedby="button-addon2">
				<div class="input-group-append">
					<button class="btn btn-outline-primary" type="button"
						id="emailbtn">이메일 입력</button>
				</div>
			</div>
		</div>
		<div class="row ">
			<div class="col-lg-10 input-group mb-3">
				<input type="text" class="form-control" id="certi" placeholder="인증번호"
					aria-label="Recipient's username" aria-describedby="button-addon2">
				<div class="input-group-append">
					<button class="btn btn-outline-primary" type="button"
						id="certibtn">인증번호 입력</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>