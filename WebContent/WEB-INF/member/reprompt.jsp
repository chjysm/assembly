<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<script>
	$(function(){
		$("#nabtn").on("click",function(){
				location.href="reprompt.na";
		});
		$("#kabtn").on("click",function(){
				location.href="reprompt.ka";
		});
	});
</script>
</head>
<body>
<h1>필수 입력 정보 수집을 모두 동의 해 주세요</h1>
<c:choose>
<c:when test="${type==1}"><input type="button" value="동의하러가기" id= 'nabtn'></c:when>
<c:when test="${type==2}"><input type="button" value="동의하러가기" id= 'kabtn'></c:when>
</c:choose>
</body> 
</html>