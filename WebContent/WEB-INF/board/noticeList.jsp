<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Baord List</title>
<meta name="viewport"content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script><!-- JQuery -->

<script>
    	$(function(){
    		$(".writeBtn").on("click",function(){//글쓰기 버튼 -> 글쓰기 페이지로
    			if(${type == null}){
    				alert("로그인 후 이용해주세요");
    			}else{
    			location.href="noticeWrite.board03";
    			}
    		});
    		  $(".searchBtn").on("click",function(){ // 검색버튼 누르면
    	             var option = $("#option option:selected").val();
    	             var searchWord = $(".searchWord").val();
    	             if(searchWord == ""){
    	                alert("검색어를 입력해주세요");
    	             }else{
    	                if(option == "글제목"){
    	                     location.href="searchContent.board03?currentPage=1&&searchWord="+searchWord+"&&option=title";
    	                 }else if(option == "작성자"){
    	                     location.href="searchContent.board03?currentPage=1&&searchWord="+searchWord+"&&option=writer";
    	                 }
    	             };
    	          });
    	});
    </script>
<style>
	*{margin: 0 auto;}
	.fixedMenu{position: fixed; background: #fff;z-index: 999;}
	.fixedMenuNav{background: #007bff;}
	.fixedMenu,.nav-link{color: #fff; font-weight: bold;}
/*------------------------------------------------------------------------------------------------------------------------------------------*/
	.head {position: relative;top: 200px;text-align: center;}
	#wrapper {border: 0px solid black;position: relative;top: 250px;}
	#wrapper div:first-child {text-align: center;}
	#wrapper * {font-size: 25px;}
	h1+div {border: 1.5px solid #0a47ff;width: 500px;margin-bottom: 50px;}
	.header {border-bottom: 1px solid #cfd0d3;height: 40px;line-height: 38px}
	.header>div {ont-weight: bold;text-align: center;}
	.header>div>div {border: 1px solid black;}
	.content {border-bottom: 1px solid #cfd0d3;line-height: 38px;}
	.content:hover {background-color: #e0e2e5;}
	.content>div {text-align: center;}
	.navi {	border-bottom: 1px solid #cfd0d3;text-align: center;}
	.writeBtn {border: none;background: none;margin-top: 5px;}
	.writeBtn:hover {font-weight: bold;}
	.footer div:first-child {text-align: center;}
	.searchBtn {border: 1px solid black;border-radius: 5px;background: none;margin-left: 1px;}
	.searchBtn:hover {font-weight: bold;}
	input[type="text"] {margin-top: 5px;}
	a {color: black;}
	a:hover {color: black;font-weight: bold;}
	.noneRecord{text-align: center;}
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
					<li class="nav-item"><a class="nav-link" href="list.board03?currentPage=1">공지사항</a></li>
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

		
	</div>

	<!-- ------------------------------------------------------------------------------------------------------------------------------- -->

	<div class="head"><h1>공지 게시판</h1><div></div></div>


	<div class="container" id="wrapper">
			
		<div class="header row">
			<div class="col-lg-2 col-md-1 col-sm-6 col-6 ">NO.</div>
			<div class="col-lg-4 col-md-5 col-sm-6 col-6">제목</div>
			<div class="col-lg-2 col-md-2 d-none d-md-block">작성자</div>
			<div class="col-lg-2 col-md-2  d-none d-md-block">작성일</div>
			<div class="col-lg-2 col-md-2  d-none d-md-block">조회수</div>
		</div>
		<c:choose>
			<c:when test="${recordCount == 0 }">
				<div class="noneRecord">등록된 게시글이 없습니다.</div>
			</c:when>
			<c:otherwise>
					<c:forEach var="list" items="${noticeList }">
			<div class="content row">
				<div class="col-lg-2 col-md-1 col-sm-6 col-6">${list.seq }</div>
				<div class="col-lg-4 col-md-5 col-sm-6 col-6">
					<a href="noticeContent.board03?seq=${list.seq }&&commentPage=1">${list.title }</a>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-4 d-none d-sm-block">${list.writer }</div>
				<div class="col-lg-2 col-md-2 col-sm-4 d-none d-sm-block">${list.timeForm }</div>
				<div class="col-lg-2 col-md-2 col-sm-4 d-none d-sm-block">${list.viewCount }</div>
			</div>
		</c:forEach>

		
			</c:otherwise>
		</c:choose>
				<div class="navi row">
			<div>${getNavi }</div>
		</div>

		<div class="footer row">
			<div class="col-lg-11 col-md-11 col-sm-11 col-10">
				<select name="option" id="option">
					<option>글제목</option>
					<option>작성자</option>
				</select> <input type="text" class="searchWord"> <input type="button" class="searchBtn"
					value="검색">
			</div>
<c:choose>
	<c:when test="${type != 4 }">
			<div class="col-lg-1 col-md-1 col-sm-1 col-2">
				<input type="button" class="writeBtn" value="글쓰기" hidden>
			</div>
			</c:when>
			<c:when test="${type == 4 }">
			<div class="col-lg-1 col-md-1 col-sm-1 col-2">
				<input type="button" class="writeBtn" value="글쓰기">
			</div>
			
			</c:when>
</c:choose>
		</div>	
		


		</div>
	
</body>
</html>