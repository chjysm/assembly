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
<title>회원가입</title>
<script type="text/javascript"
   src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
   charset="utf-8"></script>
<script type="text/javascript"
   src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
   charset="utf-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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

select {
   width: 200px; /* 원하는 너비설정 */
   padding: .8em .5em; /* 여백으로 높이 설정 */
   font-family: inherit; /* 폰트 상속 */
   border: 1px solid #999;
   border-radius: 10px; /* iOS 둥근모서리 제거 */
   -webkit-appearance: none; /* 네이티브 외형 감추기 */
   -moz-appearance: none;
   appearance: none;
}

select :hover {
   cursor: pointer;
}
</style>
<script>
   $(function() {
      var spaceRex = /\s/g;
      var pwRex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/ //  패스워드가 적합한지 검사할 정규식
      var emailRex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;// 이메일이 적합한지 검사할 정규식
      var birthRex = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/
      var idCount = 0;
      var pwCount = 0;
      var certi = 0;
      //아이디 중복 ajax +정규표현식
      $("#email").on("input", function() {
         if (emailRex.exec($("#email").val()) == null) {
            $("#idRegex").css("color", "red");
            $("#idRegex").text("적합한 형식이 아닙니다. ex) cwg94@naver.com ");
            $("#email").attr("flag", "false");
         } else {
            $("#idRegex").text("");
            $.ajax({
               url : "check.me",
               type : "post",
               data : {
                  id : $("#email").val()
               }
            }).done(function(resp) {
               if (resp == 1) {
                  $("#idRegex").css("color", "red");
                  $("#idRegex").text(" *이미 사용중인 계정 입니다.");
                  $("#email").attr("flag", "false");
               } else {
                  $("#idRegex").css("color", "green");
                  $("#idRegex").text(" *사용할 수 있는 계정 입니다.");
                  $("#email").attr("flag", "true");
               }
            })
         }
      });
      //패스워드 regex 
      $("#pw").on(
            "focusout",
            function() {
               if (pwRex.exec($("#pw").val()) == null) {
                  $("#pwRegex").css("color", "red");
                  $("#pwRegex").text(
                        "적합한 형식이 아닙니다. ex)최소 8자리 숫자,문자, 특수문자 각1개씩  ");
                  $("#pw").val("");
                  $("#pw").focus();
                  $("#pw").attr("flag", "false")
               } else {
                  $("#pwRegex").css("color", "green");
                  $("#pwRegex").text("적합한 형식의 비밀번호 입니다. ");
                  $("#pw").attr("flag", "true")
               }
            });
      //패스워드 일치 
      $("#pwcheck").on("input", function() {
         if ($("#pwcheck").val() == $("#pw").val()) {
            $("#pwCheck").css("color", "green");
            $("#pwCheck").text("비밀번호 확인 되었습니다.");
            $("#pwCheck").attr("flag", "true")
         } else {
            $("#pwCheck").css("color", "red");
            $("#pwCheck").text("비밀번호를 다시 확인해 주세요. ");
            $("#pwCheck").attr("flag", "false")
         }
      });
      $("#name").on("focus", function() {
         if ($("#pw").val() == $("#pwcheck").val()) {
            $("#pwCheck").css("color", "green");
            $("#pwCheck").text("사용할 수 있는 비밀번호 입니다. ");
            $("#pw").attr("flag", "true")
         } else {
            $("#pwCheck").css("color", "red");
            $("#pwCheck").text("비밀번호가 일치하지 않습니다.");
            $("#pwcheck").val("");
            $("#pw").val("");
            $("#pw").focus();
            $("#pw").attr("flag", "false")
         }
      })
      $("#nickname").on("focus", function() {
         if ($("#pw").val() == $("#pwcheck").val()) {
            $("#pwCheck").css("color", "green");
            $("#pwCheck").text("사용할 수 있는 비밀번호 입니다. ");
            $("#pw").attr("flag", "true")
         } else {
            $("#pwCheck").css("color", "red");
            $("#pwCheck").text("비밀번호가 일치하지 않습니다.");
            $("#pwcheck").val("");
            $("#pw").val("");
            $("#pw").focus();
            $("#pw").attr("flag", "false")
         }
      })

      $("#sub").on(
            "click",
            function() {
               if ($("#email").attr("flag") == "true"
                     && $("#certi").attr("flag") == "true"
                     && $("#pw").attr("flag") == "true"
                     && $("#pwCheck").attr("flag") == "true"
                     && $("#certi").val() == certi) {
                  if ($("#pw").val() == $("#pwcheck").val()) {
                     $("#form").submit();
                  } else {
                     $("#pwcheck").val("");
                     $("#pw").val("");
                     $("#pw").focus();
                     return false;
                  }
               } else if ($("#email").attr("flag") == "false"
                     || $("#certi").attr("flag") == "false") {
                  alert("이메일이 중복되거나 인증하지 않았습니다.");
               } else {
                  alert("입력하지 않은 값이 있습니다.");
               }
            });
      $("#emailbtn").on("click", function() {
         if ($("#email").attr("flag") == "true") {
            alert("해당 이메일로 인증 번호가 발송 되었습니다!");
            $("#certiRegex").css("color", "green");
            $("#certiRegex").text("인증번호가 발송 되었습니다!. ");
            $.ajax({
               url : "post.ma",
               data : {
                  email : $("#email").val()
               },
               type : "get"
            }).done(function(resp2) {
               certi = resp2;
               console.log(certi);
               $("#certi").attr("disabled", false);
               $("#certibtn").attr("disabled", false);
            });
         } else {
            alert("이메일이 중복 되거나 양식에 맞지 않습니다");
         }
      });
      $("#certibtn").on("click", function() {
         if ($("#certi").val() == certi) {
            if (alert("인증성공") != 0) {
               $("#certi").attr("flag", "true");
               $("#certiRegex").css("color", "green");
               $("#certiRegex").text("인증완료!");
               $("#email").attr("readonly", true);

            }
         } else {
            alert("인증 실패! 이메일과 인증번호를 확인 하세요!");
            $("#certi").attr("flag", "fales");
            $("#certiRegex").css("color", "red");
            $("#certiRegex").text("인증번호가 발송 되었습니다!. ");
         }
      });
      $('#name').keyup(function(event) {
         if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
            var inputVal = $(this).val();
            $(this).val($(this).val().replace(/[^_a-zA-Z0-9가-힣ㄱ-ㅣ]/gi, '')); //_(underscore), 영어, 숫자만 가능
         }
      });
      $('#nickname').keyup(function(event) {
         if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
            var inputVal = $(this).val();
            $(this).val($(this).val().replace(/[^_a-z0-9A-Z가-힣ㄱ-ㅣ]/gi, '')); //_(underscore), 영어, 숫자만 가능
         }
      });

   })
