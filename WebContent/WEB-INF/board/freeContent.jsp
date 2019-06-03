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
<!-- JQuery -->
<script>
            $(function(){
                $(".listBtn").on("click",function(){
                    location.href="list.board01?currentPage=${currentPage}";
                })
                $(".deleteBtn").on("click",function(){
                    location.href="deleteContent.board01?seq=${content.seq}&&currentPage=${currentPage}" ;

                    /* $("img").each(function(i, item){
                    var src = $(item).attr("src");
                    console.log(src);
                    $.ajax({
                       url:"deleteFile.board01",
                       type:"post",
                       data:{img:src},
                       cache:false
                    }).done(function(resp){
                        console.log(resp)
                        if(resp == "삭제성공"){
                             location.href="deleteContent.board01?seq=${content.seq}" ;
                        }else{
                           location.href="deleteContent.board01?seq=${content.seq}" ;
                        }
                     });
                 })  */
                })
                $(".comentBtn").on("click",function(){
                   if(${type == null}){
                    alert("로그인 후 이용해주세요");
                 }else{
                    $.ajax({
                          url:"comment.board01",
                          type:"post",
                          data:{comments:JSON.stringify({comment:$(".textarea").html(),
                                       postNum:'${content.seq }',
                                      postTitle:'${content.title }'                                
                                      })
                       }
                          
                       }).done(function(resp){
                          location.href="freeContent.board01?seq=${content.seq}&&commentPage=${cmCurrnetPage}";
                       });
                 };
                   
                   
                   
                  /*  var textarea = $(".textarea").html();
                    var coment = $("<div>나:"+textarea+"</div>");
                    
                    $(".comentBox").append(coment);
                    $(".textarea").html("");
                    return(false); */
                })
            })
        </script>
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

h1+div {
	border: 1.5px solid #0a47ff;
	width: 500px;
	margin-bottom: 50px;
}

.footer>div {
	text-align: right;
}

.comentBox {
	background-color: #eaeaea;
	margin: auto;
}

.writeBox div:first-child, .writeBox div:nth-child(2) {
	padding-left: 0px;
	padding-right: 0px;
	box-sizing: border-box;
	overflow: hidden;
}

.textarea {
	background-color: white;
	width: 100%;
	height: 100px;
	border: 10px solid #eaeaea;
}

.btn {
	width: 150px; /* 원하는 너비설정 */
	height: 60px;
	vertical-align: middle;
	/* 네이티브 화살표를 커스텀 화살표로 대체 */
	border: 1px solid #999;
	border-radius: 10px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
	font-size: 1.8em;
	font-weight: 600;
}

.btn1 {
	width: 80px;
	height: 100px;
	padding: .8em .5em; /* 여백으로 높이 설정 */
	/* 네이티브 화살표를 커스텀 화살표로 대체 */
	border: 1px solid #999;
	border-radius: 10px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
	margin-left: 5px;
	font-size: 1.5em;
	font-weight: 600;
}

.headfont {
	font-size: 1.8em;
	font-weight: 600;
}

.secondcol {
	display: flex;
	align-items: center;
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
					<li class="nav-item"><a class="nav-link active"
						href="goMain.win">메인페이지</a></li>
					<li class="nav-item"><a class="nav-link" href="#">메뉴1</a></li>
					<li class="nav-item"><a class="nav-link" href="#">메뉴2</a></li>
					<li class="nav-item"><a class="nav-link" href="#">메뉴3</a></li>
				</ul>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
		</div>
		<div class="row p-1">
			<div class="col-lg-4 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>

			<div class="col-lg-4 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
		</div>
	</div>
	<!-- ------------------------------------------------------------------------------------------------------------------------------- -->

	<div class="head">
		<h1
			style="font-size: 3em; font-weight: 800; font-family: Noto Serif KR, sans-serif">자유게시판</h1>
		<div></div>
	</div>

	<div id="wrapper" class="container p-5"
		style="border: 4px solid #B1C1F6; border-radius: 1em; border-collapse: separate; font-family: Noto Serif KR, sans-serif">
		<div class="header row " style="border-bottom: 2px solid #0a47ff;">



			<div class="col-lg-2 secondcol mt-3 p-3 headfont">
				<strong>작성자</strong>${content.writer }</div>

			<div class="col-lg-6 secondcol mt-3 p-3 headfont"
				style="text-align: center">
				<strong>시간(날짜)</strong>${content.writeDate }</div>

			<div class="col-lg-2 secondcol mt-3 p-3 headfont">
				<strong>댓글 :</strong> 0
			</div>
			<div class="col-lg-2 secondcol mt-3 p-3 headfont">
				<strong>조회 :</strong> 0${content.viewCount }
			</div>


		</div>
		<div class="content row ">
			<div class="col-lg-12 p-5">
				<h1
					style="font-size: 3em; font-weight: 600; color: #819FF7; font-family: Noto Serif KR, sans-serif">
					제목:아닝ㄴ이닝니미인ㅁ인밍ㄴ미히잏이힝힝 ${content.title }</h1>
			</div>
			<div class="col-lg-12  mt-5"
				style="height: 20em; font-size: 1.8em; font-family: Noto Serif KR, sans-serif">내용${content.content }</div>
		</div>
		<div class="footer row">

			<div class="col-lg-6 col-md-6 col-sm-6 col-6 mt-2 mb-2">
				<input type="button" value="댓  글   ▼" class="btn-primary btn"
					style="float: left"> <input type="button" value="목    록"
					class="listBtn btn btn-primary"
					style="float: left; margin-left: 5px">
			</div>

			<div class="col-lg-6 col-md-6 col-sm-6 col-6 mt-2 mb-2">
				<c:choose>
					<c:when test="${email != content.email}">
						<input type="button" value="삭    제"
							class="deleteBtn btn btn-primary" hidden>
						<input type="button" value="수    정"
							class="alterBtn btn btn-primary" hidden>
					</c:when>
					<c:when test="${email  == content.email }">
						<input type="button" value="삭   제"
							class="deleteBtn btn btn-primary">
						<input type="button" value="수   정"
							class="alterBtn btn btn-primary">
					</c:when>
				</c:choose>
			</div>
		</div>

		<c:forEach var="list" items="${comList }">
			<div class="row comentBox">
				<div class="col-lg-2 col-md-2 col-sm-2 col-2">${list.writer }</div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-4">${list.comment }</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-2">${list.timeForm }</div>
				<div class="col-lg-3 col-md-3 col-sm-3 col-3">버튼자리</div>
			</div>
		</c:forEach>

		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-12">${navi }</div>
		</div>

		<div class="row  mb-5 writeBox mt-2">
			<div class="col-lg-11 col-md-11 col-sm-11 col-11">
				<div class="textarea" contenteditable="true"
					placeholder="댓글을 입력해 주세요."></div>
			</div>

			<div class="col-lg-1 col-md-1 col-sm-1 col-1">
				<input type="button" value="등 록" class="comentBtn btn1 btn-primary">
			</div>
		</div>


	</div>

</body>
</html>