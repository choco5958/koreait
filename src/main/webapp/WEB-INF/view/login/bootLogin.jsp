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
    <title>Welcome, White Hotel!</title>
</head>
<body>
    <div class="container-fluid">
        <div class="row no-gutter">
            <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
            <div class="col-md-8 col-lg-6">
                <div class="login d-flex align-items-center py-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-9 col-lg-8 mx-auto">
                                <a class="small" href="/TeamProject/main/main"><h3 class="login-heading mb-4">Welcome, White Hotel!</h3></a>
                                <form action="submit" method="post">
                                    <div class="form-label-group">
                                        <input type="text" name="id" id="userId" class="form-control" value="${cookie.rememberID.value}" placeholder="User ID" required autofocus>
                                        <label for="userId">User ID</label>
                                    </div>

                                    <div class="form-label-group">
                                        <input type="password" name="password" id="userPassword" class="form-control" placeholder="Password" required>
                                        <label for="userPassword">Password</label>
                                    </div>

                                    <div class="custom-control custom-checkbox mb-3">
                                        <input type="checkbox" class="custom-control-input" id="checkbox" name="checkbox" value="true" checked>
                                        <label class="custom-control-label" for="checkbox">Remember ID</label>
                                    </div>
                                    
                                    <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2"
                                        type="submit">Sign in</button>
                                        
                                    <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2"
                                        type="submit" onclick="location.href='/TeamProject/register/registerAgree'">Sign up</button>
                                    
                                    <div class="text-center">
                                        <a class="small" href="findPassword">Forgot password?</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
        crossorigin="anonymous"></script>
</body>
</html>