</script>
<title>회원가입</title>
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

            </ul>
         </div>
         <div class="col-lg-1 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
      </div>
   </div>

   <div class="container">
      <form method="post" action="signUp_insert.me" id="form">
         <div class="row">
            <div class="col-lg-8">
               <table class="table  table-hover"
                  style="text-align: center; border: 1px solid #dddddd">
                  <thead>
                     <th colspan="3" class=" btn-primary"><h4>회원 가입</h4></th>
                  </thead>
                  <tbody>
                     <tr>
                        <td style="width: 200px; vertical-align: middle" class="pt-4"><h5>아이디</h5>
                        <td colspan="2">
                           <div class="input-group ">
                              <input type="text" class="form-control" id="email"
                                 name="email" flag="false"
                                 placeholder="이메일을 입력해 주세요. (이메일주소를 아이디로 사용합니다.)"
                                 aria-label="이메일을 입력해 주세요. (이메일주소를 아이디로 사용합니다.)"
                                 aria-describedby="button-addon2"
                                 pattern="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$"
                                 required>
                              <div class="input-group-append">
                                 <button class="btn btn-outline-primary" type="button"
                                    id="emailbtn">인증</button>
                              </div>
                           </div>
                           <div class="float-left" id='idRegex'></div>
                     </tr>
                     <tr>
                        <td style="width: 200px" class="pt-4"><h5>이메일 인증</h5>
                        <td colspan="2">
                           <div class="input-group">
                              <input type="text" class="form-control" id="certi"
                                 name="certi" flag="false" placeholder="인증번호를 입력해 주세요."
                                 aria-label="인증번호를 입력해 주세요." aria-describedby="button-addon2"
                                 required disabled>
                              <div class="input-group-append">
                                 <button class="btn btn-outline-primary" type="button"
                                    id="certibtn" disabled>확인</button>
                              </div>
                           </div>
                           <div class="float-left" id='certiRegex'></div>
                     </tr>
                     <tr>
                        <td style="width: 200px" class="pt-4"><h5>비밀번호</h5> <br>
                        <td colspan="2"><input class="form-control" type="password"
                           id="pw" placeholder="비밀번호를 입력 해주세요."
                           pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
                           flag="false" required><span class="float-left"
                           id="pwRegex"></span><br>
                     </tr>
                     <tr>
                        <td style="width: 200px" class="pt-4"><h5>비밀번호 확인</h5> <br>
                        <td colspan="2"><input class="form-control" type="password"
                           id="pwcheck" name="pwcheck" placeholder="비밀번호를 재입력 해주세요."
                           pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
                           flag="false" required><span class="float-left"
                           id="pwCheck"></span><br>
                     </tr>
                     <tr>
                        <td style="width: 200px" class="pt-4"><h5>이름</h5> <br>
                        <td colspan="2"><input class="form-control" type="text"
                           name="name" id="name" placeholder="이름을 입력해 주세요." maxlength="10"
                           required><br>
                     </tr>
                     <tr>
                        <td style="width: 200px" class="pt-4"><h5>닉네임</h5> <br>
                        <td colspan="2"><input class="form-control" type="text"
                           name="nickname" placeholder="닉네임을 입력해 주세요." maxlength="8"
                           id="nickname" required><br>
                     </tr>
                     <tr>
                        <td style="width: 200px" class="pt-4"><h5>나이</h5>
                        <td style="width: 200px"><select class="float-left"
                           name="age">

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
                        <td>
                     </tr>
                     <tr>
                        <td style="width: 200px" class="pt-4"><h5>성별</h5>
                        <td colspan="2">
                           <div class="form-group"
                              style="text-align: center; margin: 0 auto;">
                              <div class="btn-group " data-toggle="buttons"
                                 style="float: left">
                                 <label class="btn btn-primary active"> <input
                                    type="radio" name="gender" value="M" checked
                                    autocomplete="off" checked>남자
                                 </label> <label class="btn btn-danger"> <input type="radio"
                                    name="gender" value="F" autocomplete="off">여자
                                 </label>
                              </div>
                           </div> <br> <br>
                     </tr>
                     <tr>
                        <td style="text-align: center" colspan="3"><input
                           class="btn btn-primary float-center" style="width: 10rem"
                           type="button" id="sub" value="회원가입">
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
      </form>
   </div>

</body>
</html>