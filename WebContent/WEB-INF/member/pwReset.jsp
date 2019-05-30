<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			$("#pwbtn").on("click",function(){
				$.ajax({
					url:"pwReset.me",
					data:{
						email : "${email}" ,
						pw: $("#pw").val()
						},
					type:"get"
				}).done(function(resp){
					self.close();
					if(resp==1){
						if(alert("변경 성공!")!=0){
							self.close();
						}
					}else{
						if(alert("변경 실패!")!=0){
							self.close();
						}
					}
				});
			});
		});
	</script>
</head>
<body>
<div class="container ">
		<div class="row header">
			<div class="col-lg-10 d-md-block">
				<h3 class="comment">재 설정할 비밀번호를 입력하세요!</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-10 input-group mb-3">
				<input type="password" class="form-control" id="pw" placeholder="재설정 비밀번호"
					aria-label="Recipient's username" aria-describedby="button-addon2">
				<div class="input-group-append">
					<button class="btn btn-outline-primary" type="button"
						id="pwbtn">비밀번호 입력</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>