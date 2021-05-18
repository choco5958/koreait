<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel Delluna | Room - Suite</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reviewStyle.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
	<style type="text/css">
 p {} h2, h3 {font-size:23pt;}
  </style>
</head>
<jsp:include page="../include/nav.jsp" />
<jsp:include page="../include/aside.jsp" />
<body class="stretched">
	<section id="page-title" class="page-title-parallax"
		style="background-image: url(&quot;/TeamProject/resources/image/room.png&quot;); padding: 120px 0px; background-position: 50% -27px;"
		data-stellar-background-ratio="0.3">
		<div class="container clearfix">
			<font size="6" color="white">The White Hotel | Suite Room</font>
		</div>
	</section>
	
	<jsp:include page="../include/aside.jsp" />
	
	<section id="content">
		<div class="content-wrap bgcolor-grey-light">
			<div class="container clearfix">
				<div class="nobottommargin clearfix">
					<div class="nobottommargin">
						<div class="clearfix">
							<p></p>
							<h2 style="margin-top: 30px; margin-bottom: 30px;">스위트 룸(Suite Room) 
							
							<!-- 평점 표시 start -->
							<c:choose>
								<c:when test="${1 <= rating && rating < 2}"><span style="color: red;">❤</span></c:when>
								<c:when test="${2 <= rating && rating < 3}"><span style="color: red;">❤❤</span></c:when>
								<c:when test="${3 <= rating && rating < 4}"><span style="color: red;">❤❤❤</span></c:when>
								<c:when test="${4 <= rating && rating < 5}"><span style="color: red;">❤❤❤❤</span></c:when>
								<c:when test="${5 <= rating && rating < 6}"><span style="color: red;">❤❤❤❤❤</span></c:when>
							</c:choose>
							  ${rating}
							<!-- 평점 표시 end -->
							
							</h2>
							<p></p>
							<p>
								<a href="/TeamProject/reservation/reservationSuite" class="btn btn-primary" role="button">예약하기</a>
								<a href="/TeamProject/QnABoard/mainList" class="btn btn-primary" role="button">문의하기</a>
							</p>
							<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
								integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
								crossorigin="anonymous"></script>
							<script
								src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
								integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
								crossorigin="anonymous"></script>
							<script
								src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
								integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
								crossorigin="anonymous"></script>
							<script>
								$('.carousel').carousel({
									interval : 2000
								})
							</script>
							<div class="container">
								<h2></h2>
							</div>
							<div id="demo" class="carousel slide" data-ride="carousel">
								<div class="carousel-inner">
									<!-- 슬라이드 쇼 -->
									<div class="carousel-item active">
										<!--가로-->
										<img class="d-block w-100"
											src="${pageContext.request.contextPath}/resources/image/505.jpg"
											alt="First slide">
									</div>
									<div class="carousel-item">
										<img class="d-block w-100"
											src="${pageContext.request.contextPath}/resources/image/502.jpg"
											alt="Second slide">
									</div>
									<div class="carousel-item">
										<img class="d-block w-100"
											src="${pageContext.request.contextPath}/resources/image/503.jpg"
											alt="Third slide">
									</div>
									<div class="carousel-item">
										<img class="d-block w-100"
											src="${pageContext.request.contextPath}/resources/image/504.jpg"
											alt="Third slide">
									</div>
									<!-- / 슬라이드 쇼 끝 -->
									<!-- 왼쪽 오른쪽 화살표 버튼 -->
									<a class="carousel-control-prev" href="#demo" data-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<!-- <span>Previous</span> -->
									</a> <a class="carousel-control-next" href="#demo"
										data-slide="next"> <span
										class="carousel-control-next-icon" aria-hidden="true"></span>
										<!-- <span>Next</span> -->
									</a>
									<!-- / 화살표 버튼 끝 -->
									<!-- 인디케이터 -->
									<ul class="carousel-indicators">
										<li data-target="#demo" data-slide-to="0" class="active"></li>
										<!--0번부터시작-->
										<li data-target="#demo" data-slide-to="1"></li>
										<li data-target="#demo" data-slide-to="2"></li>
										<li data-target="#demo" data-slide-to="3"></li>
									</ul>
									<!-- 인디케이터 끝 -->
								</div>
							</div>
							<p>
						
                                    <h3>객실개요</h3><p> 
                                    침대 타입 : 더블침대 2개 + 싱글침대 2개 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 체크인/체크아웃 : 14:00 / 11:00<br>
                                    최대 수용인원 : 4명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 전망 : 오션 뷰
									<hr style="border: solid 1px navy;">
                              		<h3>서비스</h3><p> 
                                    &middot; 제주도의 아름다운 전망(오션 뷰)<p>
                                    &middot; Spa & Garden 해온: 사계절 야외수영장 및 자쿠지, 사우나<br>
                                    &middot; 해온(he:on) 베딩 시스템: 최상의 숙면을 위한 침대 및 침구류<br>
                                    &middot; 실내 자쿠지,미팅/다이닝 공간<br>
                                    &middot; 맞춤형 베개 제공<br>
                                    &middot; 요청 시 한실 베개,젠 메밀 베개,바이오 베개,메모리폼 베개,양모 베개 제공<br>
                                    &middot; 전 객실 초고속 무료 인터넷 (유선, 와이파이)
									<hr style="border: solid 1px navy;">
                              		<h3>어메니티</h3><p> 
                                    일반 : 75" LCD TV 2개 / 발코니 / 손전등 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 욕실 : 욕실용품(몰튼브라운) / 비데 / 면도기 / 목욕 가운 / 헤어드라이어<br>
                                    기타 : 케이블,위성 TV채널 / 무료 생수 1일 4병 / 무료 차(Tea) 서비스 제공
                                    <hr style="border: solid 1px navy;">            	
        </section>
	<!-- #content end -->
	
	<!-- review -->
	<script type="text/javascript">
	function check() {
		  if(fr.reviewText.value == "") {
		    alert("값을 입력해 주세요.");
		    fr.reviewText.focus();
		    return false;
		  }
		  else return true;
		}
	</script>
	
	<section style="margin-top: 50px;">
	<div class="div1">
		<div class="div2">
			<form action="SuiteRoom" method="post" name="fr" onsubmit="return check()">
				<div class="div3">
				
					<select style="color: red;" name="selectHeart">
 	 					<option value="1">❤</option>
 	 					<option value="2">❤❤</option>
			    		<option value="3">❤❤❤</option>
			    		<option value="4">❤❤❤❤</option>
						<option value="5">❤❤❤❤❤</option>
					</select>
					
					<div class="textarea-div">
						<textarea rows="6" cols="" style="width: 100%; margin-top: 3px;" name="reviewText" placeholder="리뷰를 입력해보세요!"></textarea>
					</div>
				
					<input class="btn btn-default btn-primary" type="submit" value="리뷰등록" style="width: 100%; margin-top: 10px;">
					<input type="hidden" name="Suite" value="Suite">
				</div>
			</form>
			<div class="tablecontainer">
				<table class="table1">
					<thead>
						<tr>
							<td>rating</td>
							<td>user</td>
							<td>review</td>
							<td>date</td>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="item" items="${reviewListAll}">
					<tr>
						<c:choose>
							<c:when test="${item.rating <= 1}"><td style="color: red; text-align: left; padding-left: 15px; width: 100px;">❤</td></c:when>
							<c:when test="${item.rating <= 2}"><td style="color: red; text-align: left; padding-left: 15px; width: 100px;">❤❤</td></c:when>
							<c:when test="${item.rating <= 3}"><td style="color: red; text-align: left; padding-left: 15px; width: 100px;">❤❤❤</td></c:when>
							<c:when test="${item.rating <= 4}"><td style="color: red; text-align: left; padding-left: 15px; width: 100px;">❤❤❤❤</td></c:when>
							<c:when test="${item.rating <= 5}"><td style="color: red; text-align: left; padding-left: 15px; width: 100px;">❤❤❤❤❤</td></c:when>
						</c:choose>
						<td>${item.userId}</td>
						<td style="width: 460px; text-align: left;">${item.text}</td>
						<td><fmt:formatDate value="${item.regDate}" pattern="yyyy.MM.dd"/></td>
					</tr>
					</tbody>
					</c:forEach>
				</table>
				<div style="display: block; text-align: center; margin-top: 20px;">
					<c:if test="${paging.startPage != 1 }">
						<a href="?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<b>${p }</b>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<a href="?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- review end -->
	
	<%@include file="../include/footer.jsp" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>
</html>