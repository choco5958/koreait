<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8" name="viewport" content="initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/register.css">

<!-- 생년월일 달력 api -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$.noConflict();
jQuery(document).ready(function( $ ){
		$("#Calandar").datepicker({
			yearRange: 'c-100:c+10', //년도 범위
			dateFormat: "yy-mm-dd",  //텍스트 필드에 입력되는 날짜
			changeYear: true,		 //년도 변경
			changeMonth: true,		 //월 변경
			showMonthAfterYear: true,//셀렉트 박스를 년,월 순으로 변경
			dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], //요일의 한글 형식
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //월의 한글 형식
		});
	});
</script>

<!-- 다음 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function searchAddress(){
		new daum.Postcode({
	        oncomplete: function(data) {
	            var roadAddr = data.roadAddress;
	            document.getElementsByName("userAddress")[0].value = roadAddr;
	        }
	    }).open();	
	} 
</script>

<!-- 빈칸 입력 알림 -->
<script type="text/javascript">
	function goPost() {
		// 1. 데이터 세팅
		var userId = document.getElementsByName('userId')[0].value;
		var userPassword = document.getElementsByName('userPassword')[0].value;
		var userName = document.getElementsByName('userName')[0].value;
		var userBirth = document.getElementsByName('userBirth')[0].value;
		var userPhone = document.getElementsByName('userPhone')[0].value;
		var userEmail = document.getElementsByName('userEmail')[0].value;
		var userAddress = document.getElementsByName('userAddress')[0].value + " " +document.getElementsByName('userAddressDetail')[0].value;
		
		// 2. 데이터 검증
		if (userId == "") {
			alert("아이다를 입력하여 주세요.");
			return;
		}
		else if (userPassword.length < 10 || 20 < userPassword.length) { //비밀번호  길이 
			alert("비밀번호를 10자리이상 20자리이하로 입력");
			return;
		}
		else if (userName == ''){
			alert("이름을 입력하여 주세요.");
			return;
		}
		else if (userBirth == ''){
			alert("생년월일을 입력하여 주세요.");
			return;
		}
		else if (userPhone == ''){
			alert("연락처를 입력하여 주세요.");
			return;
		}
		else if (userEmail == ''){
			alert("이메일을 입력하여 주세요.");
			return;
		}
		else if (userAddress == ''){
			alert("주소 및 상세 주소를 입력하여 주세요.");
			return;
		}
			
		// 3. Form 연결
		
		if(!confirm("회원가입을 하시겠습니까?")){
	         retrun;
	      } else {
	         
	      }
		
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post");
		form.setAttribute("action", "test");
		
		
		formInput(form, "userId", userId);
		formInput(form, "userPassword", userPassword);
		formInput(form, "userName", userName);
		formInput(form, "userBirth", userBirth);
		formInput(form, "userPhone", userPhone);
		formInput(form, "userEmail", userEmail);
		formInput(form, "userAddress", userAddress);
		formInput(form, "userGrade", "1"); //유저등급 1부여(개인회원)
		
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

<title>개인 회원가입</title>
</head>
<body>
<div><%@ include file="../include/nav.jsp" %></div>

	<div align="center" class="main">
		<p class="ptitle">The White Hotel 회원가입</p>
			
		<div align="center" class="divform">
		<table><tr><td>	
		<div align="left" class="divpadding">아이디*</div>		<input type="text" name="userId" class="onlyunder"><br/>
		<div align="left" class="divpadding">비밀번호*</div>		<input type="password" name="userPassword" placeholder="10~20자 입력" class="onlyunder"><br/>	
		<div align="left" class="divpadding">이름*</div>			<input type="text" name="userName" class="onlyunder"><br/>
		<div align="left" class="divpadding">생일*</div> 			<input type="text" id="Calandar" name="userBirth" class="onlyunder"><br/>	
		<div align="left" class="divpadding">연락처*</div> 		<input type="text" name="userPhone" class="onlyunder"><br/>
		<div align="left" class="divpadding">이메일*</div> 		<input type="text" name="userEmail" class="onlyunder"><br/>
		<div align="left" class="divpadding">주소*</div> 			<input type="text" name="userAddress" placeholder="도로명 주소 입력"onclick="searchAddress()" class="onlyunder"><br/>
																<input type="text" name="userAddressDetail" placeholder="상세 주소 입력" class="onlyunder">
		</td></tr></table>
		<input type="submit" value="회원가입" class="input" onClick="goPost()">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value="취소" class="input">
		</div>			
	</div>

<div><%@ include file="../include/footer.jsp" %></div>
</body>
</html>
