<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href ="./resources/css/bootstrap.min.css" />
<title>페이지 오류</title>
</head>
<body>
	<div class = "jumbotron">
		<div class = "container">
			<h2 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h2>
		</div>
	</div>
	<div class = "container">
	<p><%=request.getRequestURL() %></p>
	<p> <a href = "login.jsp" class = "btn btn-secondary"> 로그인&raquo;</a>
	</div>
</body>
</html>