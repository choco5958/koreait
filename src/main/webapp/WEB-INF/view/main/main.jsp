<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
<title>THE WHITE HOTEL</title>
</head>
<body ondragstart="return false">
	<jsp:include page="../include/nav.jsp" />
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel" style="z-index: 0;">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="${pageContext.request.contextPath}/resources/image/bg1.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/resources/image/bg2.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/resources/image/bg3.jpg" class="d-block w-100" alt="...">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
		<span><a href="#"><img
			style="position: absolute; width: 164px; height: 95px; bottom: 18%; left: 50%; margin-left: -82px"
			src="${pageContext.request.contextPath}/resources/image/page-down.gif"></a></span>

	<div class="content">
		<div class="rewards-title">
			<span>코리아아이티 서울 추천 프로모션</span> <a href="#" class="btn-ttl-more">프로모션
				더보기</a>
		</div>
		<div class="promotion">
			<div class="card-deck">
				<div class="card" style="border: 0">
					<div class="promotion-img">
						<a href="#"> <img src="${pageContext.request.contextPath}/resources/image/prom1.jpg" class="card-img-top"
							alt="...">
						</a>
					</div>
					<div class="card-body">
						<a href="#" class="card-link">
							<h5 class="card-title">코리아아이티 서울</h5>
							<h3 class="card-sub-title">World Tower Special</h3>
							<div class="promotion-copy">
								<span>객실 1박 + 조식 2인 + 티켓 2매</span>
							</div>
							<p class="card-text">투숙: 2021-04-01 ~ 2012-12-22</p>
							<p class="card-text">예약: 2021-04-01 ~ 2012-12-22</p>
						</a>
						<div class="promotion-price">
							<span class="category">PACKAGE</span>
							<div class="price-number">
								KRW <span>430,000</span>
							</div>
						</div>
						<p class="card-text">
							<small class="text-muted">Last updated 7 days ago</small>
						</p>
					</div>
				</div>
				<div class="card" style="border: 0">
					<div class="promotion-img">
						<a href="#"> <img src="${pageContext.request.contextPath}/resources/image/prom2.jpg" class="card-img-top"
							alt="...">
						</a>
					</div>
					<div class="card-body">
						<a href="#" class="card-link">
							<h5 class="card-title">코리아아이티 서울</h5>
							<h3 class="card-sub-title">Eternal Promise</h3>
							<div class="promotion-copy">
								<span>객실 1박 + 조식 2인 + 티켓 2매</span>
							</div>
							<p class="card-text">투숙: 2021-04-01 ~ 2012-12-22</p>
							<p class="card-text">예약: 2021-04-01 ~ 2012-12-22</p>
						</a>
						<div class="promotion-price">
							<span class="category">PACKAGE</span>
							<div class="price-number">
								KRW <span>599,000</span>
							</div>
						</div>
						<p class="card-text">
							<small class="text-muted">Last updated 1 month ago</small>
						</p>
					</div>
				</div>
				<div class="card" style="border: 0">
					<div class="promotion-img">
						<a href="#"> <img src="${pageContext.request.contextPath}/resources/image/prom3.jpg" class="card-img-top"
							alt="...">
						</a>
					</div>
					<div class="card-body">
						<a href="#" class="card-link">
							<h5 class="card-title">코리아아이티 서울</h5>
							<h3 class="card-sub-title">얼리버드 프로모션 - 20일 전 예약</h3>
							<div class="promotion-copy">
								<span>객실 1박 + 조식 2인 + 티켓 2매</span>
							</div>
							<p class="card-text">투숙: 2021-04-01 ~ 2012-12-22</p>
							<p class="card-text">예약: 2021-04-01 ~ 2012-12-22</p>
						</a>
						<div class="promotion-price">
							<span class="category">PACKAGE</span>
							<div class="price-number">
								KRW <span>689,000</span>
							</div>
						</div>
						<p class="card-text">
							<small class="text-muted">Last updated 1 month ago</small>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="room-intro">
			<div class="rewards-title">
				<span>객실</span> <a href="/TeamProject/main/room" class="btn-ttl-more">더보기</a>
			</div>
			<div class="row row-cols-1 row-cols-md-3 g-4"
				style="margin: 0px 30px;">
				<div class="col">
					<div class="card">
						<a href="/TeamProject/main/StandardRoom"><img src="${pageContext.request.contextPath}/resources/image/Twin.jpg" class="card-img-top" alt="..."></a>
						<div class="card-body">
							<h5 class="card-title">스탠다드 룸</h5>
							<p class="card-text">침대가 무려 두개나 달려있는 룸입니다. 굳이 두개씩이나 필요가 있을까요</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<a href="/TeamProject/main/DeluxeRoom"><img src="${pageContext.request.contextPath}/resources/image/family1.jpg" class="card-img-top" alt="..."></a>
						<div class="card-body">
							<h5 class="card-title">디럭스 룸</h5>
							<p class="card-text">디럭스한 인테리어 돋보이는 디럭스룸입니다.</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<a href="/TeamProject/main/SuiteRoom"><img src="${pageContext.request.contextPath}/resources/image/grand.jpg" class="card-img-top" alt="..."></a>
						<div class="card-body">
							<h5 class="card-title">스위트 룸</h5>
							<p class="card-text">저희 호텔의 자랑 스위트룸입니다. 축구나 농구를 할정도로 넓은 평수를
								가지고 있으며 최고의 시설과 서비스를 보장받을 수 있습니다.</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<a href="/TeamProject/main/PrestigeRoom"><img src="${pageContext.request.contextPath}/resources/image/family.jpg" class="card-img-top" alt="..."></a>
						<div class="card-body">
							<h5 class="card-title">프레스티지 룸</h5>
							<p class="card-text">온가족이 이용해도 전혀 좁은느낌없는 프레스티지룸입니다. 가족들과 최고의
								시간을 보내보세요.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="dinning-intro">
			<div class="dinning-title">
				<h3 class="title">다이닝 & 바</h3>
				<div class="desc">서울의 명소로 제각기 이름난 그랜드 하얏트 서울 호텔의 11개의 레스토랑과 바는
					세계 각국의 다양한 요리와 테일러 칵테일을 선보이며 고품격 다이닝 경험을 선사합니다.</div>
				<div class="dinning-more">
					<a href="/TeamProject/main/dining" class="dinning-btn" role="button" title="다이닝 자세히 보기 "
						target="_self"> 다이닝 자세히 보기 </a>
				</div>
			</div>
			<div class="dinning-img" align="center">
				<img src="${pageContext.request.contextPath}/resources/image/dinning.JPG" />
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>