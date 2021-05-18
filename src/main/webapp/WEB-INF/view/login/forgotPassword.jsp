<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!doctype html>
<html lang="en">
<head>
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootLoginForm.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/footer.css"
	type="text/css">
    <link rel="stylesheet" href="boottest.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <title>Forgot Password?</title>
</head>
<body>
	<script type="text/javascript">
		function check() {
			if(true) {
				alert("임시 비밀번호를 발급해드렸습니다.\n이메일을 확인하여 주십시오.");
			} else {
				alert("입력하신 정보를 다시 한번 확인하여 주십시오.");
			}
		}
	</script>
	
    <div class="container-fluid">
        <div class="row no-gutter">
            <div class="col-md-8 col-lg-6">
                <div class="login d-flex align-items-center py-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-9 col-lg-8 mx-auto">
                                <a class="small" href="/TeamProject/main/main"><h3 class="login-heading mb-4">Forgot Password?</h3></a>
                                <form method="post" name="fr" onsubmit="return check()">
                                    <div class="form-label-group">
                                        <input type="text" name="f_id" id="f_id" class="form-control" placeholder="ID" required autofocus>
                                        <label for="f_id">ID</label>
                                    </div>

                                    <div class="form-label-group">
                                        <input type="text" name="f_name" id="f_name" class="form-control" placeholder="Name" required>
                                        <label for="f_name">Name</label>
                                    </div>

                                    <div class="form-label-group">
                                        <input type="email" name="f_email" id="f_email" class="form-control" placeholder="Email" required>
                                        <label for="f_email">Email</label>
                                    </div>
                                    
                                    <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2"
                                        type="submit">submit</button>
                                    
                                    <div class="text-center">
                                        <a class="small" href="form">Back to Login</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-none d-md-flex col-md-4 col-lg-6" style="background-image: url('https://images.unsplash.com/photo-1505576391880-b3f9d713dc4f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1534&q=80'); background-size: cover; background-position: center;"></div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
        crossorigin="anonymous"></script>
</body>
</html>