<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR:200,300,400,500,600,700,900&display=swap&subset=korean"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
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

.head {
	position: relative;
	top: 200px;
	text-align: center;
}

#wrapper {
	border: 0px solid black;
	position: relative;
	top: 250px;
}

#wrapper * {
	font-size: 25px;
}

h1+div {
	border: 1.5px solid #0a47ff;
	width: 500px;
	margin-bottom: 50px;
}

.header * {
	border-bottom: 1px solid black;
}

.content {
	min-height: 300px;
}

.content div:first-child {
	border-right: 1px solid black;
}

.firstcol {
	background-color: #80aef7;
	border-right: 1px solid black;
	text-align: center;
}

.header div:nth-child(3), .header div:nth-child(9) {
	border-left: 1px solid black;
}

.secondcol {
	background-color: #eaecef;
}

* /
            .header div:nth-child(5)+div, .content div:last-child {
	background-color: #e0e2e5;
}

.footer>div {
	text-align: right;
}

.footer input[type="button"] {
	background: none;
	border: 2px solid black;
}

.footer input[type="button"]:hover {
	background-color: #e0e2e5;
}

.comentBox {
	background-color: #eaeaea;
	margin: auto;
}

.writeBox div:first-child, .writeBox div:nth-child(2) {
	padding-left: 0px;
	padding-right: 0px;
	box-sizing: border-box;
}

.textarea {
	background-color: white;
	width: 100%;
	height: 100px;
	border: 10px solid #eaeaea;
}

.alterTextarea {
	background-color: white;
	width: 100%;
	height: 100px;
	border: 10px solid #eaeaea;
}

.comentBtn, .textarea {
	float: left;
}

.cmBtn {
	text-align: right;
}

.cmAlterBtn





 





${
list





 





.seq






	






}
,
.cmDeleteBtn {
	border: 0px;
	background-color: #eaeaea;
}

.cmAlterBtn






${
list





.seq









}
:hover, .cmDeleteBtn:hover {
	font-weight: bold;
}

.cmWriter {
	font-weight: bold;
}

.line {
	width: 95%;
	border: 1px solid black;
}

.comentBox {
	position: relative;
}

.alterBox {
	background-color: #eaeaea;
	width: 100%;
	height: 100%;
	z-index: 10;
	position: absolute;
}
</style>
</head>
<body>
	<!-- 고정메뉴 -->
	<div class="container-fluid fixedMenu">
		<div class="row fixedMenuNav p-2">
			<div class="col-lg-2 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
			<div class="col-lg-8 col-md-6col-sm-12 col-xs-12">
				<ul class="nav justify-content-center">



					<li class="nav-item"><a class="nav-link active"
						href="goMain.win">메인페이지</a></li>
					<li class="nav-item"><a class="nav-link" href="#">학습하기</a></li>
					<li class="nav-item"><a class="nav-link" href="goInfo.win">사이트
							소개</a></li>
					<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
					<li class="nav-item"><a class="nav-link"
						href="list.board01?currentPage=1">자유게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="#">문의하기</a></li>
					<c:if test="${type==4}">
						<li class="nav-item"><a class="nav-link" href="#">관리자 게시판</a></li>
					</c:if>

				</ul>
			</div>
			<div class="col-lg-2 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
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
	<!-- ------------------------------------------------------------------------------------------------------------------------------- -->

	<div class="head">
		<h1>자유게시판</h1>
		<div></div>
	</div>

	<div id="wrapper" class="container">
		<div class="header row ">

			<div class="col-lg-2 col-md-2  d-none d-md-block writer firstcol">작성자</div>
			<div class="col-lg-6 col-md-6   d-none d-md-block secondcol">${content.writer }</div>
			<div class="col-lg-2 col-md-2   d-none d-md-block seq firstcol">글번호</div>
			<div class="col-lg-2 col-md-2   d-none d-md-block secondcol">${content.seq }</div>

			<div class="col-lg-2 col-md-2 col-sm-2 firstcol">제목</div>
			<div class="col-lg-10col-md-10 col-sm-10 secondcol">${content.title }</div>

			<div class="col-lg-2 col-md-2  date  d-none d-md-block firstcol">날짜</div>
			<div class="col-lg-6 col-md-6   d-none d-md-block secondcol">${content.writeDate }</div>
			<div class="col-lg-2 col-md-2  viewCount  d-none d-md-block firstcol">조회수</div>
			<div class="col-lg-2 col-md-2   d-none d-md-block secondcol">${content.viewCount }</div>

		</div>
		<div class="content row">
			<div class="col-lg-1.5 col-md-2 col-sm-2 d-none d-sm-block firstcol">내용</div>
			<div class="col-lg-9.5 col-md-10 col-sm-10 secondcol">${content.content }</div>
		</div>
		<div class="footer row">

			<div class="col-lg-6 col-md-6 col-sm-6 col-6 mt-2 mb-2">
				<input type="button" value="댓글▼"> <input type="button"
					value="목록" class="listBtn">
			</div>

			<div class="col-lg-6 col-md-6 col-sm-6 col-6 mt-2 mb-2">
				<c:choose>
					<c:when test="${email != content.email || type == 4}">
						<input type="button" value="삭제" class="deleteBtn" hidden>
						<!--글 삭제버튼-->
						<input type="button" value="수정" class="alterBtn" hidden>
						<!--글 수정버튼-->
					</c:when>
					<c:when test="${email  == content.email || type == 4}">
						<input type="button" value="삭제" class="deleteBtn">
						<input type="button" value="수정" class="alterBtn">
					</c:when>
				</c:choose>
			</div>
		</div>

		<c:forEach var="list" items="${comList }">
			<div class="row comentBox">

				<div class="row  mb-5 alterBox" id="${list.seq }">
					<!--댓글 수정 입력폼  -->
					<div class="col-lg-11 col-md-11 col-sm-11 col-11 pr-0">
						<div class="alterTextarea" seq=${list.seq } contenteditable="true"></div>
						<!--댓글 수정 입력창  -->
					</div>

					<div class="col-lg-1 col-md-1 col-sm-1 col-1 p-0">
						<input type="button" value="등록" seq=${list.seq }
							class="commentAlterBtn">
						<!--댓글 수정 등록 버튼  -->
					</div>
				</div>

				<div class="col-lg-6 col-md-6 col-sm-6 col-6 cmWriter">${list.writer }</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-6 cmBtn">
					<c:choose>
						<c:when test="${email != list.email || type == 4}">
							<input type="button" class="cmAlterBtn" value="수정"
								seq=${list.seq } hidden>
							<!--댓글 수정버튼-->
							<input type="button" class="cmDeleteBtn" value="삭제"
								seq=${list.seq } hidden>
							<!--댓글 삭제버튼-->
						</c:when>
						<c:when test="${email == list.email || type == 4}">
							<input type="button" class="cmAlterBtn" seq=${list.seq }
								value="수정">
							<input type="button" class="cmDeleteBtn" seq=${list.seq }
								value="삭제">
						</c:when>
					</c:choose>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-12">${list.comment }</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-12">${list.timeForm }</div>
				<div class="line"></div>
			</div>
		</c:forEach>

		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-12">${navi }</div>
		</div>

		<div class="row  mb-5 writeBox">
			<div class="col-lg-11 col-md-11 col-sm-11 col-11">
				<div class="textarea" contenteditable="true"></div>
			</div>

			<div class="col-lg-1 col-md-1 col-sm-1 col-1">
				<input type="button" value="등록" class="comentBtn">
				<!--댓글 등록 버튼-->
			</div>
		</div>

	</div>

</body>

</html>