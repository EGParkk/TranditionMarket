<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<jsp:include page="header.jsp"/>

	<div class="container m-5">
	<div class="row justify-content-center algin-items-center">
	<div class="col-3 border border-dark p-3"">
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

