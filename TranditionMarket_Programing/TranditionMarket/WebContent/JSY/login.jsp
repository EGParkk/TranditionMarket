<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<style type="text/css">
.content {
	height: 400px;
}

footer {
	background-color: black;
	color: white;
	padding: 15px;
}
</style>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
	<div class="row justify-content-center algin-items-center">
	<div class="col-3">
		<form class="form-horizontal" action="Login" method="POST">
			<h2 class="text-center">Login</h2>
			<input type="hidden" name="action" value="login">
			<br><br>
			<div class="form-group">
				<label for="id">ID</label> 
				<input type="text" class="form-control"  
					   name="userID" required="required" 
					   placeholder="아이디를 입력하세요">
			</div>
			<div class="form-group">
				<label for="pwd">Password</label> 
				<input type="password" class="form-control" 
						name="userPassword" required="required"
						placeholder="비밀번호를 입력하세요"><br>
			<div class="text-center">			
			<button type="submit" class="btn btn-warning">로그인</button>
			</div>
			</div>
		</form>
	</div>
	</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>