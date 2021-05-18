<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/resources/css/test1.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script type="text/javascript">
    </script>
<title>White Korea</title>
</head>
<body>
<%@ include file="../include/nav.jsp" %>
<div class="img">
<img src="${pageContext.request.contextPath}/resources/image/write.jpg">
</div>
<c:choose>
<c:when test="${updateResert eq true}">
<table style="width: 250px; height: 200px; text-align: center; margin-left: auto; margin-right: auto; margin-top: 200px; margin-bottom: 200px;">
	<tr>
		<td>비밀번호가 변경되었습니다.</td>
	</tr>
	<tr>
		<td><a href="information"><input type="button" class="button" value="확인" style="width: 120px;"></a></td>
	</tr>
</table>
</c:when>
<c:otherwise>
<table style="width: 250px; height: 200px; text-align: center; margin-left: auto; margin-right: auto; margin-top: 200px; margin-bottom: 200px;">
	<tr>
		<td>비밀번호가 틀렸습니다.</td>
	</tr>
	<tr>
		<td><a href="pwChangeForm"><input type="button" class="button" value="돌아가기" style="width: 120px;"></a></td>
	</tr>
</table>
</c:otherwise>
</c:choose>
<%@ include file="../include/footer.jsp" %>
</body>
</html>