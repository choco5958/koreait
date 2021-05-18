<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

   
<!DOCTYPE html>
<html>
<head>
<!-- 예약삭제 -->
<script type="text/javascript">
	function goPost(rNo) {
		// 1. 데이터 세팅
		var rNo = rNo;
			
		if(!confirm("예약번호 " + rNo + "번을 삭제 하시겠습니까?")){
			retrun;
		} else {
								
		// 2. Form 연결
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post");
		form.setAttribute("action", "reservationDelete");
		
		formInput(form, "rNo", rNo);
		
		
		// 4. 전송
		document.body.appendChild(form);
		form.submit();
		}
	}
	
	//자바스크립트 폼에 값입력
	function formInput(form, name, value) {
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", name);
		hiddenField.setAttribute("value", value);
		form.appendChild(hiddenField);
	}
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservationList.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="header"><%@include file="../include/nav.jsp" %></div>

<div class="title" align="center"><hr class="hr"><br>나의 예약</div>
<div class="item">
	<table class="list">
	<thead>
	<tr>
		<th scope="col">예약번호</th>
		<th scope="col">아이디</th>
		<th scope="col">이름</th>
		<th scope="col">연락처</th>
		<th scope="col">인원수</th>
		<th scope="col">체크인</th>
		<th scope="col">체크아웃</th>
		<th scope="col">객실타입</th>
		<th scope="col">결제금액</th>
		<th scope="col">예약취소</th>
	</tr>
	</thead>	
	<c:forEach var="item" items="${reservationList}" varStatus="status">
	<tbody>
	<tr>
		<td>${item.rNo}</td>
		<td>${item.ruserId}</td>
		<td>${item.ruserName}</td>
		<td>${item.ruserPhone}</td>
		<td>${item.ruserCount}</td>
		<td>${item.checkIn}</td>
		<td>${item.checkOut}</td>
		<td>${item.roomType}</td>
		<td>${item.ruserPrice}원</td>
		<td><button class="button" name="rNo" value="${item.rNo}" onClick="goPost(${item.rNo})">Delete</button></td>
	</tr>
	</tbody>
	</c:forEach>
	</table>
	</div>
	<hr class="hr2">
	
	<div><%@include file="../include/footer.jsp" %></div>
</body>
</html>