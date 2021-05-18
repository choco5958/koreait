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
		form.setAttribute("action", "reservationMDelete");
		
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

<!-- 기간 예약조회 -->
<script type="text/javascript">
	function goSearch() {
		// 1. 데이터 세팅
		var checkIn = document.getElementsByName('checkIn')[0].value;
		var checkOut = document.getElementsByName('checkOut')[0].value;
		
		
		// 2. 데이터 검증
		
		if (checkIn == ''){
			alert("검색 시작일을 입력하여 주세요.");
			return;
		}
		else if (checkOut == ''){
			alert("검색 종료일을 입력하여 주세요.");
			return;
		}
		
			
		// 3. Form 연결	
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post");
		form.setAttribute("action", "reservationManager");
				
		formInput(form, "checkIn", checkIn);
		formInput(form, "checkOut", checkOut);
				
		// 4. 전송
		document.body.appendChild(form);
		form.submit();
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

<!-- 기간조회 달력 api -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$.noConflict();
jQuery(document).ready(function( $ ){
		$("#datepicker1, #datepicker2").datepicker({
			dateFormat: "yy-mm-dd",  //텍스트 필드에 입력되는 날짜
			minDate: 0,			     //오늘이전 날짜 블록처리
			changeYear: true,		 //년도 변경
			changeMonth: true,		 //월 변경
			showMonthAfterYear: true,//셀렉트 박스를 년,월 순으로 변경
			dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], //요일의 한글 형식
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //월의 한글 형식
		});
	});
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservationManager.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="header"><%@include file="../include/nav.jsp" %></div>

<div class="title" align="center"><hr class="hr"><br>관리자 예약관리</div><br>
	<div class="search">
		<input type="text" name="checkIn" class="input" id="datepicker1" placeholder="검색 시작일">~
		<input type="text" name="checkOut" class="input" id="datepicker2" placeholder="검색 종료일">
		<input type="submit" value="검색하기" class="searchbtn" onClick="goSearch()"><br>
	</div>
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
	<c:forEach var="item" items="${reservationManager}" varStatus="status">
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