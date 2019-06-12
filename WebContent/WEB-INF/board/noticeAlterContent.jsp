<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Board Alter Content</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- JQuery -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<script>
	$(function() {
		$(".cancelBtn")
				.on(
						"click",
						function() {//취소버튼 -> 목록페이지로
							location.href = "list.board03?noticeCurrentPage=${noticeCurrentPage}";//현재페이지 붙여서 보내기
						})
		$(".completeBtn")
				.on(
						"click",
						function() {//등록 버튼 -> 데이터베이스에 저장 -> 목록에 띄우기 
							$("#inputContent").val($('#summernote').summernote("code"));

							if ($("#title").val() != ""
									&& $("#inputContent").val() != "") {
								$.ajax({
									url : 'flag.board03',
								});

								$("#writeForm").submit();

							} else if ($("#title").val() == "") {
								alert("제목을 입력해주세요.");
							} else if ($("#inputContent").val() == "") {
								alert("내용을 입력해주세요.");
							}
						});
		$("#summernote").summernote({
			lang : 'ko-KR',
			placeholder : '글을 입력해주세요.',
			tabsize : 2,
			width : 1500,
			height : 400,
			focus : true,
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {//이미지 서버에 업로드
					var data = new FormData();
					data.append('file', files[0]);
					console.log(files)
					$.ajax({
						url : 'imageUpload.board03',
						data : data,
						type : 'post',
						cache : false,
						contentType : false,
						enctype : 'multipart/form-data',
						processData : false
					}).done(function(resp) {
						$(".note-editable").append("<img src='" + resp + "'>");
						console.log(resp);
					})
				}
			}
		});
		$(window).on("beforeunload", function() { // 화면전환이 됬을경우 삭제
			$("img").each(function(i, item) {
				var src = $(item).attr("src");
				$.ajax({
					url : "deleteFile.board03",
					type : "post",
					data : {
						img : src
					},
					cache : false
				});
			})
		});

	

	})
</script>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Audiowide|Comfortaa|Gothic+A1|Nanum+Gothic|Nanum+Gothic+Coding|Noto+Sans+KR|Poiret+One|Syncopate&display=swap')
	;

.fixedMenu {
	position: fixed;
	background: #fff;
	z-index: 999;
}

.fixedMenuNav {
	background: #007bff;
	box-shadow: 1px 1px 5px #444;
}

.fixedMenu, .nav-link {
	color: #fff;
	font-weight: bold;
}

#logo {
	font-family: 'Poiret One', cursive;
	font-weight: bold;
	text-shadow: -1px -1px 0 #FFBF00, 1px -1px 0 #FFBF00, -1px 1px 0 #FFBF00,
		1px 1px 0 #FFBF00;
}

.fixMenu-text {
	position: relative;
	top: 10px;
}

.logoLi {
	font-family: 'Noto Sans KR', sans-serif;
	text-shadow: 0 0 1px #5882FA;
}

.logoLi:hover {
	opacity: 0.7;
}

.fixedMenu div {
	text-align: center;
	font-size: 20px;
}
/*---------------------------------------------------------------------------------------------------*/
.head {
	position: relative;
	top: 200px;
	text-align: center;
}

.head>div {
	margin: auto;
}

#wrapper {
	border: 0px black;
	position: relative;
	top: 250px;
	box-sizing: border-box;
}

h1+div {
	border: 1.5px solid #0a47ff;
	width: 500px;
	margin-bottom: 40px;
}

.header {
	text-align: center;
	margin-top: 7px;
	margin-bottom: 7px;
}

.header>div {
	text-align: center;
}

input[type="text"] {
	width: 88%;
	height: 40px;
	border: none;
	border-bottom: 4px solid #babbbc;
}

.title {
	font-size: 20px;
	line-height: 40px;
	font-weight: bold;
}

.content>div {
	margin-top: 10px;
}

#summernote {
	margin: 0;
	text-align: right;
}

.footer {
	text-align: center;
	margin-top: 10px;
}

input[type="button"] {
	background: none;
	border: 2px solid #babbbc;
	border-radius: 5px;
	font-size: 20px;
}

input[type="button"]:hover {
	background-color: #babbbc;
	color: white;
}
</style>

</head>
<body>
	<!-- 고정메뉴 -->
	<div class="container-fluid fixedMenu">
		<div class="row fixedMenuNav">
			<div class="col-lg-1 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
			<div class="col-lg-10 col-md-12 col-sm-12 col-xs-12">
				<ul class="nav justify-content-center fixMenu-text pb-3">
					<li id="logo" class="nav-item"><a class="nav-link active"
						href="#">WUYAKO</a></li>
					<li class="nav-item logoLi"><a class="nav-link"
						href="goMain.win">메인페이지</a></li>
					<li class="nav-item logoLi"><a class="nav-link"
						href="translateMenu.go">학습하기</a></li>
					<li class="nav-item logoLi"><a class="nav-link"
						href="goInfo.win">사이트 소개</a></li>
					<li class="nav-item logoLi"><a class="nav-link"
						href="list.board03?noticeCurrentPage=1">공지사항</a></li>
					<li class="nav-item logoLi"><a class="nav-link"
						href="list.board01?freeCurrentPage=1">자유게시판</a></li>
					<li class="nav-item logoLi"><a class="nav-link"
						href="list.board02?qnaCurrentPage=1">문의하기</a></li>
					<c:if test="${type==4}">
						<li class="nav-item"><a class="nav-link" href="goAdmin.admin">관리자
								페이지</a></li>
					</c:if>
				</ul>
			</div>
			<div class="col-lg-1 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
		</div>
	</div>
	<!-- ------------------------------------------------------------------------------------------------------------------------------- -->

	<div class="head">
		<h1>공지게시판</h1>
		<div></div>
	</div>
	<form action="alterContent.board03" method="get" id="writeForm">
		<div class="container" id="wrapper">
			<div class="header row">
				<div class="title col-lg-2 col-md-3 col-sm-2 col-3 ">제목</div>
				<div class=" col-lg-10 col-md-9 col-sm-10 col-9 ">
					<input type="text" placeholder="제목을 입력해주세요." name="title"
						id="title" value="${content.title}" maxlength="30">
				</div>
			</div>
			<div class="content row">
				<div id="summernote" contenteditable="true">${content.content }</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-12">
					<textarea name="inputContent" id="inputContent" cols="30" rows="10"
						hidden></textarea>
				</div>
			</div>
			<div class="footer">
				<input type="button" class="completeBtn" value="수정완료"> <input
					type="button" class="cancelBtn" value="취소">
			</div>
		</div>
	</form>
</body>
</html>