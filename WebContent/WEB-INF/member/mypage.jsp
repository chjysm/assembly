<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<style>
@import
   url('https://fonts.googleapis.com/css?family=Audiowide|Comfortaa|Gothic+A1|Nanum+Gothic|Nanum+Gothic+Coding|Noto+Sans+KR|Poiret+One|Syncopate&display=swap')
   ;

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

.fixMenu-text {
   position: relative;
   top: 20px;
}

.fixedMenu div {
   text-align: center;
   font-size: 30px;
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

#age {
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

#nickname {
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

td {
   font-size: 25px;
   font-weight: 600;
   color: #819FF7;
}

input[type=button]:hover {
   background: #6133FF;
   color: white;
}

input[type=submit]:hover {
   background: #6133FF;
   color: white;
}

select {
   width: 200px; /* 원하는 너비설정 */
   margin-left: 40px;
   padding: .8em .5em; /* 여백으로 높이 설정 */
   font-family: inherit; /* 폰트 상속 */
   border: 1px solid #999;
   border-radius: 20px; /* iOS 둥근모서리 제거 */
   -webkit-appearance: none; /* 네이티브 외형 감추기 */
   -moz-appearance: none;
   appearance: none;
}

select :hover {
   cursor: pointer;
}

.st_row {
   text-align: center;
}

.st_row td {
   border-top: 0px;
}
</style>
<script>
   $(function() {

      $("#pwChange_btn").on("click", function() {
         //             location.href="getPw.me";
         open("pwChangeGo.me", "_brank", "width=600px,height=500px")
      })
      $("#back_btn").on("click", function() {
         location.href = "goMain.win";
      })
      $("#modify_btn").on("click", function() {
         $("#mpForm").submit();
      })
      $("input[name='gender']").filter("[value=${list[0].gender}]").prop(
            "checked", true);
      $("input[name='age']").filter("[value=${list[0].age}]").prop(
            "selected", true);

      $('#nickname').keyup(function(event) {
         if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
            var inputVal = $(this).val();
            $(this).val($(this).val().replace(/[^_a-z0-9A-Z가-힣ㄱ-ㅣ]/gi, '')); //_(underscore), 영어, 숫자만 가능
         }
      });
   })
</script>
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
   <div class="container">
      <form method="post" action="modify.me" id="mpForm">
         <div class="row">
            <div class="col-lg-8">
               <table class="table "
                  style="border: 1px solid #dddddd; border-radius: 1em; border-collapse: separate">
                  <tr>
                     <td colspan="3" class="btn-primary"
                        style="text-align: center; vertical-align: middle; border-radius: 2em"><span>마이
                           페이지 (회원 정보 수정)</span>
                  </tr>
                  <c:forEach var="i" items="${ list}">
                     <tbody>
                        <tr class="pt-4">
                           <td
                              style="width: 200px; height: 80px; text-align: center; vertical-align: middle"><span><strong>이름</strong></span>
                           <td colspan="2"
                              style="text-align: left; vertical-align: middle"><span>${i.name }</span>
                        </tr>
                        <tr class="pt-4">
                           <td
                              style="width: 200px; height: 80px; text-align: center; vertical-align: middle"><span><strong>아이디(이메일)</strong></span>
                           <td colspan="2"
                              style="text-align: left; vertical-align: middle"><span>${i.email }</span>
                        </tr>
                        <c:choose>
                           <c:when test="${i.type==3 }">
                              <tr class="pt-4">
                                 <td
                                    style="width: 200px; height: 80px; text-align: center; vertical-align: middle"><span><strong>비밀번호</strong></span>
                                 <td colspan="2"><input type="button"
                                    class=" btn btn-primary float-left" id="pwChange_btn"
                                    value="비밀번호 변경하기">
                              </tr>
                           </c:when>
                           <c:otherwise>
                           </c:otherwise>
                        </c:choose>
                        <tr class="pt-4">
                           <td
                              style="width: 200px; height: 80px; text-align: center; vertical-align: middle"><span><strong>닉네임</strong></span>
                           <td colspan="2"
                              style="text-align: center; vertical-align: middle"><span><input
                                 class="form-control" type="text" style="width: 200px"
                                 id="nickname" name=nickname value="${i.nickname}"
                                 maxlength="6"></span>
                        </tr>
                        <tr class="pt-4">
                           <td
                              style="width: 200px; height: 80px; text-align: center; vertical-align: middle"><span><strong>나이</strong></span>
                              <c:choose>
                                 <c:when test="${empty i.age }">

                                    <td colspan="2"
                                       style="text-align: left; vertical-align: middle">없 음
                                 </c:when>
                                 <c:otherwise>
                                    <td colspan="2"
                                       style="text-align: left; vertical-align: middle">${i.age }
                                 </c:otherwise>
                              </c:choose> <select name="age" required>

                                 <option value="" selected disabled hidden>연령대 수정</option>
                                 <option value="10-19">10 - 19</option>
                                 <option value="20-29">20 - 29</option>
                                 <option value="30-39">30 - 39</option>
                                 <option value="40-49">40 - 49</option>
                                 <option value="50-59">50 - 59</option>
                                 <option value="60-69">60 - 69</option>
                                 <option value="70-79">70 - 79</option>
                                 <option value="80-89">80 - 89</option>
                                 <option value="90-99">90 - 99</option>
                           </select>
                        </tr>
                        <tr class="pt-4">
                           <td
                              style="width: 200px; height: 80px; text-align: center; vertical-align: middle"><span><strong>성별</strong></span>
                           <td style="text-align: left; vertical-align: middle"><span><input
                                 type="radio" name="gender" value="M" required>남자<input
                                 class=" ml-3" type="radio" name="gender" value="F" required>여자</span>
                           <td>
                        </tr>

                        <tr class="pt-4">

                           <td style="text-align: center" colspan="3"><input
                              class="btn btn-primary float-center" style="width: 10rem"
                              id="modify_btn" type="submit" value="수정"><input
                              class="btn btn-primary float-center ml-1" style="width: 10rem"
                              id="back_btn" type="button" value="뒤로가기">
                        </tr>
                     </tbody>
                  </c:forEach>
               </table>
            </div>
         </div>
      </form>
      <div class="row ">
         <div class="col-lg-12">
            <table class="table "
               style="border: 1px solid #dddddd; border-radius: 1em; border-collapse: separate">
               <tr class="st_row">
                  <td>상표
                  <td colspan=3>내 답안
                  <td>완료한 날짜
               </tr>
               <c:forEach var="i" items="${s_list}">
                  <tr class="st_row">
                     <td>${ i.brand}
                     <td colspan=3>${ i.answer}
                     <td>${ i.comp_date}
                  </tr>
               </c:forEach>
            </table>
         </div>
      </div>

   </div>
</body>
</html>