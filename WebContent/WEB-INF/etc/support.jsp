<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원</title>
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
.container {
   border: 1px solid #2525DF;
   border-radius: 10px;
   height: 300px;
   vertical-align: middle;
   height: 300px;
}
.header {
   text-align: center;
}
.main1 {
   height: 50px;
}
.main2 {
   height: 50px;
}
.footer {
   text-align: center;
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
#payment_btn {
   width: 150px;
   height: 60px;
   border-radius: 10px;
}
.payment {
   text-align: center;
}
</style>
</head>
<script>
$(function(){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp81233823');
    if(${id==null}){
    	var email="";
    	var name = "";
    }else{
    	var email="${email}";
    	var name ="${name}";
    }
	$("#payment_btn").on("click",function(){
		var  amount = $("#donaMoney").val();
		IMP.request_pay({
		    pg : 'html5_inicis', // version 1.1.0부터 지원.
		    pay_method : $("#donaMethod option:selected").val(),
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '후원',
		    amount : amount,
		    buyer_email : email,
		    buyer_name : name,
		    buyer_tel : '0',
		    buyer_addr : '0',
		    buyer_postcode : '0',
		    m_redirect_url : 'http://localhost:8080/assembly/callback.su'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        msg += '감사합니다!';
		        if(alert(msg)==null){
				    	$.ajax({
				    		url:"insert.su",
				    		data:{
				    			email : "${email}",
				    			name : "${name}",
				    			id : "${id}",
				    			amount : $("#donaMoney").val()
				    		},
				    		type:"post"
				    	}).done(function(){
					    	window.close();
				    	});
				}
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;   
		        alert(msg);
		    }
		});
	});
});
</script>
<body>
<div class="header mt-5">
      <div class="row ">
         <div class="header col-lg-12 ">
            <h1 style="color: #5050C5;">후원 하기 (Donation)</h1>
         </div>
      </div>
   </div>
   <div class="container mt-5">
      <div class="main1 row pt-3">
         <div class="  col-lg-4 col-md-4 col-sm-4">
            <h3 style="margin-top: 8px;">결제 방식</h3>
         </div>
         <div class="  col-lg-8 col-md-8 col-sm-8 float-left">
            <select id="donaMethod">
               <option value="card">카드</option>
               <option value="trans">실시간 계좌이체</option>
               <option value="phone">휴대폰 소액결제</option>
            </select>
         </div>
      </div>
      <div class=" main2 row mt-5">
         <div class=" col-lg-4 col-md-4 col-sm-4">
            <h3>결제 금액</h3>
         </div>
         <div class=" col-lg-8 col-md-8 col-sm-8">
            <input type="text" class="form-control" name="donaMoney"
               id="donaMoney" placeholder="기부하실 금액을 입력해 주세요.">
         </div>
         <div class="col-lg-12 col-md-12 col-sm-12 mt-5 payment">
            <input type="button" class="btn-primary" id="payment_btn"
               style="font-size: 1.5em" value="결제 하기">
         </div>
      </div>
   </div>
</body>
</html>