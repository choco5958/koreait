<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 슬라이드이미지api -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 예약기간선택 달력 api -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$.noConflict();
jQuery(document).ready(function( $ ){
		$("#datepicker1, #datepicker2").datepicker({
			dateFormat: "yy-mm-dd",  //텍스트 필드에 입력되는 날짜
			minDate: 0,			     //오늘이전 날짜 블록처리
			changeYear: true,		 //년도 변경
			changeMonth: true,		 //월 변경
			showMonthAfterYear: true,//셀렉트 박스를 년,월 순으로 변경
			dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], //요일의 한글 형식
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //월의 한글 형식
		});
	});
</script>

<!-- 빈칸 입력 알림 -->
<script type="text/javascript">
	function goPost() {
		// 1. 데이터 세팅
		var ruserId = document.getElementsByName('ruserId')[0].value;
		var ruserName = document.getElementsByName('ruserName')[0].value;
		var ruserPhone = document.getElementsByName('ruserPhone')[0].value;
		var ruserCount = document.getElementsByName('ruserCount')[0].value;
		var checkIn = document.getElementsByName('checkIn')[0].value;
		var checkOut = document.getElementsByName('checkOut')[0].value;
		
		
		// 2. 데이터 검증
		if (ruserName == "") {
			alert("예약자 이름을 입력하여 주세요.");
			return;
		}
		else if (ruserPhone == "") {  
			alert("예약자 연락처를 입력하여 주세요.");
			return;
		}
		else if (ruserCount == ''){
			alert("인원 수를 입력하여 주세요.");
			return;
		}
		else if (checkIn == ''){
			alert("체크인 날짜를 입력하여 주세요.");
			return;
		}
		else if (checkOut == ''){
			alert("체크아웃 날짜를 입력하여 주세요.");
			return;
		}
		
			
		// 3. Form 연결
		if(!confirm("예약을 하시겠습니까?")){
			retrun;
		} else {
			
		}
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post");
		form.setAttribute("action", "test");
		
		formInput(form, "ruserId", ruserId);
		formInput(form, "ruserName", ruserName);
		formInput(form, "ruserPhone", ruserPhone);
		formInput(form, "ruserCount", ruserCount);
		formInput(form, "checkIn", checkIn);
		formInput(form, "checkOut", checkOut);
		formInput(form, "roomType", "프레스티지");
		formInput(form, "ruserPrice", "1000000");
		formInput(form, "roomGrade", "4");
		
		// 4. 전송
		document.body.appendChild(form);
		form.submit();
	}
	
	//자바스크립트 폼에 값입력
	function formInput(form, name, value) {
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", name);
		hiddenField.setAttribute("value", value);
		form.appendChild(hiddenField);
	}
</script>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservation.css">
<meta charset="UTF-8" name="viewport" content="initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<div><%@include file="../include/nav.jsp" %></div>

<div class="title" align="center"><hr class="hr"><br>프레스티지 예약</div>
<div class="item1">	
	<div class="item1_1">	
  		<div id="myCarousel" class="carousel slide" data-ride="carousel">
    	<!-- Wrapper for slides -->
    	<div class="carousel-inner">
      		<div class="item active">
        	<img src="${pageContext.request.contextPath}/resources/image/y1.jpg" alt="Los Angeles">
      		</div>
      		
    	</div>
	  	</div>
	  	
	  	<div align="center">
	  	<table class="type">
  		<thead>
  		<tr>
   		 <th colspan="2">유의 사항</th>
  		</tr>
  		</thead>
  		<tbody>
  		<tr>
   		 <td>인원 2인 초과 시 1인당 50,000원 현장 추가 결제</td> 		 
  		</tr>
  		<tr>
   		 <td>반려동물 동반가능</td> 			 
 		 </tr>
  		<tr>
   		 <td>흡연 금지</td> 	 		 
 		 </tr>
 		 <tr>
   		 <td>조식 및 이벤트 가능</td> 	 		 
  		</tr>
 		 </tbody>
		</table>
		</div>
		</div>

		<div class="item1_2">
			<input type="hidden" name="ruserId" value="${loginId}">
			<input type="text" name="ruserName" class="input" placeholder="예약자 이름"><br>
			<input type="text" name="ruserPhone" class="input" placeholder="예약자 연락처"><br>
			<input type="text" name="ruserCount" class="input" placeholder="인원 수"><br>
			<input type="text" name="checkIn" class="input" id="datepicker1" placeholder="예약 시작일"><br>
		 	<input type="text" name="checkOut" class="input" id="datepicker2" placeholder="예약 종료일"><br>
		 	<input type="text" class="input" placeholder="객실 타입 : 프레스티지" readonly><br>
		 	<input type="text" class="input" placeholder="객실 가격 : 1,000,000원" readonly>
		</div>
		</div>		
		<div class="item3">
		<input type="submit" value="예약하기" class="button" onClick="goPost()">
		</div>
		
		<hr class="hr2">	
		
	
	

<div><%@include file="../include/aside2.jsp" %></div>
<div><%@include file="../include/footer.jsp" %></div>

</body>
</html>