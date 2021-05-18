<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/QnABoardRead.css?after">
<title>비밀번호 입력 페이지</title>
</head>
<jsp:include page="../include/nav.jsp" />
<div style="text-align: center;">
	<img src="${pageContext.request.contextPath}/resources/image/write.jpg">
<form action="pwCheck" method="post">
	<input type="password" name="pw"  placeholder="Pass Word" style="text-align: center; margin-top: 200px; margin-bottom: 50px;"><br>
	<input type="hidden" name="checkId" value="${checkId}">
	<input type="hidden" name="no" value="${no}">
	<input class="button" type="submit" style="margin-bottom: 300px;" value="전송">
</form>
</div>
<%@include file="../include/footer.jsp" %>
