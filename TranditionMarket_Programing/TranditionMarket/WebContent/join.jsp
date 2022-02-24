<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function idCheck() {
		let userID = $('#userID').val();
		console.log(userID);
		$.ajax({
			type: "POST",
			url: "IdCheckController",
			data: { userID: userID }, 
			dataType: 'json',
			success: function(result) {
				console.log(result);
				if(result == 1) {
					alert("사용가능한 아이디입니다.");
				} else {
					alert("이미 사용중인 아이디입니다.");
				}
			}
		});
	}
	
	function passwordCheck() {
		var userPassword = $('#userPassword').val();
		console.log(userPassword);
		var userPassword2 = $('#userPassword2').val();
		console.log(userPassword2);
		if(userPassword != userPassword2) {
			$('#passwordCheckMessage').html("비밀번호가 불일치");
		} else {
			$('#passwordCheckMessage').html("비밀번호 일치");
		}
	}
		

</script>
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
        			<input type="text" class="form-control" id="userID" name="userID" required="required" placeholder="아이디">
					<button type="button" onclick="idCheck();" class="btn btn-warning btn-sm">중복확인</button>
					<input type="hidden" name="check" value="0">
    		</div>
    		
			<div class="form-group">
      			<label class="control-label col-sm-2" for="password">패스워드</label>
        			<input type="password" class="form-control" name="userPassword" id="userPassword" required="required" placeholder="패스워드">
    		</div>
    		
    		<div class="form-group">
      			<label class="control-label col-sm-3" for="password">패스워드확인</label>
      			<h5 style="color: red;" id="passwordCheckMessage"></h5>
        			<input type="password" class="form-control" name="userPassword2" id="userPassword2" onkeyup="passwordCheck();" required="required" placeholder="패스워드">
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
    			<h5 style="color: red;" id="passwordCheckMessage"></h5>
  				<input type="submit" value="가입하기" class="btn btn-warning mt-3">
  			</div>
		</form>
		</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
