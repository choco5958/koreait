<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="form" method="post" action="writeAction.jsp"
		enctype="multipart/form-data">
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="2"
						style="background-color: #eeeeee; text-align: center;">게시판
						글쓰기 양식</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" class="form-control" placeholder="글 제목"
						name="bbsTitle" maxlength="50"></td>
				</tr>
				<tr>
					<td><textarea class="form-control" placeholder="글 내용"
							name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
				</tr>
			</tbody>
		</table>
		
		<select style="color: aqua;">
			<option>🤍🤍🤍🤍🤍</option>
		</select>
	</form>
	
	
</body>
</html>