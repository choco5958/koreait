<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/QnABoardRead.css?after">
<title>글수정</title>
</head>
<body>

<div class="header"><jsp:include page="../include/nav.jsp" /></div>
<img src="${pageContext.request.contextPath}/resources/image/write.jpg">
<div class="container">

<div align="center" class="div_form">
<form action="writerUpdate" method="post">	
	<c:forEach var="item" items="${qnaBoardVO }" varStatus="status">	
	<div class="div_id">ID : ${item.id}</div>
	<div class="div_title"><input type="text" name="title" value="${item.title}" style="border: none; text-align: center;"></div><br>
	<div class="div_board"><textarea rows="28" cols="125" name="board" style="border: none;">${item.board}</textarea></div>
	<input type="hidden" name="no" value="${item.no }">
	</c:forEach>
	<input class="button" type="submit" value="수정 완료">
</form>
</div>
</div>
<div><%@include file="../include/footer.jsp" %></div>

</body>
</html>