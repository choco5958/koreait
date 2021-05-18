<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	

<!DOCTYPE html>
<html dir="ltr" lang="UTF-8">
<head>
   <title>Bootstrap Example</title> 
  <meta charset="utf-8"> 
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> 
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> 
  <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

</head>
<jsp:include page="../include/nav.jsp" />
<img src="${pageContext.request.contextPath}/resources/image/s1.jpg" class="d-block w-100" alt="...">
<body class="stretched" onload="initialize()">
    <section id="page-title" class="page-title-parallax" style="background-image: url(&quot;/jaeho/resources/images/hotel-about/main.jpg&quot;); padding: 120px 0px; background-position: 50% -15px;" data-stellar-background-ratio="0.3">
            <div class="container clearfix" style="border-width:3px; text-align: center; font-size: 30px;">
                <h1>The White Hotel 위치</h1>            
            </div>
   	  </section>
		<div id="map" style="width:1100px;height:500px; margin-left:auto; margin-right:auto; margin-bottom: 50px;">
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09d8cd89c815c2c1bfc45a634a1c103b"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.248660615935165, 126.41057099781966), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(33.248660615935165, 126.41057099781966); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		    
		   
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
		</script>
		</div>

   	  <p>
		</p>
   	  <p>
   	  
   	  <div class="container clearfix">
		<div id="google-map" class="gmap">
           </div>
            <p>
		<hr>
		  <div class="container-fluid" style="background-color:#eeeeee; border:2px solid #E6E6E6">
		   		<div class="col-md-12">
			   		<div class="col-md-6" >
			   			<h3 class="text-center">The White Hotel</h3>
			   		</div>
			   			<div class="col-md-6">
				   			<h6 style="margin-top:20px">제주특별자치도 서귀포시 중문관광로 72번길 35 The White Hotel</h6>
				   			<div style="font-size:13pt;">
					   			<strong>TEL</strong>+82-64-731-1000
					   			<strong>FAX</strong>+82-64-738-7305
				   			</div>
			   			</div>
			   </div>
		   </div>
		   <p>
		   
		   <!-- 아코디온(Accordion) -->
		  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          	자동차로 오시는 길
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
       	<p> 택시 이용 시</p>
	
		공항청사 맞은편에 가장 가까이에 마련된 택시 대기장소에서 이용하시면 됩니다.<br>
		 중형이 대부분이나 일반택시와 요금이 같습니다.<br>
		단 공항에서 호텔까지의 요금이 정해져 있으므로 미리 확인하고 출발하는 것이 좋습니다.<br><br>
		
		<p>렌터카 이용 시</p>
		
		렌터카를 이용하는 경우 공항에서 인수할 수 있도록 미리 확인하는 것이 좋습니다.<br>
		공항 도착출구를 나오면 바로 렌터카 데스크와 제주관광협회에서 운영하는 관광안내 데스크를 만날 수 있습니다.<br>
		* 문의 : 제주관광협회 공항안내데스크 064-742-8866<br>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          	공항 리무진 버스
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
       	<p> 공항 리무진 Info.</p>
			<p>
			- 탑승장소: 국내선 5번 게이트로 나와서 오른쪽 공항리무진버스(삼영교통 600번) 승차장<br>
			- 소요시간: 약 50분<br>
			- 이용요금: 공항↔호텔 델루나 성인 : 4,500원(편도) / 중,고등 : 3,600원(편도) / 초등 : 2,300원(편도)<br>
			- 문의: 삼영교통 공항영업소(Tel 064-713-7000)<p>
			
			<p>제주국제공항→The White Hotel</p>
			
			<p>- 운행시간: 06:20~22:00<br>
			- 운행간격: 매 15~18분 간격</p>
			
			<p>호텔 델루나 → 제주국제공항</p>
			
			<p>- 운행시간: 06:40~22:20<br>
			- 운행간격: 매회 약 20분 간격</p>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          	셔틀 버스
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
       	<p>호텔까지 편안한 이동 『무료 셔틀버스』<br>
		• 호텔 → 공항 (10:00, 13:00, 16:00)<br>
		• 공항 → 호텔 (11:20, 14:20, 17:20)</p>
		
		<p>※ 제주공항 출구 GATE 1번 출구, 대형버스 주차장 B구역 위치<br>
		※ 사전 예약제 운영 및 투숙객전용 무료 서비스<br>
		※ 예약 및 문의 ☎064.731.4343</p>
      </div>
    </div>
  </div>
</div>
	</div>
	
	<jsp:include page="../include/footer.jsp" />
	
</body>
</html>