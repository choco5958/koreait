<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aside.css">
<title>Insert title here</title>
</head>
<body>
<div id="mysidenav" class="sidenav">
		<a href="#" class="closebtn" onclick='closeNav()'>x</a>
		<a href="reservationStandard">스탠다드 룸</a>
		<a href="reservationDeluxe">디럭스 룸</a>
		<a href="reservationSuite">스위트 룸</a>
		<a href="reservationPrestige">프레스티지 룸</a>
	</div>
	<span class="openmenu" onclick='openNav()'><i class="fa fa-angle-double-left fa-5" aria-hidden="true"></i> 객실 더보기</span>
<script>
		function openNav() {
			document.getElementById('mysidenav').style.width = '250px';
		}
		function closeNav() {
			document.getElementById('mysidenav').style.width = '0';
		}
	</script>
</body>
</html>
