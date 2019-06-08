<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>회원 관리</title>
        <meta name="viewport"
              content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <style>
            * {
                margin: 0 auto;
            }

            .container {
                padding: 20px;
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
        </style>
        <script>
            $(function() {
                $("input[name='gender']").filter("[value=${list[0].gender}]").prop(
                    "checked", true);
                $("input[name='age']").filter("[value=${list[0].age}]").prop(
                    "selected", true);
            })
        </script>
    </head>
    <body>
        <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <table class="table " style="border: 1px solid #dddddd; border-radius: 1em; border-collapse: separate">
                            <tr>
                                <td colspan="3" class="btn-primary" style="text-align: center; vertical-align: middle; border-radius: 2em">
                                    <span>회원관리 페이지</span>
                            </tr>
                            <tbody>
                                <tr class="pt-4">
                                    <td style="width: 200px; height: 80px; text-align: center; vertical-align: middle">
                                        <span><strong>아이디</strong></span>
                                    <td colspan="2" style="text-align: left; vertical-align: middle">
                                        <span>${mdto.id }</span>
                                </tr>
                                <tr class="pt-4">
                                    <td style="width: 200px; height: 80px; text-align: center; vertical-align: middle">
                                        <span><strong>이메일</strong></span>
                                    <td colspan="2" style="text-align: left; vertical-align: middle">
                                        <span>${email }</span>
                                </tr>
                                <tr class="pt-4">
                                    <td style="width: 200px; height: 80px; text-align: center; vertical-align: middle">
                                        <span><strong>이름</strong></span>
                                    <td colspan="2" style="text-align: left; vertical-align: middle">
                                        <span>${mdto.name }</span>
                                </tr>
                                <tr class="pt-4">
                                    <td style="width: 200px; height: 80px; text-align: center; vertical-align: middle">
                                        <span><strong>성별</strong></span>
                                    <td colspan="2" style="text-align: left; vertical-align: middle">
                                        <span>${mdto.gender }</span>
                                </tr>
                                <tr class="pt-4">
                                    <td style="width: 200px; height: 80px; text-align: center; vertical-align: middle">
                                        <span><strong>연령대</strong></span>
                                    <td colspan="2" style="text-align: left; vertical-align: middle">
                                        <span>${mdto.age }</span>
                                </tr>
                                <tr class="pt-4">
                                    <td style="width: 200px; height: 80px; text-align: center; vertical-align: middle">
                                        <span><strong>상태</strong></span>
                                    <td style="text-align: left; vertical-align: middle">
                                        <span>
                                       		 <input id="N" type="radio" name="ban" value="N"> 활성화 (정상)
                                             <input id="Y" class=" ml-3" type="radio" name="ban" value="Y"> 비활성화 (정지)
                                        </span>
                                    <td>
                                </tr>
                                <tr class="pt-4">
                                    <td style="text-align: center" colspan="3">
                                        <button class="btn btn-primary float-center" style="width: 10rem" id="complete_btn">페이지 닫기</button>
                                </tr>
                                <script>                        
                                $("input[name='ban']").filter("[value=${mdto.ban}]").prop("checked", true);
                                $("#complete_btn").click(function(){
                 					window.close();
                            	})
                                $("#N").click(function(){
                                	var radioVal = $('input[name="ban"]:checked').val();
                                	$.ajax({
                                		url : "ban.admin",
                                		type : "post",
                                		data : {
                                			key : radioVal
                                		}
                                	}).done(function(resp){
                           			    alert("회원을 정상(활성화) 상태로 복원시켰습니다");
                                	})
                        		})
                            	$("#Y").click(function(){
                            		var radioVal = $('input[name="ban"]:checked').val();
                                	$.ajax({
                                		url : "ban.admin",
                                		type : "post",
                                		data : {
                                			key : radioVal,
                                		}
                                	}).done(function(resp){
                           			    alert("회원을 정지(비활성화) 시켰습니다.");
                                	})
                            	})
                                </script>                        
                            </tbody>
                        </table>
                    </div>
                </div>
        </div>
    </body>
</html>