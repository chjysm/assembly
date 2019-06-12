<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- JQuery -->
<script>
            $(function(){
                 $(".listBtn").on("click",function(){// 목록으로돌아가기
                	 location.href="list.board01?freeCurrentPage=${freeCurrentPage}";
                });
                 $(".deleteBtn").on("click",function(){ // 글 삭제 버튼
                	 var result = confirm("글을 삭제하시겠습니까?");
                	 
                	 if(result == true){
							$("#contentForm").submit();
                        
                	 }
                   
                });
                $(".alterBtn").on("click",function(){// 글 수정 버튼 -> 글 수정 페이지로 이동
                	location.href="alterForm.board01?seq=${content.seq}";
                })

                

               $(".commentBtn").on("click",function(){// 댓글 등록버튼 누르면
                	if(${type == null}){
        				alert("로그인 후 이용해주세요");
        			}else{
        				if($(".comment-writeBox").val() == ""){
        					alert("내용을 입력해주세요.");
        				}else{
        					$.ajax({
                        		url:"comment.board01",
                        		type:"post",
                        		data:{comments:JSON.stringify({comment:$(".comment-writeBox").val(),
                        					    postNum:'${content.seq }',
                        						postTitle:'${content.title }'             					    
                        						})
                        	}
                        	}).done(function(resp){
                        		location.href="wirteComment.board01?seq=${content.seq}&&commentPage=${cmCurrnetPage}";
                        	});
        				}
        				
        			};
                });
                
                $(".cmDeleteBtn").on("click",function(){ // 댓글삭제하기 
              			var seq = $(this).attr("seq");
              			console.log(seq);
              			var result = confirm("댓글을 삭제하시겠습니까?");
              			
              			if(result == true){
                  			location.href="deleteComment.board01?seq="+seq+"&&postNum=${content.seq}";
              			}
              		});
                $(".alterBox").hide();//수정 댓글입력창 숨기기
                //수정하기 
                $(".cmAlterBtn").on("click",function(){ // 댓글수정버튼 누르면 댓글입력창 보이기
                	var seq = $(this).attr("seq");
                	var id= "#"+seq;
					$(id).show();
				var alterTextarea = "#alterTextarea" + seq;
               	 $(alterTextarea).html("");
                	
                });
                $(".alterCancelBtn").on("click",function(){
                	var seq = $(this).attr("seq");
                	var id = "#"+seq;
                	 var alterTextarea = "#alterTextarea" + seq;
                	 $(id).hide();
                });
				               	
               
                $(".commentAlterBtn").each(function(i,item){
                	 var btnSeq = $(this).attr("seq");
                     var commentAlterBtn = "#commentAlterBtn" + btnSeq;
                     var alterTextarea = "#alterTextarea" + btnSeq;
                     $(alterTextarea).val();
                     $(commentAlterBtn).on("click",function(){ // 댓글 수정에서 등록버튼 누르면 댓글입력창 숨기기                		
                 		if($(alterTextarea).val() == ""){
                 			alert("내용을 입력해주세요.");
                 		}else{
                 			 $.ajax({
                          		url:"alterComment.board01",
                          		data:{comment:$(alterTextarea).val(),seq:btnSeq}
                          	}).done(function(resp){
                          		if(resp == "수정됨"){
                          			$(alterTextarea).val("");
                          			$(".alterBox").hide();
                          			location.href="freeContent.board01?seq=${content.seq}&&commentPage=${cmCurrnetPage}";
                          		}else if(resp == "수정안됨"){
                          			alter("수정이 정상적으로 완료되지 못하였습니다.")
                          		}
                          	});
                 		}
                 	});
                });
                 	 
             

            });
        </script>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Audiowide|Comfortaa|Gothic+A1|Nanum+Gothic|Nanum+Gothic+Coding|Noto+Sans+KR|Poiret+One|Syncopate&display=swap')
	;
