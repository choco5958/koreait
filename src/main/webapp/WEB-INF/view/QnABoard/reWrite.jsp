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
			<form action="stepWrite" method="post">
					<div class="div_title" style="height: 50px;">
						<input class="title" type="text" name="title"
					placeholder="제목을 입력하세요" style="border: none;">
					</div>
					<input type="hidden" name="id" value="${sessionScope.id }">
					<input type="hidden" name="no" value="${no}">
					<br>
					<div class="div_board">
						<textarea rows="28" cols="123" name="board"
							placeholder="내용을 입력하세요" style="border: none;"></textarea>
					</div>
				<input class="button" type="submit" value="작성 완료">
			</form>
		</div>
	</div>
	<div><%@include file="../include/footer.jsp"%></div>
</html>
