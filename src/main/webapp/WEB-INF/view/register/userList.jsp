<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

   
<!DOCTYPE html>
<html>
<head>
<!-- 예약삭제 -->
<script type="text/javascript">
	function goPost(userCode) {
		// 1. 데이터 세팅
		var userCode = userCode;
			
		if(!confirm("유저코드 : " + userCode + "을 삭제 하시겠습니까?")){
			retrun;
		} else {
								
		// 2. Form 연결
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post");
		form.setAttribute("action", "userDelete");
		
		formInput(form, "userCode", userCode);
		
		
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
		var userId = document.getElementsByName('userId')[0].value;

		
		// 2. 데이터 검증
		
		if (userId == ''){
			alert("검색 아이디를 입력하여 주세요.");
			return;
		}
		
		
			
		// 3. Form 연결	
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post");
		form.setAttribute("action", "userList");
				
		formInput(form, "userId", userId);
				
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservationManager.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="header"><%@include file="../include/nav.jsp" %></div>

<div class="title" align="center"><hr class="hr"><br>회원 조회</div><br>
	<div class="search">
		<input type="text" name="userId" class="input" placeholder="검색 아이디">
		<input type="submit" value="검색하기" class="searchbtn" onClick="goSearch()"><br>
	</div>
<div class="item">
	<table class="list">
	<thead>
	<tr>
		<th scope="col">유저코드</th>
		<th scope="col">아이디</th>
		<th scope="col">이름</th>
		<th scope="col">전화번호</th>
		<th scope="col">주소</th>
		<th scope="col">가입일</th>
		<th scope="col">회원등급</th>
		<th scope="col">회원삭제</th>
	</tr>
	</thead>	
	<c:forEach var="item" items="${userList}" varStatus="status">
	<tbody>
	<tr>
		<td>${item.userCode}</td>
		<td>${item.userId}</td>
		<td>${item.userName}</td>
		<td>${item.userPhone}</td>
		<td>${item.userAddress}</td>
		<td>${item.userRegdate}</td>
		<td>${item.userGrade}</td>
		<td><button class="button" name="userId" value="${item.userCode}" onClick="goPost(${item.userCode})">Delete</button></td>
	</tr>
	</tbody>
	</c:forEach>
	</table>
	</div>
	<hr class="hr2">
	
	<div><%@include file="../include/footer.jsp" %></div>
</body>
</html>