*:not (.content * ){
	margin: 0 auto;
}
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
	box-shadow: 1px 1px 5px #444;
}

.fixedMenu .nav-link {
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

.fixedMenuNav div {
	text-align: center;
	font-size: 20px;
}
/*------------------------------------------------------------------------------------------------*/
.head {
	position: relative;
	top: 250px;
	text-align: center;
}

h1+div {
	border: 1.5px solid #0a47ff;
	width: 500px;
	margin-bottom: 50px;
}

#wrapper {
	border: 0px solid black;
	position: relative;
	top: 250px;
	box-sizing: border-box;
}

#wrapper * {
	font-size: 25px;
}

.titleBox * {
	border-bottom: 1px solid black;
}

.header {
	background-color: #9baec850;
	border-bottom: 1px solid black;
}

.content {
	height: 450px;
	
	overflow:hidden;
		word-wrap:break-word;
	
}

.footer {
	border-top: 1px solid black;
}

.footer>div {
	text-align: right;
	border-bottom: 1px solid black;
}

.footer input[type="button"] {
	margin-bottom: 4px;
	margin-top: 4px;
}

.writeBox>div {
	padding: 0;
}

.commentBox {
	position: relative;
}
.comment{overflow:hidden;
		word-wrap:break-word;
		}
.cmWriter {
	font-weight: bold;
}

.cmBtn {
	text-align: right;
}

.cmBtn>input[type="button"] {
	margin-top: 2px;
}

.comment-writeBox {
	width: 100%;
	height: 100%;
}

.commentBtn {
	width: 100%;
	height: 100%;
}

.comment-Navi {
	text-align: center;
	background-color:;
}

.alterBox {
	z-index: 10;
	background-color: #ffc6e650;
	width: 100%;
	height: 100%;
	margin: 0;
	position: absolute;
}

.alterBox>div {
	padding: 0;
}

.alterBox input[type="button"] {
	width: 100%;
	height: 50%;
}

.alterTextarea {
	width: 100%;
	height: 100%;
}

.line {
	border: 1px solid black;
	width: 95%;
}

a {
	color: black;
}

a:hover {
	color: black;
	font-weight: bold;
}

