<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reserve.css"/>
</head>
<body>
<jsp:include page="../include/nav.jsp" />
<div class="wrapper">
<h1>예약하기 <span class="badge badge-secondary">Now</span></h1>
<div class="row row-cols-1 row-cols-md-2">
  <div class="col mb-4">
  <a href="reservationStandard" class="card-link">
    <div class="card">
      <img src="${pageContext.request.contextPath}/resources/image/Twin1.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">스탠다드 예약하기</h5>
        <h3 class="sub-title">예약하기</h3>
      </div>
    </div>
  </a>
  </div>
  <div class="col mb-4">
  <a href="reservationDeluxe" class="card-link">
    <div class="card">
      <img src="${pageContext.request.contextPath}/resources/image/Twin.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">디럭스 예약하기</h5>
        <h3 class="sub-title">예약하기</h3>
      </div>
    </div>
    </a>
  </div>
  <div class="col mb-4">
  <a href="reservationSuite" class="card-link">
    <div class="card">
      <img src="${pageContext.request.contextPath}/resources/image/family.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">스위트 예약하기</h5>
        <h3 class="sub-title">예약하기</h3>
      </div>
    </div>
    </a>
  </div>
  <div class="col mb-4">
  <a href="reservationPrestige" class="card-link">
    <div class="card">
      <img src="${pageContext.request.contextPath}/resources/image/grand.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">프레스티지 예약하기</h5>
        <h3 class="sub-title">예약하기</h3>
      </div>
    </div>
    </a>
  </div>
</div>
</div>

<jsp:include page="../include/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
</body>
</html>
