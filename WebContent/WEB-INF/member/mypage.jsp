<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
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

#pwChange_btn {
	width: 200px; /* 원하는 너비설정 */
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	/* 네이티브 화살표를 커스텀 화살표로 대체 */
	border: 1px solid #999;
	border-radius: 10px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

select {
	width: 150px; /* 원하는 너비설정 */
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
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
					<li class="nav-item"><a class="nav-link active" href="goMain.win">메인페이지</a>
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
		<form method="post" action="#">
			<div class="row">
				<div class="col-lg-8">
					<table class="table  "
						style="text-align: center; border: 1px solid #dddddd;">
						<thead>
							<th colspan="3" class=" btn-primary"><h4>마이 페이지 (회원 정보 수정)</h4></th>

						</thead>
						<tbody>
							<tr>
								<td style="width: 200px" class="pt-4"><h5>이름</h5>
								<td colspan="2"><input class="form-control" type="text"
									id="name" readonly> <br>
							</tr>
							<tr>
								<td style="width: 200px" class="pt-4"><h5>아이디(이메일)</h5> <br>
								<td colspan="2"><input class="form-control" id="email"
									class="pt-4" type="text" readonly><br>
							</tr>
							<tr>
								<td style="width: 200px" class="pt-4"><h5>비밀번호</h5> <br>
								<td colspan="2"><input type="button"
									class=" btn btn-primary float-left" id="pwChange_btn"
									value="비밀번호 변경하기"> <br>
							</tr>


							<tr>
								<td style="width: 200px" class="pt-4"><h5>닉네임</h5> <br>
								<td colspan="2"><input class="form-control" type="text"
									name="nickName"><br>
							</tr>
							<tr>
								<td style="width: 200px" class="pt-4"><h5>나이</h5>
								<td style="width: 200px"><select style=""
									class="float-left" aria-label="성별">
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
											<label class="btn btn-primary "> <input type="radio"
												name="gender" autocomplete="off" value="M"
												style="cursor: pointer" checked>남자

											</label> <label class="btn btn-danger"> <input type="radio"
												name="gender" autocomplete="off" value="F">여자
											</label>
										</div>
									</div> <br> <br>
							</tr>

							<tr>

								<td style="text-align: center" colspan="3"><input
									class="btn btn-primary float-center" style="width: 10rem"
									type="submit" value="수정"><input
									class="btn btn-primary float-center ml-1" style="width: 10rem"
									type="button" value="뒤로가기">
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</form>
	</div>
</body>
</html>