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
<form action="pwChange" method="post">
<div class="container-md" style="width: 550px; margin-top: 100px;">
<h2 class="h2" style="margin-bottom: 80px;">비 밀 번 호 변 경</h2>	
<div class="input-group">
  <span class="input-group-text">Password</span>
  <input type="password" name="userPassword" aria-label="First name" class="form-control">
</div>
<div class="input-group">
  <span class="input-group-text">Change Pw</span>
  <input type="password" name="ChangePw" aria-label="First name" class="form-control">
</div>
<div class="input-group" style="margin-bottom: 80px;">
  <span class="input-group-text">Re Password</span>
  <input type="password" name="RePassword" aria-label="First name" class="form-control">
</div>

<input type="submit" class="button" value="변경 하기" style="margin-left: 30px">
</div>
</form>
<%@ include file="../include/footer.jsp" %>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
  </body>
</html>