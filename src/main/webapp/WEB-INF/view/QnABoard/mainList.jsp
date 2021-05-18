<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/QnABoard.css">
<title>게시판</title>
</head>
<jsp:include page="../include/nav.jsp" />
<div class="QnABoard">
	<img src="${pageContext.request.contextPath}/resources/image/write.jpg">
	<h2>Q n A 게 시 판</h2>
	<table>
	<tr>
		<td class="td1" style="background-color: #fffafa">no</td>
		<td class="td2" style="background-color: #fffafa">글쓴이</td>
		<td style="background-color: #fffafa">제목</td>
		<td class="td4" style="background-color: #fffafa">작성 날짜</td>
	</tr>
	<c:forEach var="item1" items="${managerList}" varStatus="status">
	<tr>
		<td class="td1" style="color: orange;">[공지]</td>
		<td class="td2">관리자</td>
		<td class="td3"><a href="notice?no=${item1.no}" style="color: orange;">${item1.title }</a></td>
		<td class="td4">${item1.r_date }</td>
	</tr>
	</c:forEach>
	
	<c:forEach var="item2" items="${allList}" varStatus="status">
	<tr>
		<td class="td1">${status.count}</td>
		<td class="td2">${item2.id }</td>
		<td class="td3"><a href="pwCheck?no=${item2.no}" style="color:black;">${item2.title }</a></td>
		<td class="td4">${item2.r_date }</td>
	</tr>
	</c:forEach>
	</table>
	<input type="button" value="write" onclick="location.href='write'">
</div>
<%@include file="../include/footer.jsp" %>
</html>