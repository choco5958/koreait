<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
	charset="UTF-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/QnABoardRead.css?after">
<title>글쓰기</title>
</head>
	<div class="header"><jsp:include page="../include/nav.jsp" /></div>
	<img src="${pageContext.request.contextPath}/resources/image/write.jpg">
	<div class="container">
		<div align="center" class="div_form">
			<form action="refWrite" method="post">
					<div class="div_id">${sessionScope.id }<input type="hidden"
							name="id" value="${sessionScope.id }">
					</div>
					<div class="div_title" style="height: 50px;">
						<input class="title" type="text" name="title" style="border: none;"
							placeholder="제목을 입력하세요">
					</div>
					<br>
					<div class="div_board">
						<textarea rows="30" cols="123" name="board" style="border: none;"
							placeholder="내용을 입력하세요"></textarea>
					</div>
				<input class="button" type="submit" value="작성 완료">
			</form>
		</div>
	</div>
	<div><%@include file="../include/footer.jsp"%></div>
</html>