<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/loginForm.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/footer.css"
	type="text/css">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<title>Document</title>
<!-- Font awesome CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- Scroll reveal CDN -->
<!-- 쓸일이 있나..-->
<script src="https://unpkg.com/scrollreveal"></script>
</head>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<section>
	<form action="submit" method="post" id="loginform">
		<div class="login-container">
			<div class="login-title">
				<strong>Welcome</strong>
			</div>

			<div class="login-box">
				<div class="input-text">
					<label for="loginId" class="screen-out">ID</label> <input
						class="text-input-box" type="text" name="id"
						value="${sessionScope.id}" size="20">
				</div>

				<div class="input-text">
					<label for="loginPw" class="screen-out">PW</label> <input
						class="text-input-box" type="password" name="password"
						value="${sessionScope.password}" size="20">
				</div>

				<div class="submit-button">
					<button class="login-btn cta-btn" type="submit">login</button>
					<button class="login-btn cta-btn" type="button"
						onclick="location.href='/TeamProject/register/registerAgree'">sign
						up</button>
				</div>

                    <div class="social-media">
                        <h4>Social Media Login</h4>
                        <ul class="social-icons">
                            <li>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fab fa-facebook-square"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fab fa-tripadvisor"></i></a>
                            </li>
                        </ul>
                    </div>
			</div>
		</div>
	</form>
	<!-- 네이버 로그인 창으로 이동
<div id="naver_id_login" style="text-align:center"><a href="${url}">
<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
<br> -->
</section>
	<!-- footer start -->
	<footer>
		<div class="bottom">
			<div class="menu">
				<ul>
					<li><a href="#">회사소개</a></li>
					<li><a href="#" style="font-weight: bold;">이용약관</a></li>
					<li><a href="#">개인정보처리방침</a></li>
					<li><a href="#">협력사(입점신청)</a></li>
					<li><a href="#">고객센터</a></li>
					<li class="sns-link"><a href="#" class="facebook"><span></span>페이스북</a>
						<a href="#" class="instagram"><span></span>인스타그램</a> <a href="#"
						class="blog"><span></span>블로그</a></li>
				</ul>
			</div>
		</div>
		<div style="width: 1020px; margin: 0px auto;">
			<div class="company">
				<dl>
					<dt>코리아아이티(주)</dt>
					<dd>프로젝트 팀원 : 한동민 ,이승호,임서연,김동원,한대현 Tel : 02-364-1160</dd>
					<dd>사업자 등록번호 : 123-5678-91011, 통신판매업신고 : 제2020 서울마포-5678호</dd>
					<dd>개인정보관리자 이승호 paradoxxx112@naver.com</dd>
					<dd class="box_footer">
						<a href="#" target="_blank" class="box"> 사업자정보확인 </a> <a href="#"
							target="_blank" class="box"> 1:1문의 </a> <a href="#"
							target="_blank" class="box"> FAQ </a>
					</dd>
				</dl>
				<p>COPYRIGHTⓒ 2020-2021 KOREAIT CO. LTD. ALL RIGHT RESERVE.</p>
			</div>
		</div>
		<div class="company-contact">
			<dl>
				<dt>코리아아이티 고객센터</dt>
				<dd>TEL : 02-364-1160 / Email : paradoxxx112@naver.com</dd>
				<dd>영업시간 : AM 09:00 ~ PM 18:00 (토,일,공휴일 휴무) 점심시간 : 13:00 ~ 14 :
					00</dd>
				<dd class="box_footer">
					<a href="#" target="_blank" class="box"
						style="margin-bottom: 10px;"> 고객센터 </a>
					<dl style="padding-top: 5px;">
						<dt>상점입점문의</dt>
						<dd>TEL : 010-6437-1165 / FAX : 02-364-1165</dd>
						<dd>Email : admin@koreait.co.kr</dd>
					</dl>
				</dd>
			</dl>
		</div>
	</footer>
	<!-- footer end -->
</body>
</html>