<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>

<script>
	$(function() {
		var pwRex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/ //  패스워드가 적합한지 검사할 정규식
		var emailRex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;// 이메일이 적합한지 검사할 정규식
		var birthRex = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/
		var idCount = 0;
		var pwCount = 0;
		//아이디 중복 ajax +정규표현식
		$("#email").on("input", function() {
			if (emailRex.exec($("#email").val()) == null) {
				$("#idRegex").css("color", "red");
				$("#idRegex").text("적합한 형식이 아닙니다. ex) cwg94@naver.com ");

			} else {

				$("#idRegex").text("");
				$.ajax({
					url : "check.me",
					type : "post",
					data : {
						id : $("#email").val()

					}

				}).done(function(resp) {

					console.log(resp);
					if (resp == 1) {
						$("#idRegex").css("color", "red");
						$("#idRegex").text(" *이미 사용중인 계정 입니다.");

					} else {
						$("#idRegex").css("color", "green");
						$("#idRegex").text(" *사용할 수 있는 계정 입니다.");
					}
				})
			}
		})

		//패스워드 regex 
		$("#pw").on(
				"input",
				function() {
					if (pwRex.exec($("#pw").val()) == null) {
						$("#pwRegex").css("color", "red");
						$("#pwRegex").text(
								"적합한 형식이 아닙니다. ex)최소 8자리 숫자,문자, 특수문자 각1개씩  ");
					} else {
						$("#pwRegex").css("color", "green");
						$("#pwRegex").text("사용할 수 있는 비밀번호 입니다. ");

					}
				})

		//패스워드 일치 
		$("#pwcheck").on("input", function() {

			if ($("#pwcheck").val() == $("#pw").val()) {

				$("#pwCheck").css("color", "green");
				$("#pwCheck").text("비밀번호 확인 되었습니다.");

			} else {

				$("#pwCheck").css("color", "red");
				$("#pwCheck").text("비밀번호를 다시 확인해 주세요. ");

			}
		})

	})
</script>
<script>
	
</script>
<title>회원가입</title>
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

select {
	width: 200px; /* 원하는 너비설정 */
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background: url('이미지 경로') no-repeat 95% 50%;
	/* 네이티브 화살표를 커스텀 화살표로 대체 */
	border: 1px solid #999;
	border-radius: 10px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
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

	<div class="container">
		<form method="post" action="signUp_insert.me">
			<div class="row">
				<div class="col-lg-8">
					<table class="table  table-hover"
						style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<th colspan="3" class=" btn-primary"><h4>회원 가입</h4></th>

						</thead>
						<tbody>
							<tr>
								<td style="width: 200px" class="pt-4"><h5>아이디</h5>
								<td colspan="2"><input class="form-control" type="text"
									id="email" name="email"
									placeholder="이메일을 입력해 주세요. (이메일주소를 아이디로 사용합니다.)"
									pattern="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$"
									required><span class="float-left" id=idRegex></span> <br>
							</tr>
							<tr>
								<td style="width: 200px" class="pt-4"><h5>비밀번호</h5> <br>
								<td colspan="2"><input class="form-control" type="password"
									id="pw" placeholder="비밀번호를 입력 해주세요."
									pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
									required><span class="float-left" id="pwRegex"></span><br>
							</tr>
							<tr>
								<td style="width: 200px" class="pt-4"><h5>비밀번호 확인</h5> <br>
								<td colspan="2"><input class="form-control" type="password"
									id="pwcheck" name="pwcheck" placeholder="비밀번호를 재입력 해주세요."
									pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
									required><span class="float-left" id="pwCheck"></span><br>
							</tr>
							<tr>
								<td style="width: 200px" class="pt-4"><h5>이름</h5> <br>
								<td colspan="2"><input class="form-control" type="text"
									name="name" placeholder="이름을 입력해 주세요." maxlength="6" required><br>
							</tr>
							<tr>
								<td style="width: 200px" class="pt-4"><h5>닉네임</h5> <br>
								<td colspan="2"><input class="form-control" type="text"
									name="nickname" placeholder="닉네임을 입력해 주세요." maxlength="8"
									required><br>
							</tr>
							<tr>
								<td style="width: 200px" class="pt-4"><h5>나이</h5>
								<td style="width: 200px"><select class="float-left"
									name="age">
										<option value="10">10대</option>
										<option value="20">20대</option>
										<option value="30">30대</option>
										<option value="40">40대</option>
										<option value="50">50대</option>
										<option value="60">60대</option>
										<option value="70">70대</option>
										<option value="80">80대</option>
										<option value="90">90대</option>

								</select>
								<td>
							</tr>

							<tr>
								<td style="width: 200px" class="pt-4"><h5>성별</h5>
								<td colspan="2">
									<div class="form-group"
										style="text-align: center; margin: 0 auto;">
										<div class="btn-group  btn-group-toggle" data-toggle="buttons"
											style="float: left">
											<label class="btn btn-primary active"> <input
												type="radio" name="gender" autocomplete="off" value="M">남자

											</label> <label class="btn btn-danger"> <input type="radio"
												name="gender" autocomplete="off" value="F">여자
											</label>
										</div>
									</div> <br> <br>
							</tr>

							<tr>

								<td style="text-align: center" colspan="3"><input
									class="btn btn-primary float-center" style="width: 10rem"
									type="submit" value="회원가입" required>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</form>
	</div>

</body>
</html>