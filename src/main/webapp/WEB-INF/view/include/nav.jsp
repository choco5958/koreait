<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="en"> 
<head> 
  <title>Bootstrap Example</title> 
  <meta charset="utf-8"> 
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"> 
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> 
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> 
</head> 
<body>
<div class="top">
<div class="top-nav">
<a href="/TeamProject/main/main"><h2>THE WHITE HOTEL</h2></a>
<ul class="top-nav-content">
	<li class="top-nav-item">
		<a href="#" class="top-nav-link">호텔찾기</a>
	</li>
	<li class="top-nav-item">
		<a href="#" class="top-nav-link">멤버쉽</a>
	</li>
	<c:choose>
	<c:when test="${userGrade >= 3 }">
	<li class="top-nav-item">
		<a href="/TeamProject/reservation/reservationManager" class="top-nav-link">예약고객조회</a>
	</li>
	<li class="top-nav-item">
		<a href="/TeamProject/register/userList" class="top-nav-link">회원정보조회</a>
	</li>
	</c:when>
	<c:otherwise>
	<li class="top-nav-item">
		<a href="/TeamProject/reservation/reservationList" class="top-nav-link">예약조회</a>
	</li>
	</c:otherwise>
	</c:choose>
	<c:choose>
	<c:when test="${sessionScope.loginId eq null}">
	<li class="top-nav-item" style="border:1px solid #dcdcdc;padding:5px;">
		<a href="/TeamProject/login/form" class="top-nav-link">로그인</a>
	</li>
	</c:when>
	<c:otherwise>
	<li class="top-nav-item">
		<a href="/TeamProject/register/information" class="top-nav-link">회원정보</a>
	</li>
	<li class="top-nav-item" style="border:1px solid #dcdcdc;padding:5px;">
		<a href="/TeamProject/login/logout" class="top-nav-link">로그아웃</a>
	</li>
	</c:otherwise>
	</c:choose>
</ul>
</div>
<ul class="nav justify-content-center">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="/TeamProject/main/map">호텔소개</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/TeamProject/main/StandardRoom">객실</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/TeamProject/main/dining">다이닝</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/TeamProject/main/facilities">부대시설</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/TeamProject/QnABoard/mainList">고객의 소리</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/TeamProject/reservation/reserve">예약하기</a>
  </li>
</ul>
</div>
</body> 
</html>