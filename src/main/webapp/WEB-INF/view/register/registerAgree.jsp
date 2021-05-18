<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/registerAgree.css">

<script type="text/javascript">
function Agree(){
	if(document.form.req.checked && document.form.req1.checked)
		document.form.submit();
	else
		alert("개인정보 약관에 동의하셔야 합니다.");
}
function noAgree(){
 	alert("동의하지 않으면 가입하실 수 없습니다");
}
</script>

<title>Insert title here</title>
</head>
<body>

<div><jsp:include page="../include/nav.jsp" /></div>

<div class="main">

<form class="form" action="register" name="form" method="post">
<h1 class="ptitle">The White Hotel 회원가입 약관동의</h1>			
		<p class="p">■ 포털 사이트 이용약관에 대한 안내</p>	
		<div class="text">
		<br>제 1장 총칙<br>
		
		<br>제 1 조(목적)<br><br>
		본 약관은 웹사이트(이하 "포털")가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 회원과 국가공간정보포털의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.<br>

		<br>제 2 조(약관의 효력과 변경)<br><br>
		1. 이용자가 본 약관 내용에 동의하는 경우, 서비스 제공 행위 및 회원의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.<br>
		2. 약관을 개정할 경우, 적용일자 및 개정사유를 명시하여 현행약관과 함께 초기화면에 그 적용일 7일 이전부터 적용 전일까지 공지합니다. 단, 회원에 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 개정 전 내용과 개정 후 내용을 명확하게 비교하여 회원이 알기 쉽도록 표시합니다.<br>
		3. 변경된 약관은 홈페이지에 공지하거나 e-mail을 통해 회원에게 공지하며, 약관의 부칙에 명시된 날부터 그 효력이 발생됩니다. 회원이 변경된 약관에 동의하지 않는 경우, 회원은 본인의 회원등록을 취소(회원탈퇴)할 수 있으며, 변경된 약관의 효력 발생일로부터 7일 이내에 거부의사를 표시하지 아니하고 서비스를 계속 사용할 경우는 약관 변경에 대한 동의로 간주됩니다.<br>
	
		<br>제 3 조(약관 외 준칙)<br><br>
		본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.<br>

		<br>제 4 조(용어의 정의)<br><br>
		본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
		1. 이용자 : 본 약관에 따라 제공하는 서비스를 받는 자<br>
		2. 가입 : 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위<br>
		3. 회원 : 개인 정보를 제공하여 회원 등록을 한 자로서 제공하는 서비스를 이용할 수 있는 자.<br>
		4. 계정(ID) : 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 부여하는 문자와 숫자의 조합<br>
		5. 비밀번호 : 회원과 계정이 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 회원 자신이 선정한 문자와 숫자의 조합<br>
		6. 탈퇴 : 회원이 이용계약을 종료시키는 행위<br>
		7. 본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도 약관 및 이용규정에서 정의합니다.<br>
	
		<br><br>제 2장 서비스 제공 및 이용<br>
		
		<br>제 5 조 (이용계약의 성립)<br><br>
		<b style="font-size: 14px; color: #007dcd;">1. 이용계약은 이용자가 온라인으로 제공하는 소정의 가입신청 양식에서 요구하는 사항을 기록하여 가입을 완료하는 것으로 성립됩니다.</b><br>
		<b style="font-size: 14px; color: #007dcd;">2. 국가공간정보포털은 다음 각 호에 해당하는 이용계약에 대하여는 가입을 취소할 수 있습니다.</b><br>
		&nbsp;&nbsp;&nbsp;1) 다른 사람의 명의를 사용하여 신청하였을 때<br>
		&nbsp;&nbsp;&nbsp;2) 이용계약 신청서의 내용을 허위로 기재하였거나 신청하였을 때<br>
		&nbsp;&nbsp;&nbsp;3) 다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때<br>
		&nbsp;&nbsp;&nbsp;4) 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우<br>
		&nbsp;&nbsp;&nbsp;5) 기타 정한 이용신청요건이 미비 되었을 때<br>
   		</div><br>
   		<input type="checkbox" class="checkbox" name="req"> (필수) 이용약관에 동의합니다.
   		<hr class="hr">
   		
   		<p class="p">■ 개인정보 수집 및 이용에 대한 안내</p>
   		<div class="text">
   		<b>가. 개인정보의 수집 및 이용 목적</b><br>
		① 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.<br><br>
		<b style="font-size: 17px; color: #007dcd;">1. 서비스 제공을 위한 회원관리</b><br>
		<b style="font-size: 17px; color: #007dcd;">1) 공간정보 다운로드, 오픈API 신청 및 활용 등 포털 서비스 제공과 서비스 부정이용 방지를 목적으로 개인정보를 처리합니다.</b><br>
		
		<br><b>나. 수집하는 개인정보의 항목</b><br>
		<b style="font-size: 14px; color: #007dcd;">① 회원정보(필수): 이름, 이메일(아이디), 비밀번호</b><br>
		
		<br><b>다. 개인정보의 보유 및 이용기간</b><br>
		① 법령에 따른 개인정보 보유ㆍ이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유ㆍ이용기간 내에서 개인정보를 처리ㆍ보유합니다.<br>
		<b style="font-size: 14px; color: #007dcd;">1. 국가공간정보포털 회원정보</b><br>
		<b style="font-size: 14px; color: #007dcd;">- 수집근거: 정보주체의 동의</b><br>
		<b style="font-size: 17px; color: #007dcd;">- 보존기간: 회원 탈퇴 요청 전까지(1년 경과 시 재동의)</b><br>
		<b style="font-size: 14px; color: #007dcd;">- 보존근거: 정보주체의 동의</b><br>
								
		<br><b>라. 동의 거부 권리 및 동의 거부에 따른 불이익 </b><br>
		위 개인정보의 수집 및 이용에 대한 동의를 거부할 수 있으나, 동의를 거부할 경우 회원 가입이 제한됩니다.<br>
   		</div><br>
   		<input type="checkbox" class="checkbox" name="req1"> (필수) 개인정보 수집ㆍ이용에 동의합니다.
   		<hr class="hr">
		
		
    		<button type="button" class="button" onclick="Agree()">동의</button>
    		<button type="button" class="button" onclick="noAgree()">동의 안 함</button>    
   		
	</form>
</div>
	
<div><%@include file="../include/footer.jsp" %></div>

</body>
</html>