.noneRecord {
	text-align: center;
	margin-top: 10px;
	margin-bottom: 10px;
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
	<!-- ------------------------------------------------------------------------------------- -->

	<div class="head">
		<h1>자유게시판</h1>
		<div></div>
	</div>
	<form action="deleteContent.board01" id="contentForm" method="get">
	<div id="wrapper" class="container">
		
		<div class="row titleBox">
			<div class="col-lg-2 col-md-2 col-sm-2 firstcol">제목</div>
			<div class="col-lg-10col-md-10 col-sm-10 secondcol">${content.title }</div>
		</div>
		<!------------------------------------------------------------------------------------->
		<div class="header row ">
			<div class="col-lg-2 col-md-2  d-none d-md-block writer firstcol">작성자</div>
			<div class="col-lg-2 col-md-2   d-none d-md-block secondcol">${content.writer }</div>
			<div class="col-lg-1 col-md-1  date  d-none d-md-block firstcol">날짜</div>
			<div class="col-lg-3 col-md-3   d-none d-md-block secondcol">${content.writeDate }</div>
			<div class="col-lg-2 col-md-2  viewCount  d-none d-md-block firstcol">조회수</div>
			<div class="col-lg-2 col-md-2   d-none d-md-block secondcol">${content.viewCount }</div>
		</div>

		<!--------------------------------------------------------------------------------------------------->
		<div class="content row">
			<div class="col-lg-12 col-md-12 col-sm-12 secondcol">${content.content }</div>
		</div>
		</form>
		<!--------------------------------------------------------------------------------------->
		<div class="footer row">
			<c:choose>
				<c:when test="${type == 4 }">
				<div class="col-lg-6 col-md-6 col-sm-6 col-6">
					${content.email}
				</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-6">
				
				</c:when>
				<c:otherwise>
				<div class="col-lg-6 col-md-6 col-sm-6 col-6" hidden>
					${content.email}
				</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-12">
				
				</c:otherwise>
			</c:choose>

				<c:choose>
					<c:when test="${email != content.email and type!=4 }">
						<input type="button" value="수정" class="alterBtn btn btn-primary"
							hidden>
						<!--글 수정버튼-->
						<input type="button" value="삭제" class="deleteBtn btn btn-primary"
							hidden>
						<!--글 삭제버튼-->
					</c:when>
					<c:when test="${email == content.email or type == 4}">
						<input type="button" value="수정" class="alterBtn btn btn-primary">
						<input type="button" value="삭제" class="deleteBtn btn btn-primary">
					</c:when>
				</c:choose>
				<input type="button" value="목록" class="listBtn btn btn-primary">
			</div>
		</div>
		<!----------------------------------------------------------------------------------------->
		<!-- 댓글 -->



		<c:choose>
			<c:when test="${countComment == 0 }">
				<div class="noneRecord">등록된 댓글이 없습니다. 댓글을 달아보세요!</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="list" items="${comList }">
					<div class="row commentBox">

						<!--댓글 수정 입력폼  -->
						<div class="row  mb-5 alterBox" id="${list.seq }">
							<div class="col-lg-11 col-md-9 col-sm-10 col-10">
								<textarea name="alterTextarea" class="alterTextarea"
									maxlength="150" id="alterTextarea${list.seq }" seq=${list.seq }
									></textarea>
							</div>
							<div class="col-lg-1 col-md-3 col-sm-2 col-2">
								<input type="button" value="등록" seq=${list.seq }
									class="commentAlterBtn btn btn-primary"
									id="commentAlterBtn${list.seq }">
								<!--댓글 수정 등록 버튼  -->
								<input type="button" value="취소" seq=${list.seq }
									class="alterCancelBtn btn btn-primary"
									id="alterCancelBtn${list.seq }">
								<!-- 댓글수정창 닫기 -->
							</div>
						</div>


						<div class="col-lg-6 col-md-6 col-sm-6 col-6 cmWriter">${list.writer }</div>
						<!-- 댓글 작성자 -->
						<div class="col-lg-6 col-md-6 col-sm-6 col-6 cmBtn">
							<c:choose>
								<c:when test="${email != list.email and type != 4}">
									<input type="button" class="cmAlterBtn btn btn-primary"
										value="수정" seq=${list.seq } hidden>
									<!--댓글 수정버튼-->
									<input type="button" class="cmDeleteBtn btn btn-primary"
										value="삭제" seq=${list.seq } hidden>
									<!--댓글 삭제버튼-->
								</c:when>
								<c:when test="${email == list.email or type == 4}">
									<input type="button" class="cmAlterBtn btn btn-primary"
										seq=${list.seq } value="수정">
									<input type="button" class="cmDeleteBtn btn btn-primary"
										seq=${list.seq } value="삭제">
								</c:when>
							</c:choose>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-12 comment">${list.comment }</div>
						<!-- 댓글 내용 -->
						<div class="col-lg-12 col-md-12 col-sm-12 col-12">${list.timeForm }</div>
						<!-- 댓글 등록 시간 -->
						<div class="line"></div>
					</div>
				</c:forEach>
				<div class="row comment-Navi">
					<div class="col-lg-12 col-md-12 col-sm-12 col-12 ">${navi }</div>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="row  mb-5 writeBox">
			<div class="col-lg-11 col-md-9 col-sm-10 col-10">
				<textarea name="comment-writeBox" class="comment-writeBox"
					maxlength="150"></textarea>
			</div>
			<div class="col-lg-1 col-md-3 col-sm-2 col-2">
				<input type="button" value="등록" class="commentBtn btn btn-primary">
			</div>
		</div>
	</div>
</body>
</html>