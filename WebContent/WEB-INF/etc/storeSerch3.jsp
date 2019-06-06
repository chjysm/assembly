<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>주변매장검색</title>
<style>
	#btn{
        width: 100%;
		text-align: center;
        align-content: center;
	}
    #backBtn{
        font-size: 30px;
    }
</style>
<script>
	$(function(){
		$("#backBtn").on("click",function(){
			location.href="goStoreSerch.win";
		});
	});
</script>
</head>
<body>
<iframe src="http://map.daum.net/?sName=${addr}&eName=${brand}" width="800px" height="500px"></iframe><br>
<div id="btn"><input type="button" class="btn btn-primary" value ="다시 입력 하기" id="backBtn"></div>
</body>
</html>