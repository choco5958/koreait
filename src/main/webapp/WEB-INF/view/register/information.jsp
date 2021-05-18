<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/resources/css/test1.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    
    <script type="text/javascript">
    </script>
    
    <title>White Korea</title>
  </head>
  <body>
<%@ include file="../include/nav.jsp" %>
<div class="img">
<img src="${pageContext.request.contextPath}/resources/image/write.jpg">
</div>
<form action="userUpdate" method="post">
<div class="container-md" style="width: 550px; margin-top: 100px;">
<h2 class="h2" style="margin-bottom: 80px;">회 원 정 보</h2>	
<div class="input-group" style="margin-top: 20px;">
  <span class="input-group-text">ID</span>
  <p class="form-control">${loginUser.userId }</p>
</div>
<div class="input-group">
  <span class="input-group-text">PW</span>
  <input type="password" name="userPassword" aria-label="First name" class="form-control" placeholder="Password">
</div>
<div class="input-group">
  <span class="input-group-text">Name</span>
  <p class="form-control">${loginUser.userName }</p>
</div>
<div class="input-group">
  <span class="input-group-text">BirthDay</span>
  <input type="date" aria-label="First name" name="userBirth" class="form-control" value="${loginUser.userBirth }">
</div>
<div class="input-group">
  <span class="input-group-text">Phone</span>
  <input type="text" aria-label="First name" name="userPhone" class="form-control" value="${loginUser.userPhone }">
</div>
<div class="input-group">
  <span class="input-group-text">Email</span>
  <input type="text" aria-label="First name" name="userEmail" class="form-control" value="${loginUser.userEmail }">
</div>
<div class="input-group" style="margin-bottom: 80px;">
  <span class="input-group-text">Address</span>
  <input type="text" aria-label="First name" name="userAddress" class="form-control" value="${loginUser.userAddress }">
</div>
<input type="submit" class="button" value="수정 하기" style="margin-left: 30px">
<a href="pwChangeForm"><input type="button" class="button" value="비밀번호 변경" style="width: 120px; margin-left: 50px;"></a>
</div>
</form>
<%@ include file="../include/footer.jsp" %>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
  </body>
</html>