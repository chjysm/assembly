<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
.container {
   padding: 20px 40px;
   margin-top: 30px;
   margin-left: 20px;
   margin-right: 20px;
   border: 1px solid;
   border-radius: 10px;
   border-color: #007bff;
   text-align: center;
   align-content: center;
   background-color: #007bff11;
}

.header {
   margin-top: 30px;
}

.input-group {
   margin-top: 20px;
   justify-content: flex-end;
}

#sepc_div {
   text-align: center;
}
</style>
</head>
<script>
   $(function() {
      var pwRex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/ //  패스워드가 적합한지 검사할 정규식
      $("#pwCheck_btn").on("click", function() {
         $.ajax({
            url : "pwChange.me",
            data : {
               pw : $("#pw").val()
            },
            type : "post"
         }).done(function(resp) {
            console.log(resp)
            if (resp == 1) {
               alert("패스워드가 일치합니다. 새 비밀번호를 입력해 주세요.");
               $("#pwchange_btn").attr("disabled", false);
               $("#pwCheck_btn").attr("disabled", true);
            } else {
               alert("패스워드가 일치하지 않습니다. 비밀번호를 확인해 주세요.");
               $("#pw").val("");
            }
         })
      })

      //패스워드 regex 
      $("#newPw").on(
            "focusout",
            function() {
               if (pwRex.exec($("#newPw").val()) == null) {
                  $("#pwRegex").css("color", "red");
                  $("#pwRegex").text(
                        "적합한 형식이 아닙니다. ex)최소 8자리 숫자,문자, 특수문자 각1개씩  ");
                  $("#newPw").val("");
                  $("#newPw").focus();
               } else {
                  $("#pwRegex").css("color", "green");
                  $("#pwRegex").text("사용할 수 있는 비밀번호 입니다. ");
               }
            })
      $("#newPwCheck").on("focusout", function() {

         if ($("#newPw").val() == $("#newPwCheck").val()) {
            $("#pwSpan").css("color", "green");
            $("#pwSpan").text("비밀번호 확인 되었습니다.");
            $("#newPw").attr("flag", "true");
            $("#newPwCheck").attr("flag", "true");
         } else {
            $("#pwSpan").css("color", "red");
            $("#pwSpan").text("비밀번호를 다시 확인해 주세요. ");
            $("#newPwCheck").val("");
            $("#newPwCheck").focus();
            $("#newPw").attr("flag", "false");
            $("#newPwCheck").attr("flag", "false");
         }
      })
      $("#pwchange_btn").on(
            "click",
            function() {
               if ($("#newPw").attr("flag") == "true"
                     && $("#newPwCheck").attr("flag") == "true")
                  if ($("#newPw").val() == $("#newPwCheck").val()) {
                     $("#dataForm").submit();
                  } else {
                     $("#newPw").val("");
                     $("#newPwCheck").val("");
                     $("#newPw").focus();
                     return false;
                  }
            })
   })
</script>
<body>
   <div class="container ">
      <div class="row  header">
         <div class="col-lg-10 d-md-block">
            <h3 class="comment">
               본인 확인을 위해 패스워드를 <br> 입력해 주세요!
            </h3>
         </div>
      </div>
      <div class="row ">
         <div class="col-lg-10 input-group mb-2">
            <input type="password" class="form-control" id="pw"
               placeholder="이전 패스워드를 입력해 주세요." aria-label="Recipient's username"
               aria-describedby="button-addon2" flag="false" required>
            <div class="input-group-append">
               <button class="btn btn-outline-primary" type="button"
                  id="pwCheck_btn">패스워드 확인</button>
            </div>

         </div>
      </div>
      <div class="row ">
         <div class="col-lg-10 input-group">

            <input type="password" class="form-control" id="newPw"
               placeholder="새 비밀번호를 입력해 주세요." aria-label="Recipient's username"
               aria-describedby="button-addon2" flag="false" required>

         </div>
         <div id="pwRegex"></div>
      </div>
      <form id="dataForm" action="pwChangeOn.me" method="POST">
         <div class="row ">
            <div class="col-lg-10 input-group mb-2">

               <input type="password" class="form-control" id="newPwCheck"
                  name="pwCheck" placeholder="새 비밀번호를 다시 입력해 주세요."
                  aria-label="Recipient's username" aria-describedby="button-addon2"
                  required>


            </div>
            <div id="pwSpan"></div>
         </div>
         <div class="row ">
            <div class="col-lg-10 input-group mb-2">
               <button class="btn btn-outline-primary" type="button"
                  id="pwchange_btn">패스워드 변경</button>
            </div>
         </div>
      </form>
   </div>

</body>
</html>