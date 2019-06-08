<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
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
			var certi=0;
			$("#emailbtn").on("click",function(){
						$.ajax({
							url:"post.ma",
							data:{email : '${email}'},
							type:"get"
						}).done(function(resp2){
							alert("해당 이메일로 인증 번호가 발송 되었습니다");
							certi=resp2;
							$("#certi").attr("disabled",false);
						});
						
					});
			$("#certibtn").on("click",function(){
				if($("#certi").val()== certi ){
					if(alert("인증성공")!=0){
						if(${type==1}){//네이버
							var flag=confirm("정말 탈퇴 하시겠습니까??");
							if(flag==true){
								location.href="withdrawal.na";
							}else{
								window.close();
							}
						}else if(${type==2}){//카카오
							var flag=confirm("정말 탈퇴 하시겠습니까??");
							if(flag==true){
								location.href="withdrawal.ka";
							}else{
								window.close();
							}
						}else if(${type==3}){//이메일
							var flag=confirm("정말 탈퇴 하시겠습니까??");
							if(flag==true){
								location.href="withdrawal.me";
							}else{
								window.close();
							}
						}
					}
				}else{
					alert("인증 실패! 이메일과 인증번호를 확인 하세요!");
				}
			});
			$("#cancelbtn").on("click",function(){
				window.close();
			});
				});
	</script>
</head>
<body>
	<div class="container ">
		<div class="row  header">
			<div class="col-lg-10 d-md-block">
				<h3 class="comment">가입할 때 작성 하신 이메일('${email}')로 인증번호가 발송됩니다.</h3>
			</div>
		</div>
		<div class="row ">
			<div class="col-lg-10 mb-3 justify-content-center ">
					<button class="btn btn-outline-primary" type="button"
						id="emailbtn">인증번호 발송</button>
			</div>
		</div>
		<div class="row ">
			<div class="col-lg-10 input-group mb-3">
				<input type="text" class="form-control" id="certi" disabled placeholder="인증번호"
					aria-label="Recipient's username" aria-describedby="button-addon2">
				<div class="input-group-append">
					<button class="btn btn-outline-primary" type="button"
						id="certibtn">인증번호 입력</button>
				</div>
			</div>
		</div>
		<div class="row ">
		<div class="col-lg-10 mb-3 justify-content-right">
		<button class="btn btn-outline-primary" type="button"
						id="cancelbtn">취소</button>
			</div>
		</div>
	</div>
</body>
</html>