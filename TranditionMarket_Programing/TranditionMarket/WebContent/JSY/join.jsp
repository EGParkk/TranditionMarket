<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Insert title here</title>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">
		<div class="row justify-content-center algin-items-center">
		<div class="col-4">
		<h2 class="text-center">회원가입</h2>
		<form class="form-horizontal" action="Join" method="POST" 
			name="joinForm" onsubmit="return CheckPassword()">
			
			<div class="form-group">
      			<label class="control-label col-sm-2" for="id">아이디</label>
        			<input type="text" class="form-control" name="userID" required="required" placeholder="아이디">
					<input type="button" value="중복확인" id="btn_idcheck" class="btn btn-warning btn-sm"">
					<input type="hidden" name="check" value="0">
    		</div>
    		
			<div class="form-group">
      			<label class="control-label col-sm-2" for="password">패스워드</label>
        			<input type="password" class="form-control" name="userPassword" required="required" placeholder="패스워드">
    		</div>
    		
			<div class="form-group">
      			<label class="control-label col-sm-2" for="name">이름</label>
        			<input type="text" class="form-control"  name="userName" required="required"	placeholder="이름">
    		</div>
    		
			<div class="form-group">
      			<label class="control-label col-sm-2" for="nickname">닉네임</label>
        			<input type="text" class="form-control" name="userNick" required="required" placeholder="닉네임">
    		</div>
 		
			<div class="form-group">
      			<label class="control-label col-sm-2" for="address">주소</label>
        			<input type="text" class="form-control" name="userAddress" required="required"
						placeholder="주소">
 	  		</div>
    		
			<div class="form-group">
      			<label class="control-label col-sm-2" for="email">이메일</label>
        			<input type="email" class="form-control" name="userEmail" required="required" placeholder="이메일">
    		</div>
    		<div class="form-group">
      			<label class="control-label col-sm-2" for="intro">자기소개</label>
        			<textarea class="form-control" name="userIntro" rows="3" required="required" placeholder="자기소개"></textarea>
    		</div>
    		<div class="form-group">
      			<label class="control-label col-sm-2" for="profile">프로필사진</label>
        			<input type="file" class="form-control" name="userImg" placeholder="프로필사진">
    		</div>
    		<div class="text-center">
  				<input type="submit" value="가입하기" class="btn btn-warning mt-3">
  			</div>
		</form>
		